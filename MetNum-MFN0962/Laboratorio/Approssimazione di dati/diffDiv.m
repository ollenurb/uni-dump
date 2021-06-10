function DD = diffDiv(x, y)
% Given two vectors that represent the points (x_i, y_i)
% Returns a struct DD with the folowing fields:
%   DD.xn = contains the x nodes
%   DD.d = contains the coefficients computed with the divided difference
%   method
N = length(x);
DD.xn = x;
DD.d = y;

for it = 2:N
    % Divided differences with order (it-1)
    for j = N:-1:it
        DD.d(j) = (DD.d(j)-DD.d(j-1))/(DD.xn(j)-DD.xn(j-it+1));
    end
end

% Why? this is because we only need the actual first values for the
% polynomial coefficients

% it:1 = [f(x1), f(x2), f(x3), f(x4)]
% it:2 = [f(x1), f[x1,x2], f[x2,x3], f[x3,x4]]
% it:3 = [f(x1), f[x1,x2], f[x1,x2,x3], f[x2,x3,x4]]
% it:4 = [f(x1), f[x1,x2], f[x1,x2,x3], f[x1,x2,x3,x4]]
% Finished