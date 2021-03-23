import { setupPasteListener, copyToClipboard } from "./clipboard"
window.Clipboard = {
    /**
     * https://developer.mozilla.org/en-US/docs/Web/HTTP/Basics_of_HTTP/Data_URIs
     * data:[<mediatype>][;base64],<data>
     */
    decodeDataUrl(dataUrl) {
        if (!dataUrl.startsWith("data:")) {
            console.warn("Given dataUrl is not valid.", dataUrl);
            return false;
        }

        let base64start = dataUrl.indexOf(";base64,");
        if (base64start != -1) {
            let base64 = dataUrl.substring(base64start + 8);
            let plain = Base64.decode(base64);
            return plain;
        }

        let dataStart = dataUrl.indexOf(",");
        if (dataStart != -1) {
            let urlEncoded = dataUrl.substring(dataStart + 1);
            let plain = decodeURIComponent(urlEncoded);
            return plain;
        }

        return false;
    },

    copyToClipboard(text) {
        copyToClipboard(text);
    }
}

import { Base64 } from "js-base64";
window.Base64 = Base64;

export default {
    Counter: {
        mounted() {
            console.log("counter mounted")
            window.counterHook = this
        },
        updated() {
            console.log("counter updated");
        },
        decrement() {
            console.log("hook function decrement")
            this.pushEvent("decrement", {})
        },
        increment(selector) {
            console.log("hook function increment")
            this.pushEventTo(selector, "increment", {})
        }
    },

    clipboard: {
        mounted() {
            console.log("hook mounted for 'clipboard'", this.el)

            setupPasteListener((data) => {
                console.log("paste listener received data", data);
                // re-target event to self instead of parent
                // https://elixirforum.com/t/liveview-event-targeting-in-0-5x/28354
                // component events are sent to parent by default
                // https://github.com/surface-ui/surface/issues/20
                // this.pushEventTo(`#${this.el.id}`, "paste", data)

                // clipboard was promoted from component to own live_view
                this.pushEvent("paste", data)
            });
        }
    },
}