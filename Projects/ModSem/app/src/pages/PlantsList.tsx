import { useEffect, useState } from 'preact/hooks'
import { JSX } from 'preact/jsx-runtime'
import { useSparql, listAllPlantsQuery } from '../Common'
import { ErrorBannerComponent } from '../components/ErrorBannerComponent'
import { LoadingSpinnerComponent } from '../components/LoadingSpinnerComponent'
import { PlantItem } from '../components/PlantItem'
import { CardListComponent } from '../components/CardListComponent'

const plantConverter = (r: any): Plant => {
    return {
        plantIRI: r.iri.value,
        scientificName: r.scientificName.value,
        commonName: (r.commonName) ? r.commonName.value : undefined
    }
}

// Plants list (fetches and display query results)
export const PlantsList = (): JSX.Element => {
    // Use the custom hook to fetch data from the SPARQL endpoint
    const [data, error, loading, executeQuery] = useSparql(
        plantConverter
    )
    const [filteredList, setFilteredList] = useState([])
    const [searchData, setSearchData] = useState<string>('')
    // Perform the async call to the endpoint
    useEffect(() => {
        executeQuery(listAllPlantsQuery)
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
            return p.scientificName.toLowerCase().includes(searchTerm.toLowerCase())
        })
        setFilteredList(filteredItems)
    }

    // Show loading spinner
    if (loading) {
        return <LoadingSpinnerComponent />
    }
    // Show error
    if (error) {
        return <ErrorBannerComponent message={error} />
    }
    // Show empty data (2)
    if (data.size == 0) {
        return <ErrorBannerComponent message="Nessun patogeno disponibile" />
    }

    // If no error load this
    return (
        <>
            <h1 class="uk-card-title uk-text-center">Piante</h1>
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
            // Render the list of Plants
            <CardListComponent
                items={
                    filteredList.map((p) => ({
                        title: p.scientificName,
                        url: `PlantDetails?plantIRI=${encodeURIComponent(p.plantIRI)}`
                    }))
                }
                emptyPlaceholder="Nessuna pianta corrispondente al termine inserito trovata."
            />
            }
        </>
    )
}
