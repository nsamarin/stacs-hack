module.exports =
class LineCounterView
  constructor: (serializedState) ->
    # Create root element
    @element = document.createElement('div')
    @element.classList.add('line-counter')

    # Create message element
    #message = document.createElement('div')
    #message.textContent = "The LineCounter package is Alive! It's ALIVE!"
    #message.classList.add('message')
    #@element.appendChild(message)


  lineCountAchievement: (lines) ->
    message = document.createElement('div')
    message.textContent = "Achievement Unlocked: You wrote at least 50 lines!"
    if (lines) >= 50
      message.classList.add('message')
      @element.appendChild(message)

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @element.remove()

  getElement: ->
    @element
