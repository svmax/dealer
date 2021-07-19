# frozen_string_literal: true

describe ::Faker::Api::V1::VersionMixin do
  let(:version) { 'v1' }

  it 'should contain right api version constant' do
    expect(described_class::API_VERSION).to eq version
  end
end
