function [A,B,R,err,c]=retropro(Inp,Targ,nhid,Eta,Err,Nmax,seed);

global rbm_w;


[N,n]=size(Inp);
[N1,z]=size(Targ);
Inp= [Inp ones(N,1)];
n = n+1;%tengo conto del bias alle unità hidden

if N~=N1 
fprintf('Dimensionamento non corretto\n\n');
% break;
end

%Inizializzazione random dei pesi
rand('state',seed);

A=rand(nhid,n)-0.5;

A = [rbm_w, ones(nhid,1)];
B=rand(z,nhid+1)-0.5;%Tengo conto del bias a livello hidden



Inp=Inp';
Targ=Targ';
err=[];


c=0;
ciclo=0;

while ciclo==0
    Y=[f(A*Inp); ones(1, N)];%Output hidden più 1 per bias
    R=f(B*Y); 
	q=(0.5*ones(1,z)*((R-Targ).^2))*ones(N,1)/N;
        err=[err q];
        

	if q<=Err | c>=Nmax
		ciclo=1;
	end
	
	if ciclo==0
		c=c+1;
		for k=1:N
			%
			% Modifica di A e B.
			%
			Yhid=f(A*Inp(:,k));
			Out=f(B*[Yhid;1]);
			DOut=(Targ(:,k)-Out).*Out.*(1-Out);
			
			E=DOut'*B(:,1:nhid);
			DYhid=E'.*Yhid.*(1-Yhid);
            B=B+Eta*DOut*[Yhid;1]';
			A=A+Eta*DYhid*Inp(:,k)';
			%
		end
	end
end
R=R'; 
