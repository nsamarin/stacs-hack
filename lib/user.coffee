# User class, stores info about user's XP, achievements, levels

module.exports =
class User

  achievements: []
  xp: 0
  level: 1

  constructor: ->

  addAchievement: (achievement) ->
    @achievements.push(achievement)
    achievement.output()

  addXP: (xp) ->
    @xp += xp
    if @xp >= 100
      @xp = Math.round (@xp / 100)
