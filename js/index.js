const app = Elm.Main.fullscreen()

const url = '//cdn.mozilla.net/pdfjs/helloworld.pdf';

// Loaded via <script> tag, create shortcut to access PDF.js exports.
const pdfjsLib = window['pdfjs-dist/build/pdf'];

// The workerSrc property shall be specified.
pdfjsLib.GlobalWorkerOptions.workerSrc = 'pdfjs/build/pdf.worker.min.js';

window.onkeyup = ({ key }) => {
    app.ports.keyPressed.send(key)
}
