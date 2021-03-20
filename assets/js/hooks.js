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
    }
}