imprime_poli([],_).
imprime_poli(Lista,NomLista):-
    %Invertir lista.
    write(NomLista),
    write("(x) = "),
    imprime_main(Lista).

imprime_main(Lista):-
    length(Lista,X),
    X>1,
    imprime_termino(Lista).

imprime_main([X]):-
    X =\=0,
    signo(X),
    abs_val_write_fin(X).
imprime_main([_]).

imprime_termino([X|Y]):-
    X=\=0,
    length([X|Y],Z),
    Z > 2,
    signo(X),
    abs_val_write(X),
    write("x"),
    write("^"),
    Z1 is Z -1,
    write(Z1),
    imprime_main(Y).

imprime_termino([X|Y]):-
    X=\=0,
    signo(X),
    abs_val_write(X),
    write("x"),
    imprime_main(Y).

imprime_termino([X|Y]):-
    X =:=0,
    imprime_main(Y).



% Métodos adicionales

abs_val_write(X):-
    X>0,
    X=\=1,
    write(X).

abs_val_write(X):-
    X<0,
    X=\=(-1),
    X1 is (X*(-1)), 
    write(X1).

abs_val_write(X):-
    X =:= X,
    write("").






abs_val_write_fin(X):-
    X>0,
    write(X).

abs_val_write_fin(X):-
    X<0,
    X1 is (X*(-1)),
    write(X1).

signo(X):-
    X>0,
    write(" + ").
signo(X):-
    X<0, % Para evitar singleton variable.
    write(" - ").




    
