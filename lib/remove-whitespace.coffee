{CompositeDisposable} = require 'atom'

module.exports = RemoveWhitespace =
  subscriptions: null

  config:
    insertString:
      type: 'string'
      default: '-'

  activate: ->
    @subscriptions = new CompositeDisposable

    @subscriptions.add atom.commands.add 'atom-workspace',
      'remove-whitespace:remove': => @replace(/\s+/g, ''),
      'remove-whitespace:shrink': => @replace(/\s+/g, ' '),
      'remove-whitespace:replace': => @replace(/\s+/g, atom.config.get('remove-whitespace.insertString'))

  deactivate: ->
    @subscriptions.dispose()

  replace: (regexp, str) ->
    if editor = atom.workspace.getActiveTextEditor()
      selections = editor.getSelections()
      for selection in selections
        text = selection.getText()
        selection.insertText(text.replace(regexp, str))
