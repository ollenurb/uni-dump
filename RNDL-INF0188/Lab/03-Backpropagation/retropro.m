% Inp: Dati di input (in questo caso sara' il dataset) (?)
% Targ: Vettore che per ogni input da il target associato (e' il vettore di labels)
% nhid: Numero di layer hidden
% Eta: Learning rate
% Err: Threshold dell'errore
% Nmax: Numero massimo di iterazioni
% seme: Random Number Generator Seed
function [A,B,R,err,c]=retropro(Inp,Targ,nhid,Eta,Err,Nmax,seme);
%
tic
%
[N,n_features]=size(Inp);
% z = numero di neuroni in output. In generale e' pari al numero di classi con
% cui si vuole andare a classificare gli esempi
[N1,z]=size(Targ);

% Se il numero di righe della matrice di input non e' uguale al numero delle
% righe della matrice output allora il dimensionamento e' errato, per cui termina
if N~=N1
  fprintf('Dimensionamento non corretto\n\n');
  return;
end

%Inizializzazione random dei pesi
rand('state',seme);
% A = matrice dei pesi (nhid x n_features) dei neuroni Hidden
% Ci sono tanti neuroni quante features in input in ogni layer
A=2*(rand(nhid,n_features)-0.5*ones(nhid,n_features));
% B = matrice dei pesi per i neuroni nell'output layer
% Il numero di neuroni e' pari al numero di
B=2*(rand(z,nhid)-0.5*ones(z,nhid));

Inp=Inp';
Targ=Targ';
Nd=N*z;
err=[];

c=0;
ciclo=0;

while ciclo==0
  % f e' la funzione di attivazione
  % y_A = f(A * Inp)  (valori y dei neuroni hidden)
  % y_B = B * y_A     (valori y dei neuroni output)
  R=f(B*f(A*Inp));
  % q e' lo scarto quadratico medio rispetto all'intero dataset Inp
  % La parte cruciale e' dove si calcola l'errore facendo la differenza
  % ra l'input della rete (R) e l'ouput desiderato (Targ). Ogni elemento
  % di questa matrice risultante viene poi elevato al quadrato
  q=ones(1,z)*((R-Targ).^2)*ones(N,1)/Nd;
  err=[err q];

	if q<=Err | c>=Nmax
		ciclo=1;
	end

	if ciclo==0
		c=c+1;
		for k=1:N
			Yhid=f(A*Inp(:,k));                   % Outputs dei neuroni Hidden
			Out=f(B*Yhid);                        % Outputs della rete (neuroni output)
			DOut=(Targ(:,k)-Out).*Out.*(1-Out);   % Segnali di errore delta (neuroni output)
			E=DOut'*B;                            % Errore totale
      B=B+DOut*Yhid';                       % Update dei pesi dei neuroni in Output
			DYhid=Eta*E'.*Yhid.*(1-Yhid);         % Segnali di errore delta (neuroni hidden)
			A=A+DYhid*Inp(:,k)';                  % Update die pesi dei neuroni Hidden
		end
	end
end
R=R';
