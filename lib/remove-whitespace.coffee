{CompositeDisposable} = require 'atom'

module.exports = RemoveWhitespace =
  subscriptions: null
  originalString: ""
  removedString: ""

  activate: ->
    @subscriptions = new CompositeDisposable

    @subscriptions.add atom.commands.add 'atom-workspace', 'remove-whitespace:remove': => @remove()

  deactivate: ->
    @subscriptions.dispose()

  remove: ->
    if editor = atom.workspace.getActiveTextEditor()
      selection = editor.getSelectedText()
      newString = ""

      if @removedString is selection
        newString = @originalString
      else
        @originalString = selection
        @removedString = @originalString.replace(/\s+/g, "")
        newString = @removedString

      editor.insertText(newString)
      editor.selectLeft(newString.length)
