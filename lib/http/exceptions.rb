# frozen_string_literal: true

module Http
  module Exceptions
    class ApiError < StandardError; end
    class NotFoundError < ApiError; end
    class BadRequestError < ApiError; end
  end
end