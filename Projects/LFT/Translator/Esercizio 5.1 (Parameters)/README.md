# Esercizio 5.1 con parametri e compilazione jasmin automatica
Questa variante dell'esercizio 5.1 presenta una parametrizzazione dell'input (il nome e path del file .pas vengnono inseriti in input) e presenta una generazione automatica del file Output.class tramite l'utility jasmin.  

## Compilazione
Per funzionare spostarsi all'interno della directory Esercizio_5.1_Param, successivamente compilare tramite il comando `javac -d ./out/ ./src/*.java`.  
Assicurarsi di avere all'interno della cartella `out` il file `jasmin.jar`.  

## Esecuzione
Per eseguire digitare  `java Compiler [NOMEFILE.pas]` (il file deve essere all'interno della cartella)  
Compiler generera' automaticamente due file: un file .j e un file .class
