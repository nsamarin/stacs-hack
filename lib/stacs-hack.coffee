StacsHackView = require './stacs-hack-view'
LineAchievement = require './line-achievement'
CommitAchievement = require './commit-achievement'
CommentAchievement = require './comment-achievement'
Notification = require './notification'

Connect = require './connect'
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

    @notification = new Notification()
    @connect = new Connect()

    @lineAchievement = new LineAchievement(@notification)
    @commitAchievement = new CommitAchievement(@notification)
    @commentAchievement = new CommentAchievement(@notification)

    self = this
    @connect.getUser("Bob")
    setTimeout (->
      self.createUser self.connect.returnUser("Bob")),
      1000

  createUser: (data) ->
    @user = new User(data.username)
    @user.addXP(data.xp)
    achievements = data.achievements.split(" ")
    for a in achievements
      @user.addAchievement a
    console.log @user.username, ": Current level is", @user.level, "Current xp is", @user.xp

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @stacsHackView.destroy()

  serialize: ->
    stacsHackViewState: @stacsHackView.serialize()

  addDataToUser: (achievement) ->
    lvl = @user.level
    @user.addXP(achievement.xp)
    if lvl isnt @user.level
      atom.notifications.addSuccess("Achievement Unlocked: You have reached level #{@user.level}", detail: "Going strong!", icon: 'ruby')
    @user.addAchievement(achievement)
    console.log achievement.output()
    @connect.addUser(@user.username)
    @connect.addAchievement(@user.username, achievement.title.replace(" ", "_"), achievement.xp)
    console.log @user.username, ": Current level is", @user.level, "Current xp is", @user.xp

  toggle: ->
    self = this
    console.log 'AchieveTheAtom (ATA) has started! Get your XP!'

    @lineAchievement.register (achievement) ->
      self.addDataToUser(achievement)

    @commitAchievement.register (achievement) ->
      self.addDataToUser(achievement)

    @commentAchievement.register (achievement) ->
      self.addDataToUser(achievement)

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      # @modalPanel.show()
