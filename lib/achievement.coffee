# Achievement Class, provide the title (eg. First Commit)
# and description (Congrats on the first commit, man!!)
# in order to instatiate an achievement

# TODO: Add more useful stuff? Delete if overcomplicates


module.exports =
class Achievement
  constructor: (@achievementTitle, @achievementText, @xp) ->
  register: ->
  unregister: ->
  output: ->
    "Achievement (" + @achievementTitle + ", " + @achievementText + ", " + @xp + ")"
