function DD=diffDivAggNodo(DDin, xnew, ynew)
% Add a new node to the already-calculated Newton's polynomial represented
% by DDin
% Inputs:
%   DDin: Divided differences
%   xnew: x-axis of the new point
%   ynew: y-axis of the new point
% Output:
%   DD: Divided differences struct that will contain the new coefficients

DD.xn = [xnew, DDin.xn];
DD.d = [ynew, DDin.d];
N = length(DD.d);

for i = 2:N
    DD.d(i) = (DD.d(i)-DD.d(i-1))/(DD.xn(i)-DD.xn(1));
end