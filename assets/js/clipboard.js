// required for async
import "regenerator-runtime/runtime.js";
import { Base64 } from "js-base64";

let pasteCallback = undefined;

function setupPasteListener(callback) {
    pasteCallback = callback;
    window.addEventListener("paste", onPaste, false);
}

async function onPaste(event) {
    // required?
    event.preventDefault();
    // console.log("this.pasteCallback", pasteCallback);

    // const clipboardData = (event.clipboardData || window.clipboardData)
    if (!event.clipboardData) {
        console.error("No Clipboard data attached to event.");
        return;
    }

    // var items = event.clipboardData.items;
    var items = [];
    for (let item of event.clipboardData.items) {
        items.push(item);
    }
    items.sort(compareDataTransferItems);

    for (let item of items) {
        console.log(item);
        // must be saved for Chrome,
        // otherwise item.type is empty
        // after waiting for async result
        const mimetype = item.type;
        // let data = undefined;

        // eg. text/plain, text/html, text/uri-list
        if (item.kind === "string") {
            let text = await readText(item);
            if (text) {
                pasteCallback({
                    mimetype: "text/plain",
                    filename: "clipboard.txt",
                    base64: "data:text/plain;base64," + Base64.encode(text),
                    data: text
                });
                return;
            }
        }

        // eg. image/png, application/octet
        if (item.kind === "file") {
            let file = await readFile(item);
            if (file) {
                pasteCallback({
                    mimetype: mimetype,
                    filename: file.name,
                    base64: file.base64,
                    data: file.base64
                });
                return;
            }
        }
    }
    console.log("No suitable paste data found.")
}

// chrome text order: plain, html
// safari text order: html, plain
// chrome file order: plain, file
// safari file order: file
// desired order: file -> text/plain -> everything else
function compareDataTransferItems(a, b) {
    if (a.kind === "file") {
        if (b.kind !== "file") {
            return -1;
        }
    }
    if (a.type === "text/plain") {
        if (b.type !== "text/plain") {
            return -1;
        }
    }
    return 0;
}

async function readText(dataTransferItem) {
    var text = await toString(dataTransferItem);
    // console.log("Got text from paste", text);
    return text;
}

async function readFile(dataTransferItem) {
    const file = dataTransferItem.getAsFile();
    console.log("Got file from paste", file);
    // file.name/size/type
    if (file.size > 5_000_000) {
        console.error("File size exceeds limits.");
        return undefined;
    }
    if (file.size === 0) {
        console.warn("File size is undefined, maybe an unsynced cloud drive file.");
        return undefined;
    }
    var base64 = await toBase64(file);
    // console.log("File content", base64);
    return { name: file.name, base64: base64 };
}

const toBase64 = file => new Promise((resolve, reject) => {
    const reader = new FileReader();
    reader.readAsDataURL(file);
    reader.onload = () => resolve(reader.result);
    reader.onerror = error => reject(error);
});

const toString = dataTransferItem => new Promise((resolve, reject) => {
    dataTransferItem.getAsString((result) => {
        resolve(result);
    });
});

async function onPasteBasic(pasteEvent) {
    // simple paste data extraction
    // let paste = (pasteEvent.clipboardData || window.clipboardData).getData('text');
    // console.log("Got something from a paste event: " + paste)

    const acceptedTypes = ["text/plain", "text/html"]
    const items = await navigator.clipboard.read();
    for (let item of items) {
        for (let acceptedType of acceptedTypes) {
            if (!item.types.includes(acceptedType)) {
                continue
            }
            const reader = new FileReader;
            reader.addEventListener("load", loadEvent => {
                const content = reader.result;
                document.getElementById("html-output").innerHTML = reader.result;
                window.socketMessenger.sendClipboardData(content)
            });
            const typeData = await item.getType(acceptedType)
            reader.readAsText(typeData)
            return
        }
    }
    console.log("Got paste data, but could not extract text.", items)
}

// Thanks!
// https://stackoverflow.com/a/33928558/1010496
// Copies a string to the clipboard. Must be called from within an
// event handler such as click. May return false if it failed, but
// this is not always possible. Browser support for Chrome 43+,
// Firefox 42+, Safari 10+, Edge and Internet Explorer 10+.
// Internet Explorer: The clipboard feature may be disabled by
// an administrator. By default a prompt is shown the first
// time the clipboard is used (per session).
function copyToClipboard(text) {
    if (window.clipboardData && window.clipboardData.setData) {
        // Internet Explorer-specific code path to prevent textarea being shown while dialog is visible.
        return window.clipboardData.setData("Text", text);
    }
    else if (document.queryCommandSupported && document.queryCommandSupported("copy")) {
        var textarea = document.createElement("textarea");
        textarea.textContent = text;
        textarea.style.position = "fixed";  // Prevent scrolling to bottom of page in Microsoft Edge.
        document.body.appendChild(textarea);
        textarea.select();
        try {
            return document.execCommand("copy");  // Security exception may be thrown by some browsers.
        }
        catch (ex) {
            console.warn("Copy to clipboard failed.", ex);
            return false;
        }
        finally {
            document.body.removeChild(textarea);
        }
    }
}

export {
    setupPasteListener,
    // maybe also have a look here
    // https://github.com/ryangjchandler/alpine-clipboard
    copyToClipboard
}