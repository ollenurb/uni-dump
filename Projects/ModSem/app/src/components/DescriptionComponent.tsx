import { JSX } from 'preact/jsx-runtime'
import { LoadingSpinnerComponent } from './LoadingSpinnerComponent'
import { useGet } from '../Common'
import { useEffect } from 'preact/hooks'

// This component tries to fetch from Wikipedia the extract of reasource
// corresponding to the provided wikipedia title. If it finds something, it
// shows the response, otherwise it shows the default text (if provided). In
// case neither the response nor the default text are defined, it doesn't show
// anything.
// 
// Props:
// - wikipediaTitle => Wikipedia page title 
// - defaultDescription => default text if http call doesn't go as planned
// - image => image source
export const DescriptionComponent = (props: any) => {

    // Convert the wikipedia response, otherwise return null
    const wikipediaResponseConverter = (r): string => {
        if (r && r.query && r.query.pages) {
            let pages = r.query.pages
            for (var key in pages) {
                if (pages.hasOwnProperty(key)) {
                    return pages[key].extract
                }
            }
        }
        return null;
    } 

    const [data, error, loading, executeCall] = useGet(wikipediaResponseConverter);

    useEffect(() => {
        executeCall('https://it.wikipedia.org/w/api.php', {
           format: 'json', 
           action: 'query',
           prop: 'extracts',
           exintro: 1,
           explaintext: 1,
           titles: props.wikipediaTitle,
        })
    },[]) 

    // Show loading spinner while loading the description
    if (loading) {
        return (<LoadingSpinnerComponent/>)
    }
    // Log error
    if (error) {
        console.error(`DescriptionSectionError: ${error}`)
    }

    return (    
        <>
            <h4 class="uk-heading-line uk-margin-small">
                <span>Descrizione</span>
            </h4>
            <div class="uk-panel">
                {
                    props.image && (
                        <img class="uk-align-right uk-margin-remove-adjacent uk-margin-small-bottom"
                            src={props.image}
                            width="200"
                            height="150"
                            alt="Thumbnail"
                            style="border-style: solid; border-width: 0.5px; border-color: #E5E5E5; border-radius: 10px"
                        />
                    )
                }
                <p class="uk-margin-remove-top uk-text-small uk-text-justify">{data ? data : props.defaultDescription}</p>
            </div>
        </>
    )
}
