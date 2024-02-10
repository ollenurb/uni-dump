import axios from 'axios'
import { useState } from 'preact/hooks'

// Define an axios http client with the basic endpoint set to point the GraphDB
// instance
const SPARQL_ENDPOINT = 'http://localhost:7200'
export const sparql = axios.create({
    baseURL: SPARQL_ENDPOINT,
    headers: {
        crossDomain: 'true',
        'Access-Control-Allow-Origin': '*',
        'Content-type': 'application/json',
    },
})

// Defines the prefixes that will be prefixed to each query
const QUERY_PREFIXES = `
PREFIX : <http://www.semanticweb.org/onto_plant_pathology#>
PREFIX dc: <http://purl.org/dc/elements/1.1/>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX xml: <http://www.w3.org/XML/1998/namespace>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX onto_plant_pathology: <http://www.semanticweb.org/onto_plant_pathology#>`

export const listAllPathogensQuery = `
SELECT DISTINCT * WHERE {
  ?iri a :Pathogen;
  :hasCommonName ?commonName;
  :hasScientificName ?scientificName.
  FILTER (
        lang(?commonName) = 'it' &&
        datatype(?scientificName) != rdf:PlainLiteral
    )
}
ORDER BY ?commonName`

export const listRegionsQuery = `
PREFIX wdt: <http://www.wikidata.org/prop/direct/>

SELECT ?region ?regionName ?flag WHERE {
    ?region a :SubnationalTerritory;
            rdfs:label ?regionName;
            :hasISO_3166_2_Code ?isoCode .
    SERVICE <https://query.wikidata.org/sparql> {
    ?wikidataRegion wdt:P300 ?isoCode;
                    wdt:P41 ?flag 
    }
    FILTER ( lang(?regionName) = 'it')
} ORDER BY ?regionName`;

export const listPathogensByRegionQuery = (region: string) => `
SELECT DISTINCT ?iri ?commonName ?scientificName WHERE {
  ?iri a :Pathogen;
  :hasCommonName ?commonName;
  :hasScientificName ?scientificName.
  ?presence :presenceOf ?iri;
            :presenceIn ? <${region}>. 
  FILTER (
        lang(?commonName) = 'it' &&
        datatype(?scientificName) != rdf:PlainLiteral
    )
}
ORDER BY ?commonName
`;

export const listPathogensBySymptomQuery = (symptom: string) => `
SELECT DISTINCT ?iri ?commonName ?scientificName WHERE {
  ?iri a :Pathogen;
  :hasCommonName ?commonName;
  :hasScientificName ?scientificName.
  ?iri :causes ?symptoms.
  ?symptoms :hasSymptomMember <${symptom}>
  FILTER (
        lang(?commonName) = 'it' &&
        datatype(?scientificName) != rdf:PlainLiteral
    )
}
ORDER BY ?commonName`;

export const listAllSymptomsQuery = `
SELECT DISTINCT ?symptom ?symptomName WHERE {
  ?symptom a :DiseaseSymptom;
       rdfs:label ?symptomName.
   FILTER ( lang(?symptomName) = 'it' )
} ORDER BY ?symptomName`;

export const listAllPlantsQuery = `
SELECT DISTINCT * WHERE {
  ?iri a :Plant;
  :hasScientificName ?scientificName.
  FILTER (
        datatype(?scientificName) != rdf:PlainLiteral
    )
}
ORDER BY ?scientificName`

export const pathogenSymptomsQuery = (pathogen: string) => `
SELECT ?symptomLabel ?symptomDescription WHERE {
  <${pathogen}> a :Pathogen;
    :causes ?symptoms .
  ?symptoms a :CommonSymptoms ;
    :hasSymptomMember ?symptom .
  ?symptom a :DiseaseSymptom ;
    rdfs:label ?symptomLabel ;
    rdfs:comment ?symptomDescription
  FILTER (
        lang(?symptomLabel) = 'it' &&
        lang(?symptomDescription) = 'it'
  )
}`;

export const pathogenHostsQuery = (pathogen: string) => `
SELECT ?host ?hostName (sample(?commonName) as ?italianCommonName) WHERE {
  <${pathogen}> a :Pathogen;
    :affects ?host .
    ?host rdfs:label ?hostName .
    OPTIONAL {
        ?host :hasCommonName ?commonName .
        FILTER ( lang(?commonName) = 'it' )
    }
}
GROUP BY ?host ?hostName
ORDER BY ?hostName
`;

export const pathogenRegionalPresencesQuery = (pathogen: string) => `
SELECT ?regionName ?encounter WHERE {
  <${pathogen}> a :Pathogen .
    ?presence a :Presence ;
              :presenceOf <${pathogen}> ;
              :presenceIn ?region .
    OPTIONAL {?presence :hasFirstEncounter ?encounter }.
    ?region rdfs:label ?regionName .
    FILTER ( lang(?regionName) = 'it' )
} ORDER BY ?encounter
`;

