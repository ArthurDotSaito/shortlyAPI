import { stripHtml } from "string-strip-html"

export function sanitize(object) {
    for (let [key, value] of Object.entries(object)) {
        if (typeof value === 'string') {
            object[key] = stripHtml(value.trim()).result
        }
    }
    return object
}