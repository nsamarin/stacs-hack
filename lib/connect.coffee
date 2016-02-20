AchView = require './ach-view'
http = require 'http'
{CompositeDisposable} = require 'atom'

module.exports = Ach =
  achView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @achView = new AchView(state.achViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @achView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'ach:toggle': => @toggle()



  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @achView.destroy()

  serialize: ->
    achViewState: @achView.serialize()

  toggle: ->
    console.log 'Ach was toggled!'
    root = exports ? this
    root.foo = -> ''

    http.get { host: 'www.lutzeyer.co.uk', path: '/stacs/db/tomcek112' }, (res) ->
      data = ''
      responseJ = ''
      res.on 'data', (chunk) ->
          data += chunk.toString()
      res.on 'end', () ->
          responseJ = JSON.parse(data)
          console.log responseJ
          root.foo = responseJ
      ###
    http.get { host: 'www.lutzeyer.co.uk', path: '/stacs/db/tomcek112'  }, (res) ->
      data = ''
      res.on 'data', (chunk) ->
        data += chunk.toString()
      res.on 'end', () ->
        console.log data
###
    if @modalPanel.isVisible()
        @modalPanel.hide()
    else
        @achView.setHTML()
        @modalPanel.show()
