import { copyToClipboard } from "./clipboard"
import { Base64 } from "js-base64";
import { decodeDataUrl, tryOpenShareSheet } from "./utils.js"

function initGlobals() {
    window.Base64 = Base64;

    window.Clipboard = {
        copyToClipboard(text) {
            copyToClipboard(text);
        }
    };

    window.Utils = { decodeDataUrl, tryOpenShareSheet };
}

export {
    initGlobals
}