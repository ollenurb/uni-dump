clear all, close all
X=[0,1,2,4];
Y=[1,-1,3,5];
DD=diffDiv(X,Y);
xx=linspace(0,4,100);
plot(X,Y,'ro');
yy=neville(DD,xx);
hold on
plot(xx,yy,'k')
yy1=(-xx.^3)+(6*xx.^2)-7*xx+1;
plot(xx,yy1,'b--')
legend('dati','polinomio Newton','polinomio teorico','location','northwest');
    
title 'Demo di diffDiv.m e neville.m'

