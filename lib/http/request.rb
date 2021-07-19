# frozen_string_literal: true

module Http
  module Request
    include Exceptions
    include Codes

    attr_reader :response, :code

    def get(uri:, params: {}, use_ssl: true)
      uri.query = URI.encode_www_form(params)
      url = Net::HTTP::Get.new(uri)

      args = [uri.hostname, uri.port, use_ssl: use_ssl]
      @response = Net::HTTP.start(*args){|ctx| ctx.request(url) }
      @code = response.code.to_i

      return JSON.parse(response.body, symbolize_names: true) if is_ok?
      raise error_class, "Code: #{code}, response: #{response.body}"
    end

    private

    def error_class
      case code
      when HTTP_BAD_REQUEST_CODE
        BadRequestError
      when HTTP_NOT_FOUND_CODE
        NotFoundError
      else
        ApiError
      end
    end

    def is_ok?
      code == HTTP_OK_CODE
    end
  end
end
