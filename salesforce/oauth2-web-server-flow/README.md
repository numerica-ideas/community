# Salesforce OAuth 2.0 Web Server Flow in NodeJS&nbsp;[![Hits](https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fgithub.com%2Fnumerica-ideas%2Fcommunity%2Ftree%2Fmaster%2Fsalesforce%2Foauth2-web-server-flow&count_bg=%2379C83D&title_bg=%23555555&icon=&icon_color=%23E7E7E7&title=hits&edge_flat=false)](https://numericaideas.com/blog/salesforce-oauth2-web-server-flow)

This repository is about demonstrating a sample implementation of the Salesforce OAuth2 authorization flow in NodeJS using the [jsforce](https://jsforce.github.io/) package.

**Read the related article written by "Orleando Dassi" on the blog**: https://numericaideas.com/blog/salesforce-oauth2-web-server-flow

## Credentials

Provide your **Salesforce** credentials as environment variables in the `.env` file which should looks like `.env.sample`.

## Deployment

For the redirect URI to work, you have to deploy it online and not relying on localhost unless you are tunneling your local/test environment using [Ngrok](https://ngrok.com/docs/getting-started/).
Once deployed, you should change your **APP_DOMAIN** environment variable accordingly since it represents the root endpoint where the App is deployed.

## Run

It's a normal **NodeJS** project, so you can run it via `npm start`.
