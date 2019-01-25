require "active_support/all"
require 'net/http'
require 'httparty'

NAME_AND_ICON = {
  username: 'Toilet App',
  icon_emoji: ':toilet:'
}

SLACK_URL = ENV['SLACK_URL']
SLACK_CHANNEL = "##{ENV['SLACK_CHANNEL']}"

ActiveSupport::Notifications.subscribe "occupied.toilet" do |*args|
  
  # CHANNEL = '#test'.freeze
  # stuff = {
  #   title: 'Toilet iz free!!!',
  #   channel: CHANNEL
  # }
  # PARAMS = {
  #   payload: NAME_AND_ICON.merge(stuff).to_json
  # }
  # # event = ActiveSupport::Notifications::Event.new(*args)
  # xpto = {
  #   "text" => "hello"
  # }
  begin
    # uri = URI.parse(SLACK_URL)

    # response = Net::HTTP.new(uri.host, uri.port)
    # http = Net::HTTP.new(uri.host, uri.port)

    # request = Net::HTTP::Post.new(uri.path, initheader = {'Content-Type' =>'application/json'})
    # request.body = xpto.to_json
    # http.request(request)

    HTTParty.post(SLACK_URL,
      body: {
        "channel" => SLACK_CHANNEL,
        "username" => "jpachitas",
        "text" => "The :toilet: is occupied! :poop:"
      }.to_json,
      headers: { 
        'Content-Type' => 'application/json'
      }
    )
  rescue => e
    Rails.logger.error("Toilet: Error when sending: #{e.message}")
  end
end

ActiveSupport::Notifications.subscribe "vacant.toilet" do |*args|
  begin
    HTTParty.post(SLACK_URL,
      body: {
        "channel" => SLACK_CHANNEL,
        "username" => "jpachitas",
        "text" => "The :toilet: iz FREEEEEEE!"
      }.to_json,
      headers: { 
        'Content-Type' => 'application/json'
      }
    )
  rescue => e
    Rails.logger.error("Toilet: Error when sending: #{e.message}")
  end
end