// Construct the query to get the details of a given pathogen
export const pathogenDetailsQuery = (pathogen: string) => `
PREFIX bd: <http://www.bigdata.com/rdf#>
PREFIX schema: <http://schema.org/>
PREFIX wdt: <http://www.wikidata.org/prop/direct/>
PREFIX wikibase: <http://wikiba.se/ontology#>

SELECT DISTINCT ?eppoCode ?commonName ?scientificName ?authority ?wikiDataID ?image ?wikipediaTitle ?description WHERE {
  <${pathogen}> a :Pathogen;
  :hasEppoCode ?eppoCode;
  :hasCommonName ?commonName;
  :hasScientificName ?scientificName;
  :hasAuthority ?authority;
  rdfs:comment ?description .
  FILTER (
        lang(?commonName) = 'it' &&
        lang(?description) = 'it' &&
        datatype(?scientificName) != rdf:PlainLiteral &&
        datatype(?authority) != rdf:PlainLiteral
  )
  SERVICE <https://query.wikidata.org/sparql> {
    ?wikiDataID wdt:P3031 ?eppoCode ;
      OPTIONAL {
          ?wikiDataID wdt:P18 ?image .
      }
      OPTIONAL {
          ?wikipediaPage schema:about ?wikiDataID .
          ?wikipediaPage schema:inLanguage "it" .
          ?wikipediaPage schema:name ?wikipediaTitle .
    }
  }
}`;

export const plantDetailsQuery = (plant: string) => `
PREFIX wdt: <http://www.wikidata.org/prop/direct/>
PREFIX schema: <http://schema.org/>

SELECT DISTINCT ?eppoCode ?scientificName ?image ?wikipediaTitle WHERE {
  <${plant}> a :Plant;
  :hasEppoCode ?eppoCode;
  :hasScientificName ?scientificName.
  FILTER (
        datatype(?scientificName) != rdf:PlainLiteral
  )
  SERVICE <https://query.wikidata.org/sparql> {
    ?wikiDataID wdt:P3031 ?eppoCode ;
      OPTIONAL {
          ?wikiDataID wdt:P18 ?image .
      }
      OPTIONAL {
          ?wikipediaPage schema:about ?wikiDataID .
          ?wikipediaPage schema:inLanguage "it" .
          ?wikipediaPage schema:name ?wikipediaTitle .
    }
  }
}`;

export const plantCommonNamesQuery = (plant: string) => `
SELECT ?commonName WHERE {
  <${plant}> a :Plant;
    :hasCommonName ?commonName .
    FILTER ( lang(?commonName) = 'it' )
}
ORDER BY ?commonName`;

export const plantPathogensQuery = (plant: string) => `
SELECT ?pathogen ?scientificName ?commonName WHERE {
  ?pathogen a :Pathogen;
    :affects ? <${plant}>;
    :hasScientificName ?scientificName;
    :hasCommonName ?commonName;
    FILTER (
        lang(?commonName) = 'it' &&
        datatype(?scientificName) != rdf:PlainLiteral
    )
}
ORDER BY ?commonName
`;



// Define a react hook that perform the SPARQL call. We may pass a convertion
// function to this hook that will be called to transform the response to a
// valid object. By default, such funciton is the identity function id: a -> a.
type ConvertFunction = (<T>(a: any) => T) | ((a: any) => any)

export function useSparql(
    convertFunction: ConvertFunction = (a: any) => a
): any {
    const [response, setResponse] = useState(null)
    const [error, setError] = useState('')
    const [loading, setLoading] = useState(true)

    // Given a query, execute it using the SPARQL REST endpoint
    const executeQuery = async (query: string) => {
        // Add prefixes to the query before executing it
        const prefixedQuery = `${QUERY_PREFIXES}\n${query}`
        // Peform the query, getting the raw response back
        try {
            setLoading(true)
            const response = await sparql.post(
                '/repositories/pathoplants-ontology',
                {
                    query: prefixedQuery,
                    infer: true,
                    sameAs: true,
                    limit: 1001,
                    offset: 0,
                },
                {
                    headers: {
                        'content-type': 'application/x-www-form-urlencoded',
                    },
                }
            )
            // console.log(response.data.results.bindings)
            // Set the data by first converting the response if the function is not undefined
            let converted = response.data.results.bindings.map(convertFunction)
            setResponse(converted)
        } catch (e) {
            // Set errors
            if (e.response.data.error) {
                setError(e.response.data.error.message)
            } else if (e.request) {
                setError(e.request.message)
            } else {
                setError(e.message)
            }
        } finally {
            // Stop loading
            setLoading(false)
        }
    }
    return [response, error, loading, executeQuery]
}

export function useGet(
    convertFunction
): any {
    const [response, setResponse] = useState(null)
    const [error, setError] = useState('')
    const [loading, setLoading] = useState(true)

    const executeCall = (
        endpoint: string,
        parameters: any
    ) => {
        setLoading(true)
        axios.get(endpoint, { params: parameters })
        // Set response
        .then((response) => {
            // console.log(JSON.stringify(response.data))
            let converted = convertFunction(response.data)
            setResponse(converted)
        })
        // Set errors
        .catch((e) => {
            if (e.response) {
                setError(e.response.data.error.message)
            } else if (e.request) {
                setError(e.request.message)
            } else {
                setError(e.message)
            }
        })
        .finally(() => {
            setLoading(false)
        });
    }
    return [response, error, loading, executeCall]
}
