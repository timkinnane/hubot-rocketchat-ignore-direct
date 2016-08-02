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
#   Set empty response if you want cold silence ignores: `export IGNORE_RESPONSE=""`
#   Compares the room ID of each message with the direct room ID of the user
#
# Author:
#   Tim Kinnane @ 4thParty

{IGNORE_RESPONSE} = process.env

ignoreResponse = IGNORE_RESPONSE or "I'm sorry but I'm configured to ignore direct messages."

module.exports = (robot) ->

  silentIgnore = ignoreResponse is ""
  robot.logger.info "Ignore DMs behaviour is running, will respond with:"
  robot.logger.info "\"#{ unless silentIgnore then ignoreResponse else 'silence' }\""

  # check context before allowing any interaction to proceed
  robot.receiveMiddleware (context, next, done) ->
    roomID = context.response.message.room
    userID = context.response.message.user.id
    isDM = roomID.indexOf(userID) > -1

    if isDM
      unless silentIgnore
        context.response.reply ignoreResponse
      done() # Don't process further middleware.
    else
      next(done) # On to the next one
