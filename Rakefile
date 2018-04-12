# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks

desc 'Import source data'
namespace :import do
  desc 'Import organizations'
  task :organizations, [:filename] => :environment do |_cmd, args|
    raise ArgumentError, 'A filename is required: `rake import:organizations[foo.json]`' if args.filename.blank?
    hash = File.open(args.filename) do |f|
      JSON.parse(f.read)
    end
    hash.fetch('records', []).each do |record|
      Organization.create(data: record)
    end
  end
end
