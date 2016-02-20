StacsHackView = require './stacs-hack-view'
LineAchievement = require './line-achievement'
CommitAchievement = require './commit-achievement'
User = require './user'

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

    @user = new User()
    @lineAchievement = new LineAchievement("Line Achievement", "Congrats on x lines", 0)
    @commitAchievement = new CommitAchievement()


  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @stacsHackView.destroy()

  serialize: ->
    stacsHackViewState: @stacsHackView.serialize()

  addDataToUser: (achievement) ->
    @user.addXP(achievement.xp)
    @user.addAchievement(achievement)
    console.log "Current level is", @user.level, "Current xp is", @user.xp

  toggle: ->
    self = this
    console.log 'AchieveTheAtom (ATA) has started! Get your XP!'
    # @lineAchievement.register()

    @commitAchievement.register (achievement) ->
      self.addDataToUser(achievement)


    if @modalPanel.isVisible()
      @modalPanel.hide()
    else

      # editor = atom.workspace.getActiveTextEditor()
      # lines = editor.getText().split('\n').length
      # @stacsHackView.setCount(lines)
      # @modalPanel.show()
