StacsHackView = require './stacs-hack-view'
http = require 'http'
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

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @stacsHackView.destroy()

  serialize: ->
    stacsHackViewState: @stacsHackView.serialize()

  toggle: ->
    console.log 'StacsHack was toggled!'
    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
