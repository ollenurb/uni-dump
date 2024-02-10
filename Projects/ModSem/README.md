# Semantic Web

This project involves the development of a simple ontology to detect, describe
and support the identification of plant pathogens.

## Directory structure

- `ontology`: contains the definition of the ontology
  (`PlantPathologyDetection.owl`);
- `report`: contains a report that highlights desing and implementation
  decisions of this project (in italian);
- `app`: contains a web app to consult the ontology.

## Run

- Navigate to this directory;
- `docker run -p 7200:7200 -d $(docker build -q .)`;
- Open the browser to `localhost:7200` (GraphDB control panel);
- Import `PlantPathologyDetection.owl` and
  `PlantPathologyDetectionMaterialized.owl` using the GraphDB control panel;
- Navigate to the `/app` directory;
- `npm install` and `npm run dev` (optional: if using Nix Flakes, then use `nix
  develop` first).


