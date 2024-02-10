
import { useEffect, useState } from 'preact/hooks'
import {
    plantDetailsQuery,
    plantCommonNamesQuery,
    plantPathogensQuery,
    useSparql,
    useGet
} from '../Common'
import { ErrorBannerComponent } from '../components/ErrorBannerComponent'
import { LoadingSpinnerComponent } from '../components/LoadingSpinnerComponent'
import { DescriptionComponent } from '../components/DescriptionComponent'
import { CardListComponent } from '../components/CardListComponent'
import { PlantInfo } from '../Types'


// Plant details component
export const PlantDetails = (props) => {
    const plantInfoConverter = (r: any): PlantInfo => {
        return {
            eppoCode: r.eppoCode.value,
            scientificName: r.scientificName.value,
            wikipediaTitle: (r.wikipediaTitle) ? r.wikipediaTitle.value : undefined,
            image: (r.image) ? r.image.value : undefined,
        }
    }
    // Setup state hooks
    const [data, error, loading, executeQuery] = useSparql(
        plantInfoConverter
    )
    // Perform the async call to the endpoint
    useEffect(() => {
        executeQuery(plantDetailsQuery(props.plantIRI))
    }, [])

    // Show loading spinner
    if (loading) {
        return <LoadingSpinnerComponent />
    }
    // Show error
    if (error) {
        return <ErrorBannerComponent message={JSON.stringify(error)} />
    }
    // Show empty data (2)
    if (data == undefined || data[0] == undefined) {
        // TODO: Fix this issue
        return (
            <ErrorBannerComponent message="La risposta del server contiene una risposta vuota" />
        )
    }

    // If no error or
    return (
        <>
            <h3>{data[0].scientificName}</h3>
            <DescriptionComponent
                defaultDescription={data[0].description}
                image={data[0].image}
                wikipediaTitle={data[0].wikipediaTitle} />
            <NamesSection plantIRI={props.plantIRI}/>
            <PathogensSection plantIRI={props.plantIRI}/>
        </>
    )
}

// Display all common names of a given plant
const NamesSection = (props) => {

    const namesConverter = (r: any): string => {
        return r.commonName.value
    }
    // Setup state hooks
    const [data, error, loading, executeQuery] = useSparql(namesConverter)
    // Perform the async call to the endpoint
    useEffect(() => {
        executeQuery(plantCommonNamesQuery(props.plantIRI))
    }, [])

    // Show loading spinner
    if (loading) {
        return <LoadingSpinnerComponent />
    }
    // Show error
    if (error) {
        return <ErrorBannerComponent message={error} />
    }
    // Don't show anything
    if (data == undefined || data.length == 0) {
        return null
    }
    
    return (
    <>
        <h4 class="uk-heading-line uk-margin-small">
            <span>Nomi comuni</span>
        </h4>
        <ul> { data.map((commonName) => (<li>{commonName}</li>)) } </ul>
    </>
    )
}

// Pathogens Section component
const PathogensSection = (props) => {

    const pathogenConverter = (r) => {
        return {
            pathogenIRI: r.pathogen.value,
            scientificName: r.scientificName.value,
            commonName: r.commonName.value
        }
    }

    const [data, error, loading, executeQuery] = useSparql(pathogenConverter)
    useEffect(() => {
        executeQuery(plantPathogensQuery(props.plantIRI))
    }, [])

    // Show loading spinner
    if (loading) {
        return <LoadingSpinnerComponent />
    }
    // Show error
    if (error) {
        return <ErrorBannerComponent message={error} />
    }
    
    return (
    <>
        <h4 class="uk-heading-line uk-margin-small">
            <span>Patogeni rilevati</span>
        </h4>
        <CardListComponent
            items={
                data.map((p) => ({
                    title: p.commonName,
                    subtitle: p.scientificName,
                    url: `PathogenDetails?pathogenIRI=${encodeURIComponent(p.pathogenIRI)}`
                }))
            }
            emptyPlaceholder="Nessun patogeno rilevato."
        />
    </>
    )
}
