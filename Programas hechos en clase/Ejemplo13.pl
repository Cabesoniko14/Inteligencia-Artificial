:-dynamic antes_de/2.

antes_de(ayer,hoy).
antes_de(hoy,maniana).

%Lleva doble parentesis para primero encapsular toda la regla y luego pasarla como un solo argumento a assertz, ya que assertz es de aridad 1.

main:-
    not(antes_de(ayer,maniana)),write("uno"),nl,
    assertz((antes_de(X,Y):-antes_de(X,Z),antes_de(Z,Y))),write("dos"),nl,
    antes_de(ayer,maniana),write("tres"),nl,!.