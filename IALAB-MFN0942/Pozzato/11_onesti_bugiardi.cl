% Su un isola ci sono due tipi di persone: chi dice sempre la verita' e chi
% dice sempre le bugie.
% Scorrazzando per l'isola incontriamo 3 persone (a, b, c):
%    - a dice che sia b che c sono onesti
%    - b dice che a e' bugiardo, ma c e' onesto
% Dobbiamo capire se a, b e c sono onesti/bugiardi
persona(a; b; c).
tipo(onesto; bugiardo).

% Ad ogni persona associamo uno e un solo tipo
1 { ha_tipo(P, T): tipo(T) } 1 :- persona(P).
% Per ogni persona andiamo aggiungere nel nostro modello UNA clausola
% ha_tipo(P_i, T_j)

dice_il_vero(a) :- ha_tipo(b, onesto), ha_tipo(c, onesto).
dice_il_vero(b) :- ha_tipo(a, bugiardo), ha_tipo(c, onesto).

% Scartiamo tutti i modelli in cui P e' bugiardo e dice il vero
:- ha_tipo(P, bugiardo), dice_il_vero(P).
% ..e anche quelli in cui P e' onesto e non dice il vero
:- ha_tipo(P, bugiardo), not dice_il_vero(P).

% Qui mettiamo una negazione per fallimento perche' -dice_il_vero non lo
% "deriviamo" da nessuna parte (siccome e' semplicemente un alias di un
% predicato specifico)
