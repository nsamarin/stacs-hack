{GitRepository} = require 'atom'
Achievement = require './achievement'

module.exports =
class CommitAchievement extends Achievement

  register: ->
    repo = atom.project.getRepositories()[0]
    repo.onDidChangeStatuses ->
      console.log repo.getPathStatus repo.getPath()
      console.log "First commit, congrats!"
