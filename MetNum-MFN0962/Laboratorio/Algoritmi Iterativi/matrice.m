function M=matrice(N)
I = [1:N 2:N 1:N-1];
J = [1:N 1:N-1 2:N];
S = [2*ones(1, N) -1*ones(1,N-1) -1*ones(1,N-1)];
M = sparse(I, J, S);