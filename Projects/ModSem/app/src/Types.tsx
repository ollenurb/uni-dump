// ========================== Types ========================== 
export type Pathogen = {
    pathogenIRI: string
    scientificName: string
    commonName: string
}

export type Plant = {
    plantIRI: string
    scientificName: string
    commonName?: string
}

export type Symptom = {
    label: string,
    description: string,
}

export type PathogenInfo = {
    eppoCode: string
    commonName: string
    scientificName: string
    authority: string
    description: string,
    wikipediaTitle?: string,
    image?: string
}

export type PlantInfo = {
    eppoCode: string
    scientificName: string
    wikipediaTitle?: string,
    image?: string
}


