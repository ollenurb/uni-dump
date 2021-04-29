function DD=diffDivAggNodo(DDin, xnew, ynew)

DD.xn = [xnew, DDin.xn];
DD.d = [ynew, DDin.d];
N = length(DD.d);

for i = 2:N
    DD.d(i) = (DD.d(i)-DD.d(i-1))/(DD.xn(i)-DD.xn(1));
end