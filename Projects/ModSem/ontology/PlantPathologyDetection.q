[QueryItem="Query plants"]
PREFIX : <http://www.semanticweb.org/onto_plant_pathology#>

SELECT * WHERE {?p a :Plant; :hasEppoCode ?ep ; :hasScientificName ?sn . }
[QueryItem="Query pathogen hosts"]
PREFIX : <http://www.semanticweb.org/onto_plant_pathology#>

SELECT * WHERE {
  ?pathogen a :Pathogen; :affects ?plant .
   ?plant a :Plant; :hasScientificName ?name}
[QueryItem="Query Pathogen presences"]
PREFIX onto_plant_pathology: <http://www.semanticweb.org/onto_plant_pathology#>
PREFIX : <http://www.semanticweb.org/onto_plant_pathology#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

SELECT ?scientificName ?subterritory WHERE {
  ?p a :Presence ;
    :presenceOf ?pathogen;
    :presenceIn ?subterritory .
  ?pathogen :hasScientificName ?scientificName .
}
[QueryItem="Query pathogen"]
PREFIX : <http://www.semanticweb.org/onto_plant_pathology#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

SELECT DISTINCT * WHERE {
  <http://www.semanticweb.org/onto_plant_pathology#ALECSN> a :Pathogen;
  :hasEppoCode ?eppoCode;
  :hasCommonName ?commonName;
  :hasScientificName ?scientificName ;
  :hasAuthority ?authority .
  FILTER (
        lang(?commonName) = 'it'
  )
}
[QueryItem="Query pathogen symptoms"]
# This query does work on GraphDB but not on OnTop

PREFIX : <http://www.semanticweb.org/onto_plant_pathology#>
PREFIX collectionentity: <http://www.ontologydesignpatterns.org/cp/owl/collectionentity.owl#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

SELECT ?symptomLabel ?symptomDescription WHERE {
  <http://www.semanticweb.org/onto_plant_pathology#ALECSN> a :Pathogen;
    :causes ?symptoms .
  ?symptoms a :CommonSymptoms ;
    collectionentity:hasMember ?symptom . # It works up to this point
  ?symptom rdfs:label ?symptomLabel ;
    rdfs:comment ?symptomDescription .
  FILTER (
        lang(?symptomLabel) = 'it' &&
        lang(?symptomDescription) = 'it'
  )
}