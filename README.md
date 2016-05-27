# hubot-rocketchat-ignore-direct
[![NPM version][npm-image]][npm-url]

Middleware to prevent hubot listeners from responding to direct messages for any bot that should only respond in channels.

Intended to allow a basic form of authorization for bot features.

e.g. Allow specific groups of users access to a bot's commands, add it to a channel only they can access.
It will ignore everyone else but can still message them one-way.

NB: Only works with Rocketchat bots using the hubot-rocketchat adapter.

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
