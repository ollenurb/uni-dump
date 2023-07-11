# Progetto SOAR

## Specifica

## Analisi

- Stati:
    - Dentro la stanza
    - Fuori dalla stanza (goal)
- Entità:
    - Agente
    - Finestra (esterno, interno)
    - Molla (elastico)
    - Rametto di legno
    - Ciottoli
    - Pietre
- Operatori:
    - Movimento
    - Raccolta / Posa
    - Combinazione
    - Scaglia
    - Spostare
    - Impilazione
    - Scalata
- Rinforzi:
    - Molla + rametto (positivo, fionda)
    - Pietre + rametto (negativo)
    - Pietre + molla (negativo)
    - Colpire esterno finestra (positivo)
    - Colpire interno finestra (neutro)
- Valutazione:
    - Tempo di quanto impiega ad apprendere
    - Variare parametri del RL
