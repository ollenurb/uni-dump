export const SHOW_INFO = 0x201
export const SHOW_SUCCESS = 0x202
export const SHOW_WARN = 0x203
export const SHOW_ERROR = 0x204

export const notifyInfo = (message) => ({
    type: SHOW_INFO,
    message,
})

export const notifySuccess = (message) => ({
    type: SHOW_SUCCESS,
    message,
})

export const notifyWarn = (message) => ({
    type: SHOW_WARN,
    message,
})

export const notifyError = (message) => ({
    type: SHOW_ERROR,
    message,
})
