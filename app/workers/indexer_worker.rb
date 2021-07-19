# frozen_string_literal: true

class IndexerWorker
  include Sidekiq::Worker
  sidekiq_options queue: :indexer, retry: 2

  # NOTICE: Some of the seeded companies could be duplicated
  # Based on 19/07/2021 (FAKER_API_SEED=3):
  # c = companies.map{|item| item[:name] }
  # c.uniq.size == 198
  # c.size == 200
  def perform
    companies = ::Faker::Api::V1::CompanyService.receive_all
    return unless companies.any?

    accumulate! companies
    prune_before! companies.first[:updated_at]
  end

  private

  def accumulate!(batch)
    batch.each do |data|
      record = ::Company.find_or_initialize_by(name: data[:name])
      record.attributes = data
      record.save
    end
  end

  def prune_before!(date)
    ::Company.where(:updated_at.lt => date).destroy_all
  end
end
