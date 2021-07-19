# frozen_string_literal: true

class Company
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  field :name, type: String
  field :city, type: String
  field :phone, type: String
  field :street, type: String
  field :zipcode, type: String
  field :country, type: String
  field :location, type: Array
  field :updated_at, type: DateTime

  index({ name: 1, city: 1 }, { unique: true })

  # NOTICE: Considering that we're receiving fake data,
  # there is no sense to validate the zip code or
  # phone number, or something else.
end
