import { JSX } from 'preact/jsx-runtime'

export const LoadingSpinnerComponent = (props): JSX.Element => {
    return (
        <div class="uk-flex uk-flex-center">
            <div
                uk-spinner="ratio: 3"
                style="position: relative; margin: auto;"
            />
        </div>
    )
}
