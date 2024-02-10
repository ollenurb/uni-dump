import { useEffect, useState } from 'preact/hooks'
import {
    pathogenDetailsQuery,
    pathogenSymptomsQuery,
    pathogenHostsQuery,
    pathogenRegionalPresencesQuery,
    useSparql,
    useGet
} from '../Common'
import { ErrorBannerComponent } from '../components/ErrorBannerComponent'
import { LoadingSpinnerComponent } from '../components/LoadingSpinnerComponent'
import { DescriptionComponent } from '../components/DescriptionComponent'
import { CardListComponent } from '../components/CardListComponent'
import { FetchSparqlComponent } from '../components/FetchSparqlComponent'
import { PathogenInfo } from '../Types'

// Pathogen details component
export const PathogenDetails = (props) => {
    const pathogenInfoConverter = (r: any): PathogenInfo => {
        return {
            eppoCode: r.eppoCode.value,
            commonName: r.commonName.value,
            scientificName: r.scientificName.value,
            authority: r.authority.value,
            description: r.description.value,
            wikipediaTitle: (r.wikipediaTitle) ? r.wikipediaTitle.value : undefined,
            image: (r.image) ? r.image.value : undefined,
        }
    }

    return (
        <FetchSparqlComponent
            converter={pathogenInfoConverter}
            query={pathogenDetailsQuery(props.pathogenIRI)}
            render={(data) => (
                <>
                    <h3 class="uk-margin-remove-bottom">{data[0].commonName}</h3>
                    <p class="uk-text-meta uk-text-italic uk-margin-small-top">
                        {data[0].scientificName}
                    </p>
                    <DescriptionComponent
                        defaultDescription={data[0].description}
                        image={data[0].image}
                        wikipediaTitle={data[0].wikipediaTitle} />
                    <SymptomsSection pathogenIRI={props.pathogenIRI}/>
                    <PresencesSection pathogenIRI={props.pathogenIRI}/>
                    <HostPlantsSection pathogenIRI={props.pathogenIRI}/>
                </> 
            )}
        />
    )
}

// Display all symptoms of a given pathogen
const SymptomsSection = (props) => {

    const symptomConverter = (r: any): Symptom => {
        return {
            label: r.symptomLabel.value,
            description: r.symptomDescription.value
        }
    }
    
    return (
        <FetchSparqlComponent
            converter={symptomConverter}
            query={pathogenSymptomsQuery(props.pathogenIRI)}
            render={(data) => (
                <>
                    <h4 class="uk-heading-line uk-margin-small">
                        <span>Sintomi</span>
                    </h4>
                    <ul> { data.map((s) => (<li>{s.label}</li>)) } </ul>
                </>
            )}
        />
    )

}

// Plants Section component
const HostPlantsSection = (props) => {

    // Create a converter for the specific query
    const hostPlantConverter = (r) => {
        return {
            plantIRI: r.host.value,
            scientificName: r.hostName.value,
            commonName: (r.italianCommonName) ? r.italianCommonName.value : undefined
        }
    }
    
    return (
        <FetchSparqlComponent
            converter={hostPlantConverter}
            query={pathogenHostsQuery(props.pathogenIRI)}
            render={(data) => (
                <>
                    <h4 class="uk-heading-line uk-margin-small">
                        <span>Piante ospiti</span>
                    </h4>
                    <CardListComponent
                        items={
                            data.map((p) => ({
                                title: p.scientificName,
                                url: `PlantDetails?plantIRI=${encodeURIComponent(p.plantIRI)}`
                            }))
                        }
                        emptyPlaceholder="Nessuna pianta ospite rilevata."
                    />
                </>
            )}
        />
    )
}

// Presences Section component
const PresencesSection = (props) => {

    type RegionalPresence = {
        regionName: string,
        encounter?: int
    }

    // Create a converter for the specific query
    const presenceConverter = (r): RegionalPresence => {
        return {
            regionName: r.regionName.value,
            encounter: (r.encounter) ? r.encounter.value : undefined
        }
    }

    return (
        <FetchSparqlComponent
            converter={presenceConverter}
            query={pathogenRegionalPresencesQuery(props.pathogenIRI)}
            render={(data) => (
                <>
                    <h4 class="uk-heading-line uk-margin-small">
                        <span>Presenze regionali</span>
                    </h4>
                    <ul>
                    { data.map((p) => ( <li>{p.regionName} ({(p.encounter) ? p.encounter : 'n.d.'})</li>)) }
                    </ul>
                </> 
            )}
        />
    )
}
