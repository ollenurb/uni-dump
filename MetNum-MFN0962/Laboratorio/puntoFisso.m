function [x, nit, INC] = puntoFisso(phi, x0, maxIt)
% Inputs: 
% * phi: The function for which the fixed point is calculated
% * x0: The starting value
% * maxIt: Maximum number of iterations allowed 
% Outputs: 
% * x: Last fixed point method iteration (x_k)
% * nIt: Last number of iterations
% * INC: Increments list

nit=0
INC=[]
while(nit<maxIt)
    x=phi(x0);
    inc=x-x0;
    x0=x;
    if(nargout>=3)
        INC(end+1)=abs(inc); 
    end 
    nit=nit+1; 
end