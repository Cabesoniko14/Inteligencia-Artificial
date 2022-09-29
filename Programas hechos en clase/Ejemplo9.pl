/*combina(i,i,o), combina(o,i,i), combina(i,i,i) -->TF, combina(i,o,i)*/
/**/
combina([],Lista,Lista):-
    !.
/*Condición: lista vacía (explícita)*/
combina([X|Lista1],Lista2,[X|Lista3]):-
    combina(Lista1,Lista2,Lista3).

/*1. Separamos la primera lista en cabeza y cola*/
/*2. Agregamos un elemento a la tercera lista en la cabeza en cada llamada recursivo*/