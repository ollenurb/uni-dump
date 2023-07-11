% The use of the ASP (Answer Set Programming) paradigm is required for the
% generation with clingo of the calendar of a sports competition, in particular
% of a championship having the following characteristics:
% X 20 teams are registered;
% * The championship includes 38 days, 19 outward and 19 return NOT
%   symmetrical, i.e. return day 1 does not necessarily coincide with day 1 first
%   leg with reversed fields;
% * Each team refers to a city, which offers the facility where the team play
%   matches at home;
% * Each team faces all other teams twice, once at home and once once away from
%   home, i.e. once in one's own city of reference and once in that of the other
%   team;
% * Two of the 20 teams refer to the same city and share the same playing
%   structure, so they cannot both play at home in the same day. Obviously, the
%   two days in which they play are an exception against each other (derby).
squadra(
    inter;
    milan;
    atalanta;
    fiorentina;
    lecce;
). 

citta(
    milano;
    bergamo;
    firenze;
    lecce;
).

% Enumeriamo gli assegnamenti tra le citta' e le squadre, se si volesse
% lasciare la possibilita' di assegnare automaticamente anche le citta' si
% potrebbe utilizzare il seguente vincolo:
% % Ad ogni squadra devo assegnare una sola citta'
% 1 { stadio(Squadra, Citta): citta(Citta) } 1 :- squadra(Squadra).
% % Ad ogni citta' devo assegnare minimo 1 massimo 2 squadre
% 1 { stadio(Squadra, Citta): squadra(Squadra) } 2 :- citta(Citta).

stadio(inter, milano).
stadio(milan, milano).
stadio(atalanta, bergamo).
stadio(fiorentina, firenze).
stadio(lecce, lecce).

giornata(1..10).

% L'approccio e' il seguente: Prima creiamo dei match tra squadre in modo da
% imporre piu' facilmente alcuni vincoli, successivamente andiamo ad assegnare
% questi match alle diverse giornate

% Creiamo tutte le possibili permutazioni di coppie Squadra1-Squadra2. In
% questo modo otteniamo automaticamente che ogni squadra gioca contro tutte le
% altre 2 volte: Una volta in andata e una volta in ritorno
% 4 e' il numero di squadre -1 (cioe' se stessa)
4 { match(Squadra1, Squadra2): squadra(Squadra2), Squadra1 <> Squadra2 } 4 :- squadra(Squadra1).

% Per ogni match assegnalo ad una sola giornata
1 { assegna(Squadra1, Squadra2, Giornata): giornata(Giornata) } 1 :- match(Squadra1, Squadra2).

% Una squadra non puo' giocare piu' partite nello stesso giorno
:- assegna(Squadra1, Squadra2, Giornata),
   assegna(Squadra1, Squadra3, Giornata),
   Squadra2 <> Squadra3.

:- assegna(Squadra1, Squadra2, Giornata),
   assegna(Squadra3, Squadra2, Giornata),
   Squadra1 <> Squadra3.

:- assegna(Squadra1, Squadra2, Giornata),
   assegna(Squadra3, Squadra1, Giornata),
   Squadra2 <> Squadra3.

:- assegna(Squadra1, Squadra2, Giornata),
   assegna(Squadra2, Squadra3, Giornata),
   Squadra1 <> Squadra3.

% Non devono esistere dei match di andata e ritorno nel girone di andata
:- assegna(Squadra1, Squadra2, Giornata1),
   assegna(Squadra2, Squadra1, Giornata2),
   Giornata1 <= 5, Giornata2 <= 5.

% Non devono esistere dei match di andata e ritorno nel girone di ritorno
:- assegna(Squadra1, Squadra2, Giornata1),
   assegna(Squadra2, Squadra1, Giornata2),
   Giornata1 > 5, Giornata2 > 5.

% Evita che due squadre che hanno lo stesso stadio giochino in casa nella
% stessa giornata
:- assegna(Squadra1, Squadra2, Giornata),
   assegna(Squadra2, Squadra3, Giornata),
   stadio(Squadra1, Stadio),
   stadio(Squadra2, Stadio),
   Squadra1 <> Squadra2.


% +======+ Vincoli Facoltativi +======+
 
% La distanza tra andata e ritorno tra due partite deve essere di almeno 10 giornate
% :- assegna(Squadra1, Squadra2, GiornataAndata),
%    assegna(Squadra2, Squadra1, GiornataRitorno),
%    |GiornataAndata - GiornataRitorno| < 5.

% Ciascuna squadra non deve mai giocare piu' di due partite di seguito in casa..
% :- assegna(Squadra1, Squadra2, Giornata1),
%    assegna(Squadra1, Squadra3, Giornata2),
%    assegna(Squadra1, Squadra4, Giornata3),
%    Giornata2 == Giornata1 + 1,
%    Giornata3 == Giornata1 + 2.

%..e fuori casa
% :- assegna(Squadra2, Squadra1, Giornata1),
%    assegna(Squadra3, Squadra1, Giornata2),
%    assegna(Squadra4, Squadra1, Giornata3),
%    Giornata2 == Giornata1 + 1,
%    Giornata3 == Giornata1 + 2.


% #show match/2.
#show assegna/3.
