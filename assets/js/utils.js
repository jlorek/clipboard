/**
 * https://developer.mozilla.org/en-US/docs/Web/HTTP/Basics_of_HTTP/Data_URIs
 * data:[<mediatype>][;base64],<data>
 */
function decodeDataUrl(dataUrl) {
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
}

/**
 * https://developer.mozilla.org/en-US/docs/Web/API/Navigator/share
 */
async function tryOpenShareSheet(url, title, text) {
    let data = {
        url: url,
        title: title,
        text: text
    };

    if (!navigator.share) {
        return false;
    }
    
    try {
        await navigator.share(data);
        return true;
    } catch (err) {
        console.warn("Could not share data.", err);
        return false;
    }
}

export {
    decodeDataUrl,
    tryOpenShareSheet
}