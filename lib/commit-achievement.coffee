# CommitAchievement Class
# TODO: Check if status check indicates a commit or smth else

{GitRepository} = require 'atom'

module.exports =
class CommitAchievement

  commits: [1, 2, 3]
  commitsText: [
    "First Commit!",
    "Second Commit!",
    "Thrid Commit!",
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

  commitsDescription: [
    "One small step for a man, One big step for a mankind",
    "I keep on going",
    "Step by step, we are going forward"
  ]
  commitsXP: [100, 200, 300]

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
    @setData @commitsText[idx], @commitsDescription[idx], @commitsXP[idx]


  register: (committed) ->
    return if @registered
    self = this
    @registered = true
    @disposable = @repo.onDidChangeStatuses ->
      self.handleCommits()
      console.log "Commit detected! Commit count is " + self.commitCount
      committed(self)

  unregister: () ->
    return if @disposable?
    console.log @disposable

  output: () ->
    @title + " - " + @text + " - " + @xp + " xp"
