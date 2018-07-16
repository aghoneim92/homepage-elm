const app = Elm.Main.fullscreen()

window.onkeyup = ({ key }) => {
    app.ports.keyPressed.send(key)
}
