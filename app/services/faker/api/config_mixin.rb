# frozen_string_literal: true

module Faker
  module Api
    module ConfigMixin
      API_HOST = 'https://fakerapi.it'
      SEED = ENV.fetch('FAKER_API_SEED') { 1 }
      COMPANIES_QUANTITY = ENV.fetch('FAKER_API_COMPANIES_QUANTITY') { 200 }
    end
  end
end
