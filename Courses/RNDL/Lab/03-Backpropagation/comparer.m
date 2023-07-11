%confronta due matrici della stessa dimensione
%restituisce il numero delle d righe diverse
%e la percentuale p di quelle uguali
%[d,p]=comparec(a,b);

function [d,p]=comparer(a,b);

at=a';
bt=b';

[k,n]=size(at);
ris=0;

for i=1:n
if all(at(:,i)==bt(:,i))
ris=ris+1;
end
end

d=n-ris;
p=(ris/n)*100;

%[d,p]=comparec(at,bt);




