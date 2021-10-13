% Decision Tree

In altri termini un decision tree rappresenta un'espressione scritta in [forma
normale disgiuntiva](DNF.md). Dal momento che ogni espressione logica puo'
essere riscritta in DNF, i decision trees sono massimamente espressivi. Cio'
significa che possono rappresentare perfettamente ogni dataset, posto che non
esistano inconsistenze.  

Questo pero' puo' rappresentare un problema: supponiamo che esista un decision
tree in cui ogni foglia copra esattamente un solo esempio positivo. Tale albero
sara' completamente *overfitted*, cioe' adattato troppo ai dati ed incapace di
generalizzare. Per introdurre un *[inductive bias](InductiveBias.md)*, si puo'
limitare deliberatamente l'epressivita' del linguaggio indotto dai decision trees.  

Esistono diversi algoritmi per la costruzione di *Decision Trees*, uno dei piu'
comuni tra differenti tree learners e' l'algoritmo [GrowTree](GrowTree.md)
