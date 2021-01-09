function [x, nit, INC, L] = puntoFisso2(phi, x0, toll, L, maxIt)
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

if (nargin<=4)
    maxIt = 1000
end

nit=0
INC=[]
est=1

while (nit<maxIt && est >= toll)
    x=phi(x0);
    inc=abs(x-x0); 
    est=inc/(1 - L)
    x0=x;
    if(nargout>=3)
        INC(end+1)=inc; 
    end 
    nit=nit+1; 
end
