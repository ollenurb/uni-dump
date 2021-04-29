function p = neville(DD, xx)
N = length(DD.d);
p = 0*xx + DD.d(N);

for i = N-1:-1:1
    p = p.*(xx-DD.xn(i)) + DD.d(i);
end