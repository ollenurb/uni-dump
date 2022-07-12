## Mini Ripasso di MATLAB/Octave
## (I seguenti esempi sono stati testati solamente su Octave)

# Le variabili si assegnano semplicemente con l'uguale
# Assegno un vettore RIGA di 3 elementi
B = [1, 2, 4]

# Vettore COLONNA di 3 elementi
A = [2;4;8]

# Matrice 3 x 3
M = [[1,1,1]; [2,2,2]; [3,3,3]]

# Trasposta di matrice
M'

# Accesso ad un elemento
M(1,1)

# Moltiplicare matrici
[[1, 2, 3]; [4, 5, 6]] * [[1; 2; 3], [4; 5; 6]]

# Moltiplicare punto-punto
[1, 2, 3] .* [4, 5, 6]

# Visualizzare grafici
# Con il comando `hold` si possono visualizzare piu' grafici nella stessa figura
X = linspace(0, 100)
Y = sqrt(X)
plot(X, Y, 'r-')
hold on
plot(X, X, 'b-')
hold off

# Dichiarazione di funzioni
function [y]=mean(x)
  [m, n] = size(x)
  if m==1
    m=n;
  endif
  y = sum(x)/m;
endfunction

mean(X)
