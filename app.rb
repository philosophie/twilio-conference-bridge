require 'bundler/setup'
Bundler.require

register Sinatra::Reloader

post '/incoming' do
  content_type 'text/xml'

  Twilio::TwiML::Response.new do |r|
    r.Say 'Hello. You\'ve reached Philosophie. Please enter your room number ' \
          'followed by the pound key.',
          voice: 'woman'

    r.Gather action: '/conferences'
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
