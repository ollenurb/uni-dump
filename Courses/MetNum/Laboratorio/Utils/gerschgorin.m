function gerschgorin(A)

% Cerchi riga e colonna di una matrice A
% a coefficienti complessi
error(nargchk(nargin,1,1));
if size(A,1) ~= size(A,2)
    error('La matrice deve essere quadrata');
    return;
end

% Per ogni riga e colonna
for i=1:size(A,1)
    % Centro del cerchio riga e colonna (h,k)
    % dove h è la parte reale di A(i,i) e
    % k è la parte immaginaria di A(i,i)
    h=real(A(i,i)); k=imag(A(i,i));

    % Raggio del cerchio riga
    r=0;
    for j=1:size(A,1)
       if i ~= j
           r=r+(norm(A(i,j)));
       end
    end

    % Raggio del cerchio colonna
    c=0;
    for j=1:size(A,1)
       if i ~= j
           c=c+(norm(A(j,i)));
       end
    end

    % Definiamo un vettore per rappresentare i punti sulla cisconferenza
    N=256;
    t=(0:N)*2*pi/N;

    % Grafico della circonferenza (riga)
    plot( r*cos(t)+h, r*sin(t)+k ,'b-');
    hold on
    plot( c*cos(t)+h, c*sin(t)+k ,'g-');  %(colonna)

    % Evidenziamo il centro
    hold on;
    plot( h, k,'k+');
end

% Per visualizzare meglio le circonferenze (e non vedere ellissi...)
axis equal;

% Come ulteriore verifica, rappresentiamo anche gli autovalori
ev=eig(A);
for i=1:size(ev)
    rev=plot(real(ev(i)),imag(ev(i)),'ro');
end
hold off;
legend(rev,'Autovalori');

end
