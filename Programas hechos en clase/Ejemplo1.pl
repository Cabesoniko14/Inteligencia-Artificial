hombre(jose).
mujer(maria).
hombre(juan).
/*El papá va en el primer argumento y el hijx en 
*el segundo.*/
papa(juan,jose).
papa(juan,maria).
papa(heriberto,yohaia).
valioso(dinero).
dificilDeObtener(dinero).
le_da(pedro,libro,antonio).

hermana(X,Y):-
    papa(Z,X),
    mujer(X),
    papa(Z,Y),write(Z),write(" "),write(X),write(" "),write(Y),nl,
    X\==Y.
/*Escribo todos los writes seguidos para que se imprima una vez que ya se cumplieron todas las condiciones.*/
/*X es hijo de Y si Y es papa de X y X es hombre.*/

hijo(X,Y):-
    papa(Y,X),
    hombre(X).
    
/* X es hijo de Y si Y es papá de X, y X es hombre*/

humano(X):-
    mujer(X),
    hombre(X).