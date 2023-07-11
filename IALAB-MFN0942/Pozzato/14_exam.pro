furniture(wardrobe, 1).
furniture(bookshelf, 1).
furniture(bed, 1).
furniture(desk, 1).
furniture(chair, 1).

furniture(X) :- furniture(X, N).      /* Query 1: ?- furniture(X) */

number(X, N) :- furniture(X, N).      /* Query 2: ?- number( Object, Number) */
number(door, 1).
number(window, 2).

at(wall_1, wardrobe).                  /* Query 5: ?- at( At, Object) */
at(wall_1, door).
at(wall_2, bookshelf).
at(wall_2, bed).
at(wall_3, bed).
at(wall_3, window_1).
at(wall_3, desk).
at(wall_4, desk).
at(wall_4, window_2).
at(wall_4, wardrobe).
at(window_1, bed).
at(window_2, desk).

in(corner_1, wardrobe).                /* Query 6: ?- in( Place, Object) */
in(corner_3, bed).
in(corner_4, desk).

place(X, P) :- at(P, X).              /* Query 3: ?- place( Object, Place) */
place(X, P) :- in(P, X).
place(chair, at_desk).

left(door, bookshelf).                 /* Query 4: ?- left( Object1, Object2) */
left(bookshelf, bed).
left(bed, desk).
left(desk, wardrobe).
left(wardrobe, door).

right(X, Y) :- left(Y, X).            /* Query 4: ?- right( Object1, Object2) */
