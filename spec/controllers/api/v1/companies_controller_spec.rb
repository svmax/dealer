# frozen_string_literal: true

describe Api::V1::CompaniesController, type: :controller do
  describe '#index' do
    it 'should return empty array when nothing was indexed yet' do
      get :index

      expect(response.body).to eq([].to_json)
    end

    context 'companies in response' do
      let(:company_fields) { %w[id name city phone street zipcode country location updated_at] }

      before { create_list(:company, 5) }

      it 'will return company list' do
        get :index

        data = JSON.parse(response.body)
        expect(data.first.keys).to eq company_fields
        expect(data.size).to eq 5
      end
    end
  end
end
