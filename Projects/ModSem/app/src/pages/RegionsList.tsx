import { useEffect, useState } from 'preact/hooks'
import { JSX } from 'preact/jsx-runtime'
import { useSparql, listRegionsQuery } from '../Common'
import { ErrorBannerComponent } from '../components/ErrorBannerComponent'
import { LoadingSpinnerComponent } from '../components/LoadingSpinnerComponent'
import { route } from 'preact-router'

const RegionItem = (props) => {
    const openPathogenList = () => {
        // Route to the plant details page
        let encodedURI = encodeURIComponent(props.regionIRI)
        route(`/PathogensList?regionIRI=${encodedURI}&regionName=${props.regionName}`)
    }

    return (
        <div class="uk-card uk-card-default uk-grid-collapse uk-child-width-1-2@s uk-margin uk-card-hover"
            onClick={openPathogenList}
            uk-grid>
            <div class="uk-card-media-left uk-cover-container">
                <img src={props.regionImg} alt="" uk-cover/>
                <canvas width="100" height="80"></canvas>
            </div>
            <div>
                <div class="uk-card-body">
                    <h4>{props.regionName}</h4>
                </div>
            </div>
        </div>
    )
}

type Region = {
    regionIRI: string,
    regionName: string,
    regionImg: string
}

export const RegionsList = (props) => {
    const regionConverter = (r): Region => {
        return {
            regionIRI: r.region.value,
            regionName: r.regionName.value,
            regionImg: r.flag.value,
        } 
    }

    const [data, error, loading, executeQuery] = useSparql(regionConverter)

    useEffect(() => {
        executeQuery(listRegionsQuery)
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
            <h1 class="uk-card-title uk-text-center">Regioni</h1>
            { data.map((r) => (<RegionItem {...r}/>)) }
        </>
    )
}
