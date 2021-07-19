# frozen_string_literal: true

describe IndexerWorker, type: :worker do
  describe 'properties' do
    it 'will check name of the queue' do
      expect(described_class.queue).to eq :indexer
    end

    it 'will make sure that IndexerWorker jobs are enqueued in the scheduled queue' do
      expect { described_class.perform_async }.to change(described_class.jobs, :size).by(1)
    end

    context 'performing data' do
      let(:company_name) { 'DUMMY_INC' }

      it 'should receive companies and persist it to the local DB' do
        expect(Company.count).to eq 0
        VCR.use_cassette('companies') { described_class.new.perform }
        expect(Company.count).to eq 8
      end

      it 'should remove useless records from the local DB if they are not received from API' do
        expect(Company.count).to eq 0
        create(:company, name: company_name)
        expect(Company.count).to eq 1

        VCR.use_cassette('companies') { described_class.new.perform }
        expect(Company.where(name: company_name).count).to eq 0
        expect(Company.count).to eq 8
      end

      it 'should not raise error while data is not received from 3rd-party' do
        allow(::Faker::Api::V1::CompanyService).to receive(:receive_all).and_return([])
        expect { described_class.new.perform }.to_not raise_error
        expect(Company.count).to eq 0
      end
    end
  end
end