# frozen_string_literal: true

module Api
  module V1
    class CompaniesController < ::ApplicationController
      render_interactions :index
    end
  end
end
