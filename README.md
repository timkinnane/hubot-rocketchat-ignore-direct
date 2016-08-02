# hubot-rocketchat-ignore-direct
[![NPM version][npm-image]][npm-url]

Middleware to respond to DM's with canned text, preventing further listeners from responding to direct messages (for bots that should only respond in channels).

This is different to the default option of setting `RESPOND_TO_DM=false` because it allows the bot to respond, improving the experience by not stone-walling users.

e.g. Allow specific groups of users access to a bot's commands, add it to a channel only they can access.
It will ignore everyone else but can still message them one-way and provide static information on how to interact in channels.

See [`src/rocketchat-ignore-direct.coffee`](src/rocketchat-ignore-direct.coffee) for full documentation.

## Installation

In hubot project repo, run:

`npm install hubot-rocketchat-ignore-direct --save`

Then add **hubot-rocketchat-ignore-direct** to your `external-scripts.json`:

```json
["hubot-rocketchat-ignore-direct"]
```

## Sample Interaction

This is just middleware, it intercepts listeners but doesn't have any interaction other than an (optional) reply that it's ignoring direct messages.

In direct message

```
user1>> hubot do something, anything!?
hubot>> Sorry, I'm not listening.
```

In group channel

```
user1>> hubot do something, anything!?
hubot>> <whatever normal response>
```

[npm-url]: https://npmjs.org/package/hubot-rocketchat-ignore-direct
[npm-image]: http://img.shields.io/npm/v/hubot-rocketchat-ignore-direct.svg?style=flat
