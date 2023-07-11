clear all;

% dichiaro una matrice 50x50
A = rand(50);
% misuta il tempo di ludecomp_nopivot
tic;
ludecomp_nopivot(A);
t1 = toc;
% misura il tempo di ludecomp_nopivot_fast
tic;
ludecomp_nopivot_fast(A);
t2 = toc;
% stampa i risultati
fprintf('ludecomp_nopivot took %.6f seconds, while ludecomp_notpivot_fast took %.6f seconds\n', t1, t2);

% Risolviamo due sistemi lineari. I dati dei vettori dei termini noti sono forniti dal foglio del laboratorio
A = [1 2 1 1; 1 1 3 3; 3 3 12 10; -2 -3 2 -4];
b1 = A*ones(1,4)';
b2 = A*[2 -1 3 4]';

x1 = lusolve_nopivot(A, b1);
x2 = lusolve_nopivot(A, b2);
x1 % x1 deve essere uguale a [1 1 1 1]'
x2 % x2 deve essere uguale a [2 -1 3 4]'

