# Twilio Conference Bridge

A simple Twilio conference call bridge.

## Setup & Use

Set `WELCOME_MESSAGE_URL` ENV var to the location of an audio file for the
welcome message.

1. `bundle install`
1. `ruby app.rb`
1. Configure Twilio to send incoming calls to `POST /incoming`
