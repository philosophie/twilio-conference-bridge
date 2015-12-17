require 'bundler/setup'
Bundler.require

register Sinatra::Reloader

post '/incoming' do
  content_type 'text/xml'

  Twilio::TwiML::Response.new do |r|
    r.Gather action: '/conferences' do
      r.Play ENV['WELCOME_MESSAGE_URL']
    end
  end.text
end

post '/conferences' do
  content_type 'text/xml'

  Twilio::TwiML::Response.new do |r|
    r.Dial do
      r.Conference params[:Digits]
    end
  end.text
end
