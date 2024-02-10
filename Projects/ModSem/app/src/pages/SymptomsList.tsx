import { useEffect, useState } from 'preact/hooks'
import { JSX } from 'preact/jsx-runtime'
import { useSparql, listAllSymptomsQuery } from '../Common'
import { ErrorBannerComponent } from '../components/ErrorBannerComponent'
import { LoadingSpinnerComponent } from '../components/LoadingSpinnerComponent'
import { route } from 'preact-router'

const SymptomItem = (props) => {
    const openPathogenList = () => {
        // Route to the plant details page
        let encodedURI = encodeURIComponent(props.symptomIRI)
        route(`/PathogensList?symptomIRI=${encodedURI}&symptomName=${props.symptomName}`)
    }

    return (
        <div
            class="uk-card uk-card-small uk-card-default uk-card-hover uk-card-body uk-margin-top"
            onClick={openPathogenList}
        >
            <h4 class="uk-margin-remove-bottom">{props.symptomName}</h4>
        </div>
    )
}

type Symptom = {
    symptomIRI: string,
    symptomName: string
}

export const SymptomsList = (props) => {
    const symptomConverter = (r): Symptom => {
        return {
            symptomIRI: r.symptom.value,
            symptomName: r.symptomName.value,
        } 
    }

    const [data, error, loading, executeQuery] = useSparql(symptomConverter)

    useEffect(() => {
        executeQuery(listAllSymptomsQuery)
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
            <h1 class="uk-card-title uk-text-center">Sintomi</h1>
            { data.map((s) => (<SymptomItem {...s}/>)) }
        </>
    )
}
