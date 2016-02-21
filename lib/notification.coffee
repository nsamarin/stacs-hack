{GitRepository} = require 'atom'
LineAchievement = require './line-achievement'
CommitAchievement = require './commit-achievement'
User = require './user'

module.exports =
  class Notification
    constructor: ->
      @msg = ""

    allNotifications: ->
      allNotif = atom.notifications.getNotifications()
      for a in allNotif
        console.log a

    lineAchNotification: (numLines, xp, description) ->
      marker = #amount marker (every 100?)
      msg = "Write #{marker} amount of lines." #achievement message for surpassing certain amount of lines
      atom.notifications.addSuccess("Achievement Unlocked: You have #{numLines} lines! +#{xp} XP!", detail: description, icon: 'mortar-board')
      # User.addAchievement(msg)
      # return atom.notifications.getMessage()

    commitAchNotification: (numCommits, xp, description)->
      # marker = #amount marker (every 10?)
      atom.notifications.addSuccess("Achievement Unlocked: You have #{numCommits} commits! +#{xp} XP!", detail: description, icon: 'rocket')
      # msg = "Commit #{marker} times." #achievement message for certain amount of commits
      # User.addAchievement(msg)
      # return atom.notifications.getMessage()
