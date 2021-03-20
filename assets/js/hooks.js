export default {
    Counter: {
        mounted() {
            console.log("Counter mounted")
            window.counterHook = this
        },
        decrement() {
            console.log("Hook decrement")
            this.pushEvent("decrement", {})
        },
        increment(selector) {
            console.log("Hook increment")
            this.pushEventTo(selector, "increment", {})
        }
    }
}