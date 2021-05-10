clear all;

N = 10;
A = rand(N);

x = rand(1, N)';
b = A*x;

% Parte 1
% risolvi il sistema con e senza pivoting
sol1 = lusolve_nopivot(A, b);
sol2 = lusolve_pivot(A, b);
% calcolo l'errore relativo in norma infinito
errSolve1 = norm(x - sol1, inf) / norm(x, inf);
errSolve2 = norm(x - sol2, inf) / norm(x, inf);

% Parte 2 
% decompongo senza pivot e calcolo errore
LU1 = ludecomp_nopivot_fast(A);
U1 = triu(LU1);
L1 = eye(N) + tril(LU1, -1);
errDec1 = norm(A - (L1*U1), inf);

% decompongo con pivot e calcolo errore
LU2 = ludecomp_pivot(A);
U2 = triu(LU2.B(LU2.P,:));
L2 = eye(N) + tril(LU2.B(LU2.P,:), -1);
errDec2 = norm(A(LU2.P, :)-L2*U2, inf);
