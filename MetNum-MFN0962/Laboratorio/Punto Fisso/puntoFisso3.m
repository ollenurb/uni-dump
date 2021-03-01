function [x, nit, INC, L] = puntoFisso3(phi, x0, toll, L, maxIt)
% Inputs: 
% * phi: The function for which the fixed point is calculated
% * x0: The starting value
% * maxIt: Maximum number of iterations allowed [optional: default 1000]
% * toll: Minimum tollerance
% Outputs: 
% * x: Last fixed point method iteration (x_k)
% * nIt: Last number of iterations
% * INC: Increments list
% * L: error constant

if (nargin < 5)
    maxIt = 1000;
end

if (nargin < 4) || (isempty(L))
    L = 1-eps;
    stimaL = true;
else
    stimaL = false;
end

if stimaL
    x1 = x0 % At first x1 is equal to x0
end

nit = 0
INC=[]
est=2*toll % Sets a number greater than toll so that it can enter the while loop

while(nit < maxIt) && (est > toll)
    x = phi(x0);
    inc = abs(x - x0);
    est = inc / (1 - L);
    
    if stimaL && nit > 1
        L = min((inc / abs(x0 - x1)),  1-eps);
        x1 = x0;
    end

    if nargin==4
        INC(end+1) = inc;  
    end
    x0 = x;
    nit = nit + 1;
end
    