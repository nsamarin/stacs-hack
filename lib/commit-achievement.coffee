{GitRepository} = require 'atom'

module.exports =
class CommitAchievement

  commits: [1, 3, 5]
  commitsText: [
    "First Commit",
    "Third Commit",
    "Fifth Commit",
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
    "One small step for a man, One big step for a mankind!",
    "I keep on going!",
    "Step by step, we are going forward!"
  ]
  commitsXP: [100, 200, 300]

  constructor: (notification) ->
    @notification = notification
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
    @notification.commitAchNotification @commitCount, @commitsXP[idx], @commitsDescription[idx]
    @setData @commitsText[idx], @commitsDescription[idx], @commitsXP[idx]


  register: (committed) ->
    return if @registered
    return if @repo?
    self = this
    @registered = true
    @disposable = @repo.onDidChangeStatuses ->
      console.log "Commit detected! Commit count is " + self.commitCount
      return if not self.handleCommits()?
      committed(self)

  unregister: () ->
    return if @disposable?
    console.log @disposable

  output: () ->
    @title + " - " + @text + " - " + @xp + " xp"
