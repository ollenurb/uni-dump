%% Plot the graph of the increments at each step of the algorithm
nIt = 10;
phi = @(x) cos(x);

[r1, nit1, inc1] = puntoFisso(phi, 1, nIt);
[r2, nit2, inc2] = puntoFisso(phi, 1.2, nIt);
[r3, nit3, inc3] = puntoFisso(phi, 0.5, nIt);

aX = [1:1:nIt];
semilogy(aX, inc1, aX, inc2, aX, inc3); % plotto l'andamento degli incrementi

%% Do the same with another function phi

phi2 = @(x)(x.^2 + 2)./(2*x);
[r1_2, nit1_2, inc1_2] = puntoFisso(phi2, 1, nIt);
[r2_2, nit2_2, inc2_2] = puntoFisso(phi2, 1.2, nIt);
[r3_2, nit3_2, inc3_2] = puntoFisso(phi2, 0.5, nIt);

semilogy(aX, abs(inc1_2), aX, abs(inc2_2), aX, abs(inc3_2));

%% 
phif = @(x) -sin(x);
phi2f = @(x) (2*x*2.*x-(x.^2+2)*2)./(4*x.^2);

x = linspace(0.7,1.7,100);
plot(x, phi2f(x), x, phif(x), 'r', r3_2, phi2f(r3_2), 'bo', r3_2, phif(r3_2), 'go');

