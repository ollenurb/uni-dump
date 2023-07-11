function xs= cheby(n, m)
% Inputs:
%   n: Grade of the chebycheff polynomial
%   m: number of points to sample from the chebycheff's polynomial
% Output:
%   xs: A vector of the first m samples of the n^th Cheby poly
%
% Note: The interval can be changed with the following formula
% t_k = [(b-a)/2 * x_k] + [(a+b)/2]

k = 1:m;
xs = cos((2*k-1)/2/n*pi);