import { JSX } from 'preact/jsx-runtime'

export const ErrorBannerComponent = (props): JSX.Element => {
    return (
        <div class="uk-alert-danger" uk-alert>
            <p>{props.message}</p>
        </div>
    )
}
