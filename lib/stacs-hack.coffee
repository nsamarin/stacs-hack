StacsHackView = require './stacs-hack-view'
LineAchievement = require './line-achievement'
{CompositeDisposable} = require 'atom'

module.exports = StacsHack =
  stacsHackView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @stacsHackView = new StacsHackView(state.stacsHackViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @stacsHackView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'stacs-hack:toggle': => @toggle()

    @lineAchievement = new LineAchievement("Line Achievement", "Congrats on x lines", 0)

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @stacsHackView.destroy()

  serialize: ->
    stacsHackViewState: @stacsHackView.serialize()

  toggle: ->
    console.log 'StacsHack was toggled!'
    @lineAchievement.register()

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else

      # editor = atom.workspace.getActiveTextEditor()
      # lines = editor.getText().split('\n').length
      # @stacsHackView.setCount(lines)
      # @modalPanel.show()
