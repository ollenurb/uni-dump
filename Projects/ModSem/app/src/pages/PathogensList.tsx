import { useEffect, useState } from 'preact/hooks'
import { JSX } from 'preact/jsx-runtime'
import { useSparql, listAllPathogensQuery, listPathogensByRegionQuery, listPathogensBySymptomQuery } from '../Common'
import { route } from 'preact-router'
import { ErrorBannerComponent } from '../components/ErrorBannerComponent'
import { LoadingSpinnerComponent } from '../components/LoadingSpinnerComponent'
import { CardListComponent } from '../components/CardListComponent'

// Selects query based on the props received
// -> when regionIRI is specified, then fetch pathogens by region 
// -> when symptomIRI is specified, then fetch pathogens by symptom 
// -> when no props is specified, then fetch all pathogens
const selectQuery = (props): string => {
    if (props.regionIRI) {
        return listPathogensByRegionQuery(props.regionIRI)
    }
    if (props.symptomIRI) {
        return listPathogensBySymptomQuery(props.symptomIRI)
    }
    else {
        return listAllPathogensQuery
    }
}

// Pathogen list (fetches and display query results)
export const PathogensList = (props): JSX.Element => {
    // Function to convert from a response to a Pathogen 
    const pathogenConverter = (r: any): Pathogen => {
        return {
            pathogenIRI: r.iri.value,
            scientificName: r.scientificName.value,
            commonName: r.commonName.value,
        }
    }
    // Use the custom hook to fetch data from the SPARQL endpoint
    const [data, error, loading, executeQuery] = useSparql(
        pathogenConverter
    )
    const [filteredList, setFilteredList] = useState([])
    const [searchData, setSearchData] = useState<string>('')
    // Perform the async call to the endpoint
    useEffect(() => {
        executeQuery(selectQuery(props))
    }, [])
    // Update filtered list when data changes
    useEffect(() => {
        if (data !== null) {
            setFilteredList(data)
        }
    }, [data])

    // Implement the search
    const onInputChanged = (e) => {
        const searchTerm = e.target.value
        setSearchData(searchTerm)
        const filteredItems = data.filter((p) => {
            return p.commonName.toLowerCase().includes(searchTerm.toLowerCase())
        })
        setFilteredList(filteredItems)
    }

    // Show loading spinner
    if (loading) {
        return <LoadingSpinnerComponent />
    }
    // Show error
    if (error) {
        return <ErrorBannerComponent message={JSON.stringify(error)} />
    }
    // Show empty data (2)
    if (data.size == 0) {
        return <ErrorBannerComponent message="Nessun patogeno disponibile" />
    }



    // If no error load this
    return (
        <>
            <h1 class="uk-card-title uk-text-center">
                Patogeni 
                {props.regionName && ` presenti in ${props.regionName}`}
                {props.symptomName && ` con sintomo ${props.symptomName.toLowerCase()}`}
            </h1>
            <div class="uk-margin uk-margin-medium-top" uk-grid>
                <div class="uk-width-expand">
                    <input
                        class="uk-input uk-border-pill"
                        type="text"
                        name="query"
                        placeholder="Filtra per nome..."
                        value={searchData}
                        onInput={onInputChanged}
                    />
                </div>
            </div>
            <hr/>
            {
            // Render the list of Pathogens
            <CardListComponent
                items={
                    filteredList.map((p) => ({
                        title: p.commonName,
                        subtitle: p.scientificName,
                        url: `PathogenDetails?pathogenIRI=${encodeURIComponent(p.pathogenIRI)}`
                    }))
                }
                emptyPlaceholder="Nessun patogeno corrispondente al termine inserito trovato."
            />
            }
        </>
    )
}
