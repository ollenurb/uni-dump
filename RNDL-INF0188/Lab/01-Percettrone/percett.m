%Implementazione del percettrone.
%Classifica un insieme di patterns in due classi.
%Gli inputs sono reali e gli outputs sono bipolari, 1,-1.
%Ci sono m inputs più l'input del bias, posto sempre uguale a -1.
%Ci sono m+1 pesi che connettono gli inputs e il bias con l'unico output y.
%Gli m+1 pesi compongono un vettore W.
%Inizialmente W è casuale.
%La funzione di attivazione è il segno.
%In entrata viene data una matrice X (input) che ha m colonne, una per input,
%e t righe, dove t è il numero dei patterns da apprendere.
%I patterns sono m-dimensionali.
%In ingresso viene dato anche il vettore colonna T (target) di t righe,
%che contiene i valori da apprendere (+1 o -1, che identificano le due classi).
%n è il numero di epoche fissate per l'apprendimento.
%Uso [a,b]=percett(X,T,n);
%a contiene la storia dei pesi e b la storia del numero di patterns appresi

function [storiapesi,storiappresi]=percett(X,T,n);

[t,m]=size(X); 
W=rand(1,m+1); %inizializzazione casuale di W
X(:,m+1)=-ones(t,1); 
storiapesi=zeros(m+1,n); 
storiappresi=zeros(1,n);

for i=1:n
    storiapesi(:,i)=W'; 
    Y=segno(W*X'); %Y è un vettore riga che contiene le t uscite
    storiappresi(i)=sum(T'==Y);
    for j=1:t
        if ne(Y(j),T(j))
            W=W+T(j)*X(j,:); 
        end
    end
end




