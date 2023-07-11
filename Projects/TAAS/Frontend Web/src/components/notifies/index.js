import { useEffect, useState } from 'preact/hooks'
import { useSelector } from 'react-redux'
import style from './style.scss'

const Notify = ({ type, message }) => {
    const [visible, setVisible] = useState(true)

    useEffect(() => {
        const timeout = setTimeout(() => setVisible(false), 2000)
        return () => clearTimeout(timeout)
    }, [])

    return (
        visible && (
            <div
                className={`alert alert-${type} alert-dismissible ${style.notify} fade show`}
                role="alert"
            >
                <span>{message}</span>
                <button
                    type="button"
                    className="btn-close"
                    aria-label="Close"
                    onClick={() => setVisible(false)}
                />
            </div>
        )
    )
}

const Notifies = () => {
    const notifyList = useSelector((state) => state.notify)

    return (
        <div className={style.notifies}>
            {notifyList.map(({ type, message }, idx) => (
                <Notify key={idx} type={type} message={message} />
            ))}
        </div>
    )
}

export default Notifies
