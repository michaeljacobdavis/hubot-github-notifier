module.exports = (req, cb) ->
  cb "Release *#{req.body.release.tag_name}* was *#{req.body.action}* for *#{req.body.repository.name}*. Woo-hoo! \n #{req.body.release.html_url}"