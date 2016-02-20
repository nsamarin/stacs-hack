# CommitAchievement Class
# TODO: Check if status check indicates a commit or smth else

{GitRepository} = require 'atom'
Achievement = require './achievement'

module.exports =
class CommitAchievement

  constructor: () ->
    @repo = atom.project.getRepositories()[0]
    @registered = false
    @commitCount = 0
    @disposable = null

  setData: (achievementTitle, achievementText, xp) ->
    @achievementTitle = achievementTitle
    @achievementText = achievementText
    @xp = xp

  register: (committed) ->
    return if @registered
    @registered = true
    console.log @repo.getOriginURL()
    @disposable = @repo.onDidChangeStatuses ->
      @commitCount++
      console.log "Commit count is " + @commitCount
      console.log "First commit, congrats!"
      committed(@commitCount)

  unregister: () ->
    return if @disposable?
    console.log @disposable
