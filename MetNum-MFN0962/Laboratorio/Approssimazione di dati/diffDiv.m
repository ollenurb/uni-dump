function DD = diffDiv(x, y)
% Prende in input due vettori rappresentanti i punti (x_i, y_i)
% Restituisce una struct con:
% DD.xn = contiene i nodi x
% DD.d = contiene i coefficienti calcolati con il metodo delle differenze
% divise
N = length(x);
DD.xn = x;
DD.d = y;

for it = 2:N
    % differenze divise di ordine (it-1)
    for j = N:-1:it
        DD.d(j) = (DD.d(j)-DD.d(j-1))/(DD.xn(j)-DD.xn(j-it+1));
    end
end
