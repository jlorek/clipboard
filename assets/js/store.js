function initStore() {
    Spruce.store('clipboard', {
        base64: "no base64",
        mimetype: "no mimetype",
        filename: "no filename",
        newdata: false
    });

    console.log("Spruce initialized", Spruce)
}

export {
    initStore
}