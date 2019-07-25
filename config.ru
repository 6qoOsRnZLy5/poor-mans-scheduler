require 'rufus-scheduler'
require 'faraday'

HOOK_1 = ENV['DC_HOOK_1']
HOOK_2 = ENV['DC_HOOK_2']


scheduler = Rufus::Scheduler.new

scheduler.interval '1m' do
  puts "next rufus run! It's #{Time.now}"
  
  response = Faraday.get HOOK_1
  sleep 1
  response = Faraday.get HOOK_2
  
  puts "rufus task should be done! It's #{Time.now}"
end

scheduler.join
