%Para todo tipo de combinación de dos inputs y un output.
/*Si queremos tener una cabeza consecutiva de dos elementos*/
/*Revisa elementos consecutivos*/
consecutivos(A,B,[A,B|_]):-
    !.
consecutivos(A,B,[_|R]):-
    consecutivos(A,B,R).