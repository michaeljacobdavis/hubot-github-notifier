module.exports = (req, cb) ->
  if(req.body.action is "added")
    cb "A new *#{req.body.team.name}* member has appeared! *#{req.body.member.login}* was #{req.body.action} to *#{req.body.organization.login}*"
  else # if a person wasn't added they are removed.
    cb "*#{req.body.member.login}* was #{req.body.action} from *#{req.body.team.name}*. Sad day :("