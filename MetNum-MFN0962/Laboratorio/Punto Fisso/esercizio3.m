clear all;
phi = @(t) cos(t);
x0 = 2.5;

TOLLS = logspace(0, -10, 11);
NITS = []

for toll = TOLLS
    [x, nit] = puntoFisso3(phi, x0, toll);
    NITS(end + 1) = nit;
end

aX = [0:1:10];

semilogy(aX, NITS);

f = @(t) -0.5 * cos(t) * exp(-t) - t;
fFirst = @(t) 0.5*(sin(t)+cos(t)).*exp(-t)-1;

[x,nit]=puntoFisso3(@(t) t-f(t)./fFirst(t),-1,1e-3 ,0)
[x,nit]=puntoFisso3(@(t) t-f(t)./fFirst(t),-5,1e-3 ,0)
[x,nit]=puntoFisso3(@(t) t-f(t)./fFirst(t),-8,1e-3 ,0)
[x,nit]=puntoFisso3(@(t) t-f(t)./fFirst(t),-10,1e-3,0)