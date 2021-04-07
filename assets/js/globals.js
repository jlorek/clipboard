import { copyToClipboard } from "./clipboard"
import { Base64 } from "js-base64";
import { decodeDataUrl, tryNativeShare } from "./utils.js"

const toBase64 = file => new Promise((resolve, reject) => {
    const reader = new FileReader();
    reader.readAsDataURL(file);
    reader.onload = () => resolve(reader.result);
    reader.onerror = error => reject(error);
});

/**
 * Thanks!
 * https://web.dev/read-files/
 */
async function readLocalFile(event) {
    const file = event.target.files[0];
    
    if (!file.type) {
      console.error('The File.type property does not appear to be supported on this browser.');
      return;
    }

    if (!file.type.match('image.*')) {
      console.error('Error: The selected file does not appear to be an image.');
      return;
    }

    const base64 = await toBase64(file);

    const data = {
        mimetype: file.type,
        filename: file.name,
        base64: base64,
        size: file.size
    }
    
    console.log("Got local file", data)
    window.hooks.clipboard.upload(data)
}

function initGlobals() {
    window.Base64 = Base64;

    window.Clipboard = {
        copyToClipboard(text) {
            copyToClipboard(text);
        }
    };

    window.Utils = { decodeDataUrl, tryNativeShare, readLocalFile };
}

export {
    initGlobals
}