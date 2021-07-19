# frozen_string_literal: true

describe ::Faker::Api::ConfigMixin do
  let(:url) { 'https://fakerapi.it' }

  it 'should check that the class has right host url' do
    expect(described_class::API_HOST).to eq url
  end

  it 'should contain seed constant' do
    expect { described_class::SEED }.to_not raise_error
  end

  it 'should contain company quantity constant' do
    expect { described_class::COMPANIES_QUANTITY }.to_not raise_error
  end
end
