grande(bisonte).
grande(oso).
grande(elefante).
chico(gato).
cafe(oso).
cafe(bisonte).
negro(gato).
gris(elefante).
oscuro(Z):-
    cafe(Z).
oscuro(Z):-
    negro(Z).
/*Un animal para ser oscuro es cafe o negro, pero no gris*/
