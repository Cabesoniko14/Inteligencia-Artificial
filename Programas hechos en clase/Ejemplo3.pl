/*valor_max(i,i,o):*/
/*!. hace que la búsqueda se haga más eficiente*/
valor_max(X,Y,X):-
    X>Y.
    !.
/*Ya no busca entre más valor_max*/
valor_max(_,Y,Y).
