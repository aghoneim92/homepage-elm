#!/usr/bin/env node

const {readFileSync, writeFileSync} = require('fs')

const contents = readFileSync('./index.html')
  .toString()
  .replace(
    '<script type="text/javascript">Elm.Main.fullscreen()</script>',
    `</script><script src="js/index.js"></script>
     <link rel="stylesheet" href="css/index.css"/>`
  )
  .replace(
    /<title>.*<\/title>/,
    "<title>Ahmed Ghoneim's Personal Homepage</title>"
  )

writeFileSync('index.html', contents)
