import { JSX } from 'preact'
import { useState } from 'preact/hooks'
import { route } from 'preact-router'
import logo from '../assets/plant.svg'

export const Homepage = (): JSX.Element => {
    const [globalSearchQuery, setGlobalSearchQuery] = useState<string>('')

    const search = () => {
        route(`/result?query=${formData.query}`)
    }

    return (
        <>
            <div class="uk-text-center">
                <img src={logo} alt="Logo" style="height: 5em;" />
                <h1 class="uk-card-title uk-margin-small-top uk-text-italic">
                    PathoPlants Ontology
                </h1>
            </div>

            <div class="uk-margin uk-margin-large-top" uk-grid>
                <div class="uk-width-expand">
                    <input
                        class="uk-input uk-border-pill"
                        type="text"
                        name="query"
                        placeholder="Ricerca globale..."
                        value={globalSearchQuery}
                        onInput={(e) => setGlobalSearchQuery(e.target.value)}
                    />
                </div>
                <div class="uk-width-auto" style="padding-left: 10px">
                    <button class="uk-button uk-border-pill" onClick={search}>
                        <span uk-icon="icon: search"></span>
                    </button>
                </div>
            </div>

            <h4 class="uk-heading-line uk-text-center uk-text-meta uk-margin-small uk-margin-medium-top">
                <span>Naviga per</span>
            </h4>
            <div class="uk-container uk-margin-medium-top">
                <div class="uk-child-width-expand@s" uk-grid>
                    <div>
                        <button
                            class="uk-button uk-border-pill uk-width-1-1"
                            onClick={(e) => route('PathogensList')}
                        >
                            Patogeni
                            <span
                                uk-icon="arrow-right"
                                class="uk-margin-small-left"
                            ></span>
                        </button>
                    </div>
                    <div>
                        <button
                            class="uk-button uk-border-pill uk-width-1-1"
                            onClick={(e) => route('SymptomsList')}
                        >
                            Sintomi
                            <span
                                uk-icon="arrow-right"
                                class="uk-margin-small-left"
                            ></span>
                        </button>
                    </div>
                </div>
                <div class="uk-child-width-expand@s" uk-grid>
                    <div>
                        <button
                            class="uk-button uk-width-1-1 uk-border-pill"
                            onClick={(e) => route('RegionsList')}
                        >
                            Regioni
                            <span
                                uk-icon="arrow-right"
                                class="uk-margin-small-left"
                            ></span>
                        </button>
                    </div>
                    <div>
                        <button
                            class="uk-button uk-border-pill uk-width-1-1"
                            onClick={(e) => route('PlantsList')}
                        >
                            Piante
                            <span
                                uk-icon="arrow-right"
                                class="uk-margin-small-left"
                            ></span>
                        </button>
                    </div>
                </div>
            </div>
        </>
    )
}
