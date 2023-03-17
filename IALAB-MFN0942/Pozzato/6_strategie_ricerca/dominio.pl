% ----------------------------------------------------------------------------------
% Strategie di Ricerca nello Spazio degli Stati
% ----------------------------------------------------------------------------------
% Rappresentiamo il mondo con dei fatti Prolog. Ad esempio, nel mondo dei
% blocchi:
%   - on(a,b) - il blocco a sta sul blocco b
%   - clear(c) - il blocco c non ha nessun blocco sopra
% Possiamo poi passare da uno stato di questo mondo ad un altro applicando
% delle clausole.
% Le azioni sono rappresentate mediante:
%   - precondizioni: in quali stati e' possibile eseguire un'azione
%   - effetti: lo stato risultante del mondo dopo l'esecuzione dell'azione


% ----------------------------------------------------------------------------------
% Rappresentiamo in questo file lo stato del mondo del dominio che vogliamo
% rappresentare 
% ----------------------------------------------------------------------------------
num_righe(10).
num_colonne(10).

% Stato iniziale e finale
iniziale(pos(4, 2)).
finale(pos(7, 9)).

% Rappresentazione del labirinto
occupata(pos(2,5)).
occupata(pos(3,5)).
occupata(pos(4,5)).
occupata(pos(5,5)).
occupata(pos(6,5)).
occupata(pos(7,5)).
occupata(pos(7,1)).
occupata(pos(7,2)).
occupata(pos(7,3)).
occupata(pos(7,4)).
occupata(pos(5,7)).
occupata(pos(6,7)).
occupata(pos(7,7)).
occupata(pos(8,7)).
occupata(pos(4,7)).
occupata(pos(4,8)).
occupata(pos(4,9)).
occupata(pos(4,10)).
