sql = null

module.exports =
  activate: (state) ->
    atom.workspaceView.command 'format:sql', ->
      formatSql()

formatSql = ->
  editor = atom.workspace.getActiveEditor()
  return unless editor?

  sql ?= require 'sql-parser'

  selectedText = editor.getSelectedText()

  if selectedText
    try
      tokens = sql.lexer.tokenize(selectedText)
      editor.insertText(sql.parser.parse(tokens).toString())
      
    catch error
      console.warn(error)

  else
    try
      tokens = sql.lexer.tokenize(editor.getText())
      editor.setText(sql.parser.parse(tokens).toString())

    catch error
      console.warn(error)
