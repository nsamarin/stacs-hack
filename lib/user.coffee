# User class, stores info about user's XP, achievements, levels

module.exports =
class User

  achievements: []
  xp: 0
  level: 0

  constructor: ->

  addAchievement: (achievement) ->
    @achievements.push(achievement)

  addXP: (xp) ->
    @xp += xp
    if @xp >= 100
      @level = Math.round (@xp / 100)
