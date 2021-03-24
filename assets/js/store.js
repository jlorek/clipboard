function initStore() {
    let clipboardStore = Spruce.store('clipboard', {
        newdata: false,
        mimetype: "no mimetype",
        filename: "no filename",
        base64: "no base64",
    });

    Spruce.watch('clipboard.base64', () => { clipboardStore.newdata = true });
    Spruce.watch('clipboard.mimetype', () => { clipboardStore.newdata = true });
    Spruce.watch('clipboard.filename', () => { clipboardStore.newdata = true });
    
    console.log("Spruce initialized", Spruce)
}

export {
    initStore
}