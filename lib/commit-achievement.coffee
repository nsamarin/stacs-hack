# CommitAchievement Class
# TODO: Check if status check indicates a commit or smth else

{GitRepository} = require 'atom'
Achievement = require './achievement'

module.exports =
class CommitAchievement extends Achievement

  constructor: (achievementTitle, achievementText, xp) ->
    super(achievementTitle, achievementText, xp)
    @repo = atom.project.getRepositories()[0]
    @registered = false
    @commitCount = 0
    @disposable = null

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
