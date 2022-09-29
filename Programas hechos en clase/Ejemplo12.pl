:-dynamic pais/1.
pais(holanda).
pais(francia).

repite.
repite:-
    repite. 
escribe_paises:-
    pais(X),
    X\==ya,
    write(X),nl,
    fail.
escribe_paises. 
main:-
    write("Dame los nombres de varios países y escribe ya cuando quieras terminar."),
    nl, 
    repite,
    read(Pais),
    asserta(pais(Pais)),
    Pais==ya,
    escribe_paises.

/*Escribe países el usuario, y cuando decida terminar de apuntarlos, escribe ya y la computadora imprime todos.*/
/*Si agrega ya, pero mi escribe países decide no imprimirlo con el X\== ya*/
