LineCounterView = require './line-counter-view'
{CompositeDisposable} = require 'atom'

module.exports = LineCounter =
  lineCounterView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @lineCounterView = new LineCounterView(state.lineCounterViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @lineCounterView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'line-counter:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @lineCounterView.destroy()

  serialize: ->
    lineCounterViewState: @lineCounterView.serialize()

  countCodeLines: ->
    op = \#|\s
    codeLines = 0
    editor = atom.workspace.observeTextEditors(callback)
    len = editor.getText().split(\n).length
    for i in [0 .. len]
      if (!editor.lineTextForBufferRow(i).match op)
         codeLines += 1
    return codeLines

  toggle: ->
    #console.log 'LineCounter was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      # editor = atom.workspace.observeTextEditors(callback)
      # lines = editor.getgetText().split(\n).length
      codeLines = this.countCodeLines()
      @LineCounterView.lineCountAchievement(codeLines)
      @modalPanel.show()
