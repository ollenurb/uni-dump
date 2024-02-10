import { JSX } from 'preact/jsx-runtime'
import { route } from 'preact-router'

// Properties of a CardItem
export type CardItem = {
    url?: string, 
    title: string,
    subtitle?: string,
}

function CardItemComponent(props: CardItem): JSX.Element {
    // Clicking the item, will redirect the user to the specified URL
    const routeURL = () => route(props.url)

    return (
        <div
            class="uk-card uk-card-small uk-card-default uk-card-hover uk-card-body uk-margin-top"
            onClick={props.url ? routeURL : () => {}} 
        >
            <h4 class="uk-margin-remove-bottom">{props.title}</h4>
            { props.subtitle &&
                <p class="uk-margin-small-top uk-text-meta uk-text-italic">
                    {props.subtitle}
                </p>
            }
        </div>
    )
}

// Card List component.
// Render the list of cards if the items list is not empty, otherwise it
// renders a placeholder message (if defined).
//
// Props:
// - items => list of items of type CardItem to render
// - emptyPlaceholder => placeholder to show when the list is empty
//
export const CardListComponent = (props): JSX.Element => {
    if (props.items.length !== 0) {
        return (props.items.map((item) => { return (<CardItemComponent {...item} />) }))
    }
    else {
        return props.emptyPlaceholder ? (<p class="uk-text-center uk-text-meta">{props.emptyPlaceholder}</p>) : (<></>)
    }
}
