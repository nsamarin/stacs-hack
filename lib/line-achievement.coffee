{GitRepository} = require 'atom'
Achievement = require './achievement'
Notification = require './notification'

module.exports =
class LineAchievement

  achLines : [5, 10, 20, 50, 100, 150, 200, 300, 400, 500, 750, 1000, 1250, 1500]
  achText : [
    "5 Lines",
    "10 Lines",
    "20 Lines",
    "50 Lines",
    "100 Lines",
    "150 Lines",
    "200 Lines",
    "300 Lines",
    "400 Lines",
    "500 Lines",
    "750 Lines",
    "1000 Lines",
    "1250 Lines",
    "1500 Lines"
  ]

  achDescription: [
    "One small step for a man, One big step for a mankind!",
    "I keep on going!",
    "Step by step, we are going forward!",
    "Keep on Coding, you are still just at the start!",
    "You are awesome, Begginer level reached with!",
    "Ein hundert und vierzig!",
    "Zwei Hundert, much programming, wow!",
    "One fifth of biggest achievement!",
    "Hundred more!",
    "Person, you have some determination!",
    "Halfway through!",
    "Tttttthousaaaaand!!",
    "Going pro!",
    "One and a half!"
  ]
  achXP: [5, 10, 20, 50, 100, 150, 200, 300, 400, 500, 750, 1000, 1250, 1500]

  constructor: () ->
    @notification = new Notification()
    @registered = false
    @lineCount = 0

  setData: (achievementTitle, achievementText, xp) ->
    @title = achievementTitle
    @text = achievementText
    @xp = xp

  countCodeLines: (editor) ->
    codeLines = 0
    lines = editor.getText().split('\n')
    len = editor.getText().split('\n').length
    x = 0
    for line in lines
      nofront = line.replace /^\s+/g, ""
      x++
      if !(line.trim().length == 0 | nofront[0] == '#')
         codeLines += 1
    console.log codeLines
    return codeLines

  handleEnterPresses: (count) ->
    @lineCount = count
    idx = @achLines.indexOf(@lineCount)
    return if idx is -1
    @notification.lineAchNotification @achText[idx], @achXP[idx], @achDescription[idx]
    @setData @achText[idx], @achDescription[idx], @achXP[idx]

  register: (enterPressed) ->
    return if @registered
    @registered = true
    self = this
    atom.workspace.observeTextEditors (editor) ->
      view = atom.views.getView editor
      view.addEventListener 'keydown', (event) ->
        if event.which is 13
          count = self.countCodeLines(editor)
          console.log "Enter press detected! Current line is", self.lineCount
          return if not self.handleEnterPresses(count)?
          enterPressed(self)

  output: () ->
    @title + " - " + @text + " - " + @xp + " xp"
