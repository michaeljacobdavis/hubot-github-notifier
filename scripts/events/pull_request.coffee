module.exports = (req, cb) ->
  cb "Pull request *#{req.body.pull_request.title}* was #{req.body.action} by #{req.body.sender.login} for *#{req.body.repository.name}*. \n #{req.body.pull_request.html_url}"
