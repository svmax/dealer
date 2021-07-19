describe Company, type: :model do
  it { is_expected.to be_mongoid_document }
  it { is_expected.to be_dynamic_document }

  it { is_expected.to have_field(:name).of_type(String) }
  it { is_expected.to have_field(:city).of_type(String) }
  it { is_expected.to have_field(:phone).of_type(String) }
  it { is_expected.to have_field(:street).of_type(String) }
  it { is_expected.to have_field(:country).of_type(String) }
  it { is_expected.to have_field(:zipcode).of_type(String) }
  it { is_expected.to have_field(:location).of_type(Array) }
  it { is_expected.to have_field(:updated_at).of_type(DateTime) }

  it { is_expected.to have_index_for(name: 1, city: 1).with_options(unique: true) }
end
