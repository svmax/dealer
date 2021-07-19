# frozen_string_literal: true

module Api
  module V1
    module Company
      class IndexInteraction < BaseInteraction
        integer :page, default: 1
        integer :per, default: 10

        # NOTICE: The best approach for this endpoint is to provide
        # geolocation selection based on the shape of coordinates given
        # by Google Maps (polygon). That means that it will return the
        # records which are contained in the polygon and nothing more.
        # Also, based on this approach, we'll be able to group the
        # records depending on zoom level. So, for example, if we
        # have 10k dealers in the selected area - that will return
        # few grouped records to show how much of them are contained
        # in a specific district or part of the map.
        def execute
          serialize_all ::Company.all
        end

        private

        def serialize_all(collection)
          collection.map do |c|
            {
              id: c[:_id].to_s,
              name: c[:name],
              city: c[:city],
              phone: c[:phone],
              street: c[:street],
              zipcode: c[:zipcode],
              country: c[:country],
              location: c[:location],
              updated_at: c[:updated_at]
            }
          end
        end
      end
    end
  end
end
