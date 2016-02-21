# CommitAchievement Class

{GitRepository} = require 'atom'

module.exports =
class CommentAchievement

  comments: [10, 15, 25]
  commentsText: [
    "Good Code",
    "Nice Code",
    "Awesome Code",
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

  commentsDescription: [
    "One small step for a man, One big step for a mankind",
    "I keep on going",
    "Step by step, we are going forward"
  ]
  commentsXP: [20, 30, 50]

  constructor: () ->
    @repo = atom.project.getRepositories()[0]
    @registered = false
    @commentCount = 0
    @disposable = null

  setData: (achievementTitle, achievementText, xp) ->
    @title = achievementTitle
    @text = achievementText
    @xp = xp

  handleComments: (count) ->
    @commentCount = count
    return if count < @comments[0]
    if (count < @comments[1])
      idx = 0
    else if (count < @comments[2])
      idx = 1
    else
      idx = 2
    @setData @commentsText[idx], @commentsDescription[idx], @commentsXP[idx]


  countCodeLines: (editor)->
    codeLines = 0
    hashLines = 0
    lines = editor.getText().split('\n')
    len = editor.getText().split('\n').length
    x = 0
    for line in lines
      nofront = line.replace /^\s+/g, ""
      x++
      if !(line.length == 0 | nofront[0] == '#')
         codeLines += 1
      if nofront[0] == '#'
         hashLines += 1
    return Math.round ((hashLines / codeLines) * 100)

  register: (committed) ->
    return if @registered
    self = this
    @registered = true
    @disposable = @repo.onDidChangeStatuses ->
      atom.workspace.observeTextEditors (editor) ->
        view = atom.views.getView editor
        view.addEventListener 'click', (event) ->
          view.removeEventListener 'click', arguments.callee
          count = self.countCodeLines(editor)
          console.log "Commit detected! Comment count is " + count
          return if not self.handleComments(count)?
          committed(self)

  unregister: () ->
    return if @disposable?
    console.log @disposable

  output: () ->
    @title + " - " + @text + " - " + @xp + " xp"
