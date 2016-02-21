module.exports =
class StacsHackView
  constructor: (serializedState) ->
    # Create root element
    @element = document.createElement('div')
    @element.classList.add('stacs-hack')

    # Create message element
    message = document.createElement('input')
    message.textContent = "The StacsHack package is Alive! It's ALIVE!"
    message.classList.add('message')
    @element.appendChild(message)

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @element.remove()

  getElement: ->
    @element

  setCount: (count) ->
    displayText = "There #{count} lines."
    @element.children[0].textContent = displayText
