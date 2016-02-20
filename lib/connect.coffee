http = require 'http'

module.exports =
  class Connect
    getAchievements: (user) ->
      http.get { host: 'www.lutzeyer.co.uk', path: '/stacs/db/tomcek112' }, (res) ->
        data = ''
        responseJ = ''
        res.on 'data', (chunk) ->
            data += chunk.toString()
        res.on 'end', () ->
            responseJ = JSON.parse(data)
            console.log responseJ
            return responseJ
