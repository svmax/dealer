# frozen_string_literal: true

describe ::Faker::Api::V1::CompanyService do
  let(:expectation) do
    {
      city: 'Denabury',
      zipcode: '18702-1529',
      phone: '+9814138416082',
      country: 'New Caledonia',
      location: [-0.51798, 65.314388],
      name: 'Stamm, Prohaska and Stehr',
      street: '593 Marks Mission Apt. 320',
      updated_at: 'Mon, 19 Jul 2021 07:49:58 +0000'
    }
  end

  context 'REST API usage' do
    before do
      allow(DateTime).to receive(:current).and_return(expectation[:updated_at])
    end

    it 'should receive companies list' do
      VCR.use_cassette('companies') do
        result = described_class.receive_all
        expect(result.first).to eq expectation
        expect(result.size).to eq 8
      end
    end
  end
end
