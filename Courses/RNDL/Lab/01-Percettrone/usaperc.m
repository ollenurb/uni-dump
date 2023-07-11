%usaperc
%utilizza il percettrone dopo che i patterns sono stati appresi
%riceve W e una matrica di patterns
%restituisce una colonna di risposte, una per ogni pattern

function ris=usaperc(W,P);

[t,m]=size(P); %t patterns m dimensionali

P(:,m+1)=-ones(t,1); %si aggiunge una colonna di -1 a P: è il valore fisso del bias

w=size(W,2);

if ne(w,m+1)
   error('dimensioni errate!')
end

 ris=segno(W*P')'; %calcola il risultato
 