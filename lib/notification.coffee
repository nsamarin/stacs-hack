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
      atom.notifications.addSuccess("Achievement Unlocked: You have #{numLines} lines! +#{xp} XP!", detail: description, icon: 'mortar-board')

    commitAchNotification: (numCommits, xp, description) ->
      atom.notifications.addSuccess("Achievement Unlocked: You have #{numCommits} commits! +#{xp} XP!", detail: description, icon: 'rocket')

    commentAchNotification: (numComments, xp, description) ->
      atom.notifications.addSuccess("Achievement Unlocked: You have #{numComments} comments! +#{xp} XP!", detail: description, icon: 'quote')
