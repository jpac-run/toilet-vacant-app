# README

1. Create a Slack App and give it access to Slack Webhooks
  - Follow the documentation in this link: [Slack Webhooks](https://api.slack.com/incoming-webhooks)

2. Clone the repo
3. Run `bundle install`
4. Change `.env.example` to `.env`
  - SLACK_URL will be your Webhook URL
  - SLACK_CHANNEL will be your Slack channel
6. Run `rails db:create db:migrate db:seed`
7. Run `rails s` and go to `localhost:3000`
