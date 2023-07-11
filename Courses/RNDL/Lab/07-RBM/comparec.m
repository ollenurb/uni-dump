%confronta due matrici della stessa dimensione
%restituisce il numero delle d colonne diverse
%e la percentuale p di quelle uguali
%[d,p]=comparec(a,b);

function [d,p]=comparec(a,b);

[k,n]=size(a);
ris=0;

for i=1:n
if all(a(:,i)==b(:,i))
ris=ris+1;
end
end

d=n-ris;
p=(ris/n)*100;


