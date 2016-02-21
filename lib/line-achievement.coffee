{GitRepository} = require 'atom'
Achievement = require './achievement'
#$ = jQuery = require 'jquery'

module.exports =
class LineAchievement extends Achievement

  achLines = [5, 10, 20, 50, 100, 150, 200, 300, 400, 500, 750, 1000, 1250, 1500]
  achLinesText =
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

  constructor: (achievementTitle, achievementText, xp) ->
    super(achievementTitle, achievementText, xp)
    @registered = false
    @lineCount = 0

  countCodeLines: (editor) ->
    #op = '\#'|'\s'
    codeLines = 0
    lines = editor.getText().split('\n')
    len = editor.getText().split('\n').length
    #console.log lines
    x = 0
    for line in lines
      #console.log x
      #console.log line
      nofront = line.replace /^\s+/g, ""
      #console.log nofront
      x++
      if !(line.length == 0 | nofront[0] == '#')
         codeLines += 1
    return codeLines

  register: ->
    return if @registered
    @registered = true
    #console.log("ping")
    self = this

    atom.workspace.observeTextEditors (editor) ->
      view = atom.views.getView editor
      view.addEventListener 'keydown', (event) ->
        if event.which is 13
          #console.log self.countCodeLines(editor)

    # $(document).keypress (e) ->
    #   console.log(e.which)
    #   if (e.which is 13)
    #     console.log("noice")
    #
    #event.keyup -> (e)
      #return if e.which isnt 13
      #console.log countCodeLines
      # isShift = false if e.which is 13
