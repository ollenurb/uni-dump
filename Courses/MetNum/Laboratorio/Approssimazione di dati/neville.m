function p = neville(DD, xx)
% Evaluate the given Newton's polynomial
% Inputs:
%   DD: The struct of divided differences computed using `diffDiv.m`
%   xx: The vector of xs on which the polynomial has to be evaluated
% Outputs:
%   p: A vector containing the values of the given polynomial evaluated at
%   each xx point

N = length(DD.d);
p = 0*xx + DD.d(N);

for i = N-1:-1:1
    p = p.*(xx-DD.xn(i)) + DD.d(i);
end