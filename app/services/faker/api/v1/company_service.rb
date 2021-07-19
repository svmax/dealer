# frozen_string_literal: true

module Faker
  module Api
    module V1
      class CompanyService
        extend Http::Request
        extend VersionMixin
        extend ConfigMixin

        class << self
          def receive_all
            serialize_all get(uri: uri, params: params)
          end

          private

          def serialize_all(payload)
            return [] if payload.blank?

            comp_fields = %i[name phone country]
            date = DateTime.current

            payload[:data].reduce([]) do |memo, company|
              output = company.slice(*comp_fields)
              output[:updated_at] = date
              output.merge!(extract_address(company))
              memo << output
            end
          end

          def extract_address(company)
            addr = company[:addresses]&.first
            return {} unless addr

            output = addr&.slice(:zipcode, :street, :city) || {}
            output[:location] = [addr[:longitude], addr[:latitude]]
            output
          end

          def uri
            URI([API_HOST, 'api', API_VERSION, 'companies'].join('/'))
          end

          def params
            { _seed: SEED, _quantity: COMPANIES_QUANTITY }
          end
        end
      end
    end
  end
end
