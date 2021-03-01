clear all;

alpha = 0.73908513321516
phi = @(t) cos(t)

TOLLS = logspace(0, -10, 11)
SOLS = [] % vector of solutions

for toll=TOLLS
    SOLS(end+1) = puntoFisso2(phi, 0.5, toll, 0.7);
end

RERRS = abs(alpha - SOLS) % vector of real errors

x = [0:1:10]

% Tollerances are always greater than the real errors
% according to this plot. The error also converges to 
% 0 so the method is stable.
semilogy(x, RERRS, x, TOLLS);

% what happens when we set L > 0.7?
[x1, nit1, INC1, L1] = puntoFisso2(phi, 0.5, toll, 0.9);
% number of iterations increases 