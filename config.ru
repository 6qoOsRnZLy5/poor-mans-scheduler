require 'rufus-scheduler'
require 'faraday'

HOOK_1 = ENV['DC_HOOK_1']
HOOK_2 = ENV['DC_HOOK_2']
HOOK_3 = ENV['DC_HOOK_3']
HOOK_4 = ENV['DC_HOOK_4']

scheduler = Rufus::Scheduler.new

scheduler.interval '1m' do
  puts "next rufus run! It's #{Time.now}"
  puts "------ UPDATING NEWS -------"
  response = Faraday.get HOOK_1
  puts response.headers unless response.status == 200
  sleep 1
  response = Faraday.get HOOK_2
  puts response.headers unless response.status == 200
  
  puts "rufus task should be done! It's #{Time.now}"
end

scheduler.interval '5m' do
  puts "next rufus run! It's #{Time.now}"
  puts "------ UPDATING SKINS -------"
  response = Faraday.get HOOK_3
  puts response.headers unless response.status == 200
  sleep 1
  response = Faraday.get HOOK_4
  puts response.headers unless response.status == 200
  
  puts "rufus task should be done! It's #{Time.now}"
end

scheduler.join
