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
    code = params[:Digits]
    pronounceable_code = code.to_s.each_char.to_a.join(' ')

    r.Say "You entered #{pronounceable_code}. You will now join the conference.",
          voice: 'woman'

    r.Dial do
      r.Conference code
    end
  end.text
end
