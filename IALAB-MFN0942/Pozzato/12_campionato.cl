% Squadre del mondiali
team(
    qatar;
    olanda;
    brasile;
    argentina;
    inghilterra;
    germania;
    corea;
    arabia;
    ghana;
    camerun;
    giappone;
    canada;
    uruguay;
    australia;
    francia;
    spagna
).

% Stato in Continente
in(qatar, asia).
in(olanda, europa).
in(brasile, sudamerica).
in(argentina, sudamerica).
in(inghilterra, europa).
in(germania, europa).
in(corea, asia).
in(arabia, asia).
in(ghana, africa).
in(camerun, africa).
in(giappone, asia).
in(canada, nordamerica).
in(uruguay, sudamerica).
in(australia, oceania).
in(francia, europa).
in(spagna, europa).

% Vogliamo fare 4 gironi da 4 squadre, ciascuno con almeno 3 continenti
girone(1..4). % <=> girone(1;2;3;4).

% 1) Ad ogni squadra deve essere assegnato uno e un solo girone
1 { assegna(Squadra, Girone): girone(Girone) } 1  :- team(Squadra).

% 2) Ogni girone deve avere esattamente 4 squadre
4 { assegna(Squadra, Girone): team(Squadra) } 4 :- girone(Girone).

% 3) Ogni girone deve avere almeno 3 continenti diversi

% Per ogni Girone, andiamo a vedere tutte le coppie assegna(Squadra, Girone)
% che riguardano appunto tale girone, e inoltre "selezioniamo" (come se fosse
% una query) il predicato in(Squadra, Cont). Andiamo a contare di tutte queste
% coppie quelle che hanno continente (Cont) diverso.
% Una volta contato, vado ad aggiungere questo fatto nel modello (esplicito una
% conoscenza implicita)
num_cont(Girone, ContG) :-
    girone(Girone), ContG = #count{ Cont:assegna(Squadra, Girone), in(Squadra, Cont) }.

% A questo punto possiamo imporre il vincolo sul nmero di gironi
:- num_cont(Girone, ContG), ContG < 3.

% Definiamo una classe di squadre tali per cui non puo' essercene piu' di una
% per girone (perche' sarebbero troppo forti).
testa_di_serie(argentina; brasile; spagna; francia).

% Fai in modo che 2 teste di serie non finiscano nello stesso girone
:- assegna(S1, G),
   assegna(S2, G),
   S1 <> S2,
   testa_di_serie(S1),
   testa_di_serie(S2).

#show assegna/2.
#show num_cont/2.
