# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
group: do 'production'
every 30.minutes do
  Product.update_prices
  Wishes.all.each do |wish|
    catches = wish.find_catches
    catches.each do |caught|
      CatchMailer.catch(wish.user, caught, wish).deliver_now unless wish.notified
      wish.update(notified: true)
    end
  end
end
