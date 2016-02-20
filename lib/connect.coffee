http = require 'http'

module.exports =
  class Connect
    getAchievements: (user) ->
      http.get { host: 'www.lutzeyer.co.uk', path: '/stacs/db/' + user }, (res) ->
        data = ''
        responseJ = ''
        res.on 'data', (chunk) ->
            data += chunk.toString()
        res.on 'end', () ->
            responseJ = JSON.parse(data)
            console.log responseJ
            return responseJ

    getFriendsAchievements: (user) ->
      userAch = getAchievements(user)
      http.get {'https://www.github.com', path: '/' + 'tomcek112' + '/following'}, (res) ->
        data = ''
        res.on 'data', (chunk) ->
            data += chunk.toString()
        res.on 'end', () ->
          console.log data

    addAchievement: (user, achievement, xp) ->
      xpString = xp.toString()
      http.get { host: 'www.lutzeyer.co.uk', path: '/stacs/db/' + user + '/add/' + achievement + '/' + xpString }, (res) ->
        console.log '/stacs/db/' + user + '/add/' + achievement + '/' + xpString
        data = ''
        res.on 'data', (chunk) ->
            data += chunk.toString()
        res.on 'end', () ->
          console.log data
          return data

    addUser: (user) ->
      http.get { host: 'www.lutzeyer.co.uk', path: '/stacs/db/adduser/' + user }, (res) ->
        data = ''
        res.on 'data', (chunk) ->
            data += chunk.toString()
        res.on 'end', () ->
            console.log data
            return data
