import { JSX } from 'preact/jsx-runtime'
import { useSparql } from '../Common'
import { useEffect } from 'preact/hooks'
import { LoadingSpinnerComponent } from './LoadingSpinnerComponent'
import { ErrorBannerComponent } from './ErrorBannerComponent'


// Props:
// - render => function that, given the data, returns a JSX element to render
// - query => query to perform in order to retrieve data from the sparql
// endpoint
// - converter => function to convert from a response to a series of data
export const FetchSparqlComponent = (props) => {
    // Setup state hooks
    const [data, error, loading, executeQuery] = useSparql(props.converter)

    // Perform the async call to the endpoint
    useEffect(() => executeQuery(props.query), [])

    // Show loading spinner
    if (loading) {
        return <LoadingSpinnerComponent />
    }
    // Show error
    if (error) {
        return <ErrorBannerComponent message={JSON.stringify(error)} />
    }
    // Show empty data (2)
    if (data == undefined) {
        return (<ErrorBannerComponent message="La risposta del server contiene una risposta vuota" />)
    }
    
    return props.render(data);
}
