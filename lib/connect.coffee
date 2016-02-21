http = require 'http'
<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> origin/master
https = require 'https'

global.bla = []
global.ach = []
global.xp = []
<<<<<<< HEAD

module.exports =
  class Connect
    constructor: (name) ->
      @fr = name

    friends: ->
      ''
=======

module.exports =
  class Connect
    constructor: (name) ->
      @fr = name

    friends: ->
      ''
=======

module.exports =
  class Connect
>>>>>>> origin/master
>>>>>>> origin/master
    getAchievements: (user) ->
      http.get { host: 'www.lutzeyer.co.uk', path: '/stacs/db/' + user }, (res) ->
        data = ''
        responseJ = ''
        res.on 'data', (chunk) ->
            data += chunk.toString()
        res.on 'end', () ->
            responseJ = JSON.parse(data)
<<<<<<< HEAD
            global.ach.push(responseJ.achievements)


    getFriends: (user) ->
      root = exports ? this
      root.foo = -> 'ha'
      @fr = 'ho'
      responseJ = ''
      y = https.get {host: 'api.github.com', path: '/users/' + user + '/followers', headers: {"user-agent": "ach-atom"}}, (res) ->
=======
<<<<<<< HEAD
            global.ach.push(responseJ.achievements)


    getFriends: (user) ->
      root = exports ? this
      root.foo = -> 'ha'
      @fr = 'ho'
      responseJ = ''
      y = https.get {host: 'api.github.com', path: '/users/' + user + '/followers', headers: {"user-agent": "ach-atom"}}, (res) ->
=======
            console.log responseJ
            return responseJ

    getFriendsAchievements: (user) ->
      userAch = getAchievements(user)
      http.get {'https://www.github.com', path: '/' + 'tomcek112' + '/following'}, (res) ->
>>>>>>> origin/master
>>>>>>> origin/master
        data = ''
        res.on 'data', (chunk) ->
            data += chunk.toString()
        res.on 'end', () ->
<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> origin/master
          responseJ = JSON.parse(data)
          for ob in responseJ
            global.bla.push(ob.login)
          ###
          name_fol = data.match(/(\[{"login":"[a-z0-9]+)/).toString()
          name = name_fol.replace /(\[{"login":")/, ''
          root.name_real = name.replace /(\[{"login":")/, ''
          root.x = root.name_real.length
          if root.x % 2 == 0
            root.x = root.x - 1
          else
            root.x=root.x
          root.x = root.x / 2
          console.log root.name_real.substring(0,root.x)
          global.bla = root.name_real.substring(0,root.x)
        #@fr = global.bla
        console.log global.bla
        ###
      ###
      dick: () ->
        return root.name_real.substring(0,root.x)
      setTimeout (-> this.dick ) , 5000
      ###

    returnFriends: () ->
      friend = global.bla
      global.bla = []
      return friend

    returnAchievements: () ->
      achie = global.ach
      global.ach = []
      return achie
<<<<<<< HEAD
=======
=======
          console.log data
>>>>>>> origin/master
>>>>>>> origin/master

    addAchievement: (user, achievement, xp) ->
      xpString = xp.toString()
      http.get { host: 'www.lutzeyer.co.uk', path: '/stacs/db/' + user + '/add/' + achievement + '/' + xpString }, (res) ->
<<<<<<< HEAD
=======
<<<<<<< HEAD
=======
        console.log '/stacs/db/' + user + '/add/' + achievement + '/' + xpString
>>>>>>> origin/master
>>>>>>> origin/master
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
<<<<<<< HEAD
            return data

    getXP: (user) ->
      http.get { host: 'www.lutzeyer.co.uk', path: '/stacs/db/' + user }, (res) ->
        data = ''
        responseJ = ''
        res.on 'data', (chunk) ->
            data += chunk.toString()
        res.on 'end', () ->
            responseJ = JSON.parse(data)
            global.xp.push(responseJ.xp)

    returnXP: () ->
      xp = global.xp
      global.xp = []
      return xp
=======
<<<<<<< HEAD
            return data

    getXP: (user) ->
      http.get { host: 'www.lutzeyer.co.uk', path: '/stacs/db/' + user }, (res) ->
        data = ''
        responseJ = ''
        res.on 'data', (chunk) ->
            data += chunk.toString()
        res.on 'end', () ->
            responseJ = JSON.parse(data)
            global.xp.push(responseJ.xp)

    returnXP: () ->
      xp = global.xp
      global.xp = []
      return xp
=======
            console.log data
            return data
>>>>>>> origin/master
>>>>>>> origin/master
