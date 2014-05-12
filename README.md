# Format SQL

Format SQL Statement package.

From:

    select a,b from foo join bar on val1 = val2 where id = 123 and cd = 99

To:

    SELECT `a`, `b`
      FROM `foo`
      JOIN `bar`
        ON (`val1` = `val2`)
      WHERE ((`id` = 123) and (`cd` = 99))

If you want you can add this code to you `keymap.cson` to add a shortcut.

    '.editor':
      'f5': 'format:sql'

![format-sql-screenshot](https://cloud.githubusercontent.com/assets/7937/2948422/e7c4cdec-da01-11e3-832d-340c15f5b358.gif)
