/**
 * Sample NodeJS Salesforce OAuth2 authorization flow implementation.
 * @author dassiorleando
 */
require('dotenv').config();
const express = require("express");
const app = express();
const port = 3000;
const jsforce = require("jsforce");

// OAuth2 client
const oauth2 = new jsforce.OAuth2({
  // you can change loginUrl to connect to sandbox or prerelease env.
  //   loginUrl : 'https://test.salesforce.com',
  clientId: process.env.SF_CLIENT_ID,
  clientSecret: process.env.SF_CLIENT_SECRET,
  redirectUri: `${process.env.ROOT_DOMAIN}/oauth2/callback`,
});

// Simple ping
app.get("/ping", (req, res) => {
  res.send(">>> PONG! <<<");
});

// Get authorization url and redirect to it
app.get("/oauth2/auth", function (req, res) {
  const authURL = oauth2.getAuthorizationUrl({
    scope: "api web openid chatter_api refresh_token",
  });
  res.redirect(authURL);
});

// Pass the received authorization code and get access token
app.get("/oauth2/callback", function (req, res) {
  const conn = new jsforce.Connection({ oauth2: oauth2 });
  const code = req.param("code");

  conn.authorize(code, function (error, userInfo) {
    if (error) {
      console.error(error);
      return res.status(400).send(error);
    }

    // Now you have the access token, refresh token, and instance URL info
    // Save them in the db or cache to easily connection later
    console.log(conn.accessToken);
    console.log(conn.refreshToken);
    console.log(conn.instanceUrl);
    console.log("User ID: " + userInfo.id);
    console.log("Org ID: " + userInfo.organizationId);

    // Let's write in Chatter to test it out
    conn.chatter.resource("/feed-elements").create(
      {
        body: {
          messageSegments: [
            {
              type: "Text",
              text: "This is a NEW post",
            },
          ],
        },
        feedElementType: "FeedItem",
        subjectId: "me",
      },
      function (error, result) {
        if (error) {
          console.error(error);
          return res.status(400).send(error);
        }
        console.log("New comment of id: " + result.id);
        res.send("success");
      }
    );
  });

  conn.on("refresh", function (accessToken, res) {
    // Refresh event will be fired when renewed access token
    // TODO: do something here with the new access token
    console.log("Access token refreshed: " + accessToken);
  });
});

// Run the server so that it listens to incoming requests
app.listen(port, () => {
  console.log(`Sample NodeJS App listening at http://localhost:${port}`);
});
