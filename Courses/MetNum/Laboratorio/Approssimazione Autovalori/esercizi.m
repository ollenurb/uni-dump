clear all;
A = [15 -2 2; 1 10 -3; -2 1 0];
B = [1 0.1 0.2; 0.2 4 0.3; 0.4 0.5 8];
C = [17 2 2; 1 10 3; 1 2 0];
D = [3 0 1 0; 0 11 1 -1; 1 1 10 2; 0 -1 2 20];
E = [2 1 3 4; 1 -3 1 5; 3 1 6 -2; 4 5 -2 -1];

%% Esercizio 1
% Calcolare il condizionamento del problema del calcolo degli autovalori
c = condeig(A);
x = linspace(1,1, length(c));
semilogy(x, c, 'o');
hold on;
c = condeig(B);
x = linspace(1,1, length(c));
semilogy(x, c, 'o');

c = condeig(C);
x = linspace(1,1, length(c));
semilogy(x, c, 'o');

c = condeig(D);
x = linspace(1,1, length(c));
semilogy(x, c, 'o');

%% Esercizio 2: 
% Utilizzate le function per calcolare gli autovalori estremali
toll = 1e-6;
x = [1,2]
lM = potenze_toll(A, toll, 100);
lm = potenze_inverse(A, toll, 100);
eigExa = eig(A);
lMExa = max(eigExa);
lmExa = min(eigExa);
fprintf('Errore autovalore massimo: %5.3e\n', abs(lMExa - lM));
fprintf('Errore autovalore minimo: %5.3e\n', abs(lmExa - lm));

%% Esercizio 3:
% Localizzare gli autovalori di E con Gerschgorin
% Usate potenze con t_0 = [1,1,1,1]'. Perche' converge molto lentamente?
% Usare potenze_inverse per calcolare lm, come converge in questo caso?
% Cosa possiamo dire sul condizionamento del problema?
gerschgorin(E); % possiamo localizzarli anche a mano
lM = potenze(E, 100, ones(1, length(E))');

%% Esercizio 4: 
% Ripetere esperimento a pagina 158 nr. 6.2

