# Description:
#   Github event notification
#
# Dependencies:
#   None
#
# Commands:
#   None

url = require('url')
querystring = require('querystring')
path = require('path')

module.exports = (robot) ->
  robot.router.post '/hubot/github-notifier-hook', (req, res) ->
    query = querystring.parse(url.parse(req.url).query)
    rooms = query.room

    try
      announce req, (message) ->
        if Array.isArray(rooms)
          for room in rooms
            do (room) ->
              robot.messageRoom room, message
        else
          robot.messageRoom rooms, message

    catch error
      console.log "github notifier error: #{error}. Request: #{req.body}"
      console.log error.stack

    res.end ""


announce = (req, cb) ->
  try
    require(path.join(__dirname, 'events', req.headers['x-github-event']))(req, cb)
  catch error
    console.log "github notifier error: event type not found: #{req.headers['x-github-event']}}"
    console.log error
    console.log error.stack
