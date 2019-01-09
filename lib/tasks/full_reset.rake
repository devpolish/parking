# frozen_string_litetal: true

require Rails.root.join('config', 'environment.rb')

desc 'Check database connection with ActiveRecord'
namespace :db do
  task :check_connection do
  begin
    ActiveRecord::Base.establish_connection
    ActiveRecord::Base.connection
    puts 'Connected' if ActiveRecord::Base.connected?
    puts 'Failed to connect' unless ActiveRecord::Base.connected?
  rescue => e
    logger.debug e.backtrace
  end
  end
end