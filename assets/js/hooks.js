import { setupPasteListener } from "./clipboard"

export default {
    clipboard: {
        mounted() {
            console.log("hook mounted for 'clipboard'", this.el);
            window.hooks = window.hooks || {};
            window.hooks.clipboard = this;

            setupPasteListener((data) => {
                // console.log("paste listener received data", data);
                
                // re-target event to self instead of parent
                // https://elixirforum.com/t/liveview-event-targeting-in-0-5x/28354
                // component events are sent to parent by default
                // https://github.com/surface-ui/surface/issues/20
                // this.pushEventTo(`#${this.el.id}`, "paste", data)

                // clipboard was promoted from component to own live_view
                this.upload(data);
            });
        },

        /**
         * @param {Object} data - { filename, mimetype, base64 }
         */
        upload(data) {
            this.pushEvent("paste", data)
        }
    },

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
    }
}