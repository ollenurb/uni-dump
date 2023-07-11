function hop_plotpats(P)

% function hop_plotpats(P)
%
% routine plots the digits for the Hopfield network, the patterns
% are contained in the file hop_data.mat
%
% Hugh Pasika 1997

n1='zero' ;  n2='one';    n3='two' ;
n4='three';  n5='four';   n6='six' ;
n7='nine' ;  n8='block';

for i=1:8,
   subplot(3,3,i);
   hop_plotdig(P(:,i),12,10);
end
 
subplot(3,3,1); xlabel(n1) 
subplot(3,3,2); xlabel(n2);
subplot(3,3,3); xlabel(n3) ;
subplot(3,3,4); xlabel(n4) ;
subplot(3,3,5); xlabel(n5) ;
subplot(3,3,6); xlabel(n6) ;
subplot(3,3,7); xlabel(n7) ;
subplot(3,3,8); xlabel(n8);
