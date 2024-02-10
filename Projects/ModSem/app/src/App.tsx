import { render } from 'preact'
import { useState } from 'preact/hooks'
import { Homepage } from './pages/Homepage'
import Router from 'preact-router'
import { PathogensList } from './pages/PathogensList'
import { PlantsList } from './pages/PlantsList'
import { PathogenDetails } from './pages/PathogenDetails'
import { PlantDetails } from './pages/PlantDetails'
import { RegionsList } from './pages/RegionsList'
import { SymptomsList } from './pages/SymptomsList'

export const App = () => (
    <div class="uk-container uk-flex uk-flex-center">
        <div class="uk-width-1-2@s uk-width-1-1 uk-margin-large-top">
            <div class="uk-card uk-card-default uk-card-body uk-margin-bottom uk-border-rounded">
                <Router>
                    <Homepage path="/" />
                    <PathogensList
                        path="/PathogensList"
                        symptomIRI={null}
                        regionIRI={null}
                        regionName={null}
                        symptomName={null}
                    />
                    <SymptomsList
                        path="/SymptomsList"
                    />
                    <PlantsList
                        path="/PlantsList"
                    />
                    <RegionsList
                        path="/RegionsList"
                    />
                    <PathogenDetails
                        path="/PathogenDetails"
                        pathogenIRI={null}
                    />
                    <PlantDetails
                        path="/PlantDetails"
                        plantIRI={null}
                    />
                </Router>
            </div>
        </div>
    </div>
)

render(<App />, document.getElementById('app'))
