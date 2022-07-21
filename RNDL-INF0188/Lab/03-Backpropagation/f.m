function y=f(x)
%
[r,c]=size(x);
y=ones(r,c)./(1+exp(-x));
%
