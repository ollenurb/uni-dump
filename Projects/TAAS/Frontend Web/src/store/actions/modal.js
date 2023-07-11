export const SHOW_MODAL = 0x101
export const HIDE_MODAL = 0x102

export const showModal = () => ({
    type: SHOW_MODAL,
})

export const hideModal = () => ({
    type: HIDE_MODAL,
})
