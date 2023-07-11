import FacebookLogin from '@greatsumini/react-facebook-login'
import { memo } from 'preact/compat'
import style from './style.scss'

const FB_APPID = '813720279661452'

const FacebookForm = ({ show, onSuccess, onProfileSuccess, onFail }) =>
    show && (
        <>
            <div className={`${style.divider} mt-3`}>OR</div>
            <FacebookLogin
                appId={FB_APPID}
                className="btn btn-lg btn-primary mt-3 w-100"
                onSuccess={onSuccess}
                onProfileSuccess={onProfileSuccess}
                onFail={onFail}
            />
        </>
    )

export default memo(FacebookForm, (o, n) => o.show === n.show)
