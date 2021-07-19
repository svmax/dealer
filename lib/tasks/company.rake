namespace :dealer do
  desc 'Upload companies'
  task :ensure_companies => %w(environment) do
    ::IndexerWorker.new.perform
  end
end
