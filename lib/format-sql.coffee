sql = null

module.exports =
  activate: (state) ->
    atom.commands.add 'atom-workspace',
      'format:sql': ->
        formatSql()

formatSql = ->
  editor = atom.workspace.getActiveTextEditor()
  return unless editor?

  sql ?= require 'sql-parser'

  selectedText = editor.getSelectedText()

  lastChar = ''
  if selectedText
    if selectedText.substr(selectedText.length - 1) is ';'
      lastChar = ';'
      text = selectedText.substring(0, editor.getText().length - 1)
    else
      text = selectedText

    try
      tokens = sql.lexer.tokenize(text)
      editor.insertText(sql.parser.parse(tokens).toString() + lastChar)
    catch error
      console.warn(error)

  else
    if editor.getText().substr(editor.getText().length - 1) is ';'
      lastChar = ';'
      text = editor.getText().substring(0, editor.getText().length - 1)
    else
      text = editor.getText()

    try
      tokens = sql.lexer.tokenize(text)
      editor.setText(sql.parser.parse(tokens).toString() + lastChar)
    catch error
      console.warn(error)
