pertenece_a(X,[X|_]):-
    !.
pertenece_a(X,[_|Z]):-
    pertenece_a(X,Z).
/*1era cláusula del predicado (caso base): X pertenece a una lista si es la cabeza, y la cola es irrelevante. */
/*Y si se cumple eso, ya no sigas buscando*/
/*Si llegamos a tener lista vacía (acabar la búsqueda) da false porque la lista vacía no tiene cola ni cabeza*/
/*2a cláusula: ahora la lista a la que se busca si pertenece es la cola de la lista. */

