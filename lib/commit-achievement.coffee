# CommitAchievement Class
# TODO: Check if status check indicates a commit or smth else

{GitRepository} = require 'atom'
Achievement = require './achievement'

module.exports =
class CommitAchievement

  commits: [1, 5, 10]
  commitsText:
    ["One small step for a man, One big step for a mankind ",
    "I keep on going ",
    "Step by step, we are going forward ",
    "Keep on Coding, you are still just at the start ",
    "You are awesome, Begginer level reached with ",
    "Ein hundert und vierzig - ",
    "Zwei Hundert, much programming, wow - ",
    "One fifth of biggest achievement - ",
    "Hundred more - ",
    "Person, you have some determination - ",
    "Halfway through - ",
    "Tttttthousaaaaand! - ",
    "Going pro - ",
    "One and a half - "]

  constructor: () ->
    @repo = atom.project.getRepositories()[0]
    @registered = false
    @commitCount = 0
    @disposable = null

  setData: (achievementTitle, achievementText, xp) ->
    @title = achievementTitle
    @text = achievementText
    @xp = xp

  handleCommits: ->
    @commitCount++
    idx = @commits.indexOf(@commitCount)
    return if idx is -1
    title = @commitsText[idx]
    description = "Insert description"
    xp = -1
    @setData title, description, xp


  register: (committed) ->
    return if @registered
    self = this
    @registered = true
    console.log @repo.getOriginURL()
    @disposable = @repo.onDidChangeStatuses ->
      self.handleCommits()
      console.log "Commit count is " + self.commitCount
      committed(self)

  unregister: () ->
    return if @disposable?
    console.log @disposable

  output: () ->
    @title + " - " + @text + " - " + @xp + " xp"
