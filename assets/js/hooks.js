export default {
    Counter: {
        mounted() {
            console.log("counter mounted")
            window.counterHook = this
            // this.el.addEventListener("count-updated", e => {
            //     console.log("got count-updated event", e)
            // })
        },
        updated() {
            console.log("counter updated");
            var count = this.el.getAttribute("count");
            console.log("count attribute", count)
            var event = new CustomEvent("count-updated", {
                detail: {
                    count: count
                }
            });
            console.log("dispatching event", event);
            this.el.dispatchEvent(event);
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