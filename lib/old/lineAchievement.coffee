{GitRepository} = require 'atom'
Achievement = require './achievement'

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

  main: ->
    repo = atom.project.getRepositories()[0]
    repo.onDidChangeStatuses ->
      console.log("nice")
    console.log repo

  register: ->
    event.keyup (e) ->
      return ? e.which is not 13
      isShift = false if e.which is 13
      console.log @repo.getPathStatus
      console.log "First commit, congrats!"
