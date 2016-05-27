# Description
#   Middleware to prevent hubot listeners from responding to direct messages.
#
# Configuration:
#   IGNORE_RESPONSE what the bot says when it ignores someone
#
# Commands:
#   N/A middleware only
#
# Notes:
#   Set IGNORE_RESPONSE to "" if you want cold silence ignores
#   Compares the room ID of each message with the direct room ID of the user
#   It will ignore by default if there's an error getting the direct room ID back from rocketchat
#
# Author:
#   Tim Kinnane @ 4thParty

{IGNORE_RESPONSE} = process.env

ignoreResponse = IGNORE_RESPONSE or "I'm sorry but I'm configured to ignore direct messages."

module.exports = (robot) ->

  # check context before allowing any interaction to proceed
  robot.receiveMiddleware (context, next, done) ->
    roomID = context.response.message.room
    userName = context.response.message.user.name
    robot.logger.info "Ignore-direct middleware evoked in #{ roomID } by #{ userName }"

    getDirectMessageRoomId_promise = robot.adapter.chatdriver.getDirectMessageRoomId userName
    getDirectMessageRoomId_promise.then (result) ->
      directID = result.rid or roomID # fail-safe default assume direct if request didn't return direct ID
      if roomID is directID
        robot.logger.info "Direct message from #{ userName } ignored"
        unless ignoreResponse is ""
          context.response.reply ignoreResponse
        done()
      else
        next(done)

    , (error) ->
      robot.logger.error "Couldn't get direct message room for #{ user }"
      context.response.message.finish() # Don't process this message further.
      done()
