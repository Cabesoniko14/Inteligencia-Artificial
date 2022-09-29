:- use_module(library(lists)).

%Programa realizado por Javier Nieto Merodio e Israel Cabrera Portillo. 

/****************************************************************************/

%Calculadora de Polinomios.

% Este programa consiste en una calculadora que permite construir, 
% evaluar, y aplicar operaciones básicas a polinomios de una variable con 
% coeficientes enteros (positivos o negativos). El objetivo del programa 
% es aprender a programar con prolog, identificando así sus diferencias
% y similitudes con otros lenguajes de programación.

/****************************************************************************/

%¿Cómo funciona el programa?

% Para crear un polinomio, se usa una lista de Prolog. Esta lista debe contener 
% los coeficientes del polinomio ordenados de menor a mayor grado del término. 
% Entonces, el término independiente corresponde a la primera posición de la 
% lista, el término de grado 1 a la segunda, etc. De tener coeficiente 0 para 
% un término, el espacio del coeficiente y grado respectivo se ocupa con un 0. 
% Una vez construida la lista, se incorpora a las diferentes funciones del 
% programa; los polinomios no se almacenan como variable ni como conocimiento.

%Ejemplos para probar el funcionamiento del programa.

% A continuación, se ofrecen los resultados que debe arrojar la construcción,
% evaluación, composición, y aplicación de operaciones de distintos
% polinomios, así como el código para ejecutarlas en la terminal.

%*  imprime_polinomio([0],zero).
%*  imprime_polinomio([1,2,3,4],p(x)).
%*  imprime_polinomio([5,0,3],q(x)).
%*  suma([1,2,3,4],[5,0,3],X),imprime_polinomio(X,p(x) + q(x)).
%*  multiplica([1,2,3,4],[5,0,3],X),imprime_polinomio(X,p(x) * q(x)).
%*  composicion([1,2,3,4],[5,0,3],X), imprime_polinomio(X,p(q(x))).
%*  resta([0],[1,2,3,4],X),imprime_polinomio(X,0 - p(x))
%*  evaluar([1,2,3,4],3,X),write(p(x)),write( = ),write(X).
%*  derivada([1,2,3,4],X),imprime_polinomio(X,p'(X)).
%*  derivada([1,2,3,4],X),derivada(X,Y),imprime_polinomio(Y,p''(X)).

%*  zero(x)     = 0
%*  p(x)        = 4x^3 + 3x^2 + 2x + 1
%*  q(x)        = 3x^2 + 5
%*  p(x) + q(x) = 4x^3 + 6x^2 + 2x + 6
%*  p(x) * q(x) = 12x^5 + 9x^4 + 26x^3 + 18x^2 + 10x + 5
%*  p(q(x))     = 108x^6 + 567x^4 + 996x^2 + 586
%*  0 - p(x)    = -4x^3 - 3x^2 - 2x - 1
%*  p(3)        = 142
%*  p'(x)       = 12x^2 + 6x + 2
%*  p''(x)      = 24x + 6

/****************************************************************************/

%Sumar 
% Recibe tres parámetros: el primero representa el polinomio 1, el segundo
% el polinomio 2 y el tercero el resultado de sumar ambos polinomios.

suma([],[],[]):-!.   % La suma de dos polinomios vacíos resultará en un 
                     % polinomio vacío.
suma(Co1,[],Co1):-!. % Al sumar un polinomio 1 con n elementos más un  
                     % polinomio 2 vacío, el resultado será el polinomio 1
                     % de n elementos.
suma([],Co2,Co2):-!. % Al sumar un polinomio 2 con n elementos más un 
                     % polinomio 1 vacío, el resultado será el polinomio 2 de
                     % n elementos.
suma([Ca1|Co1], [Ca2|Co2], [Ca3|Co3]) :- % Caso donde sumamos dos listas no
                                         % vacías.
   Ca3 is (Ca1)+(Ca2), % La cabeza de la lista resultado será la suma de las 
                       % cabezas de polinomio 1 y polinomio 2.
   suma(Co1, Co2, Co3). % Llamadas recursivas para extraer los coeficientes 
                        % de las colas de polinomio 1 y polinomio 2.


%Restar 
% Al igual que la suma recibe tres parámetros: el primero representa el 
% polinomio  1, el segundo el polinomio 2 y el tercero el resultado de sumar
% ambos polinomios.

resta([],[],[]):-!. % La resta de dos polinomios vacíos resultará en un 
                    % polinomio vacío.
resta(Co1,[],Co1):-!. % Al restar un polinomio 1 con n elementos más un 
                      % polinomio  2 vacío, el resultado será el polinomio 1 
                      % de n elementos.
resta([],Co2,Co2):-!. % Al restar un polinomio 2 con n elementos más un 
                      % polinomio 1 vacío, el resultado será el polinomio 2 de
                      % n elementos.
resta([Ca1|Co1], [Ca2|Co2], [Ca3|Co3]) :- % Caso donde restamos dos listas
                                          % no vacías.
   Ca3 is Ca1-Ca2, % La cabeza de la lista resultado será la resta de las 
                   % cabezas de polinomio 1 y polinomio 
   resta(Co1, Co2, Co3). % Llamadas recursivas para extraer los coeficientes 
                         % de las colas de polinomio 1 y polinomio 2.


%Multiplicación
% Esta función fue elaborada por nosotros, pero no se consiguió 
% que funcionara. Como la función de composición requiere de este método, 
% en la parte inferior se encuentra una función de multiplicación extraída 
% de internet para que todo el programa funcione. Posee tres argumentos,
% dos de ellos de entrada que representan la lista de los polinomios
% a multiplicar y la salida que será la lista con los resultados de 
%  multiplicar ambos polinomios.
multiplicación([],[],[]):-!.% Si se reciben dos argumentos de entrada tal 
                            % que son listas vacías, el resultado será una 
                            % lista vacía.
multiplicación(_,[],[]):-!.% Sin importar la lista recibida en la primer 
                           % entrada,  si la segunda lista es vacía, el 
                           % resultado será una lista vacía.
multiplicación([],_,[]):-!.% Caso de entrada lista vacía, sin importar 
                           % lo que exista como segunda entrada, el resultado 
                           % es una lista vacía.

multiplicación([Ca1|Co1],Lis2, R):- % Caso donde multiplicamos dos listas 
                                    % no vacías  siguiendo el algoritmo visto 
                                    % en clase.
  mult_coef(Ca1,Lis2,Y), % Primero multiplicamos la cabeza de la lista 1 
                         % por el resto de coeficientes en la lista 2 y 
                         % guardamos los resultados en la variable Y.
  suma(Y,R,X),          % Seguido, sumamos el resultado de Y con la respuesta R
                        % que  contiene el resultado de las multiplicaciones 
                        % previas.
  multiplicación(Co1, [0|Lis2],X). % Método recursivo para multiplicar la 
                                   % cola de la  lista polinomio 1 con el  
                                   % polinomio dos, agregando un cero por 
                                   % cada vuelta recursiva que tenga que
                                   % ejecutar y guardando cada una de esas 
                                   % ejecuciones en la variable X.


% Este método fue obtenido de stackoverflow 
% (https://stackoverflow.com/questions/26936560/multiply-two-polynomials-in-prolog)                    
% con la intención de que la ejecución del método composición no falle.
multiplica([],[],[]):-!.% Si se reciben dos argumentos de entrada tal que son 
                        % listas vacías, el resultado será una lista vacía.
multiplica(_,[],[]):-!. % Sin importar la lista recibida en la primer entrada, 
                        % si la segunda lista es vacía, el resultado será una 
                        % lista vacía.
multiplica([],_,[]):-!. % Caso de entrada lista vacía, sin importar lo que 
                        % exista como  segunda entrada,el resultado es una 
                        % lista vacía.
multiplica(P1,[A|B], R):- % Caso donde multiplicamos dos listas no vacías, 
                          % el resultado será una lista con la multiplicación 
                          % de ambos polinomios.
   multiplica(P1, B , X), % Llamada recursiva para extraer el coeficiente de la 
                          % cola de la segunda lista y
                            %guardarlo en la variable X.
   mult_coef(A,P1,Y), % Método que multiplica la cabeza de la segunda lista por 
                      % el polinomio 1 y guarda los resultados en la lista Y.
   suma(Y,[0|X], R).  % Suma los coeficientes de los polinomios resultantes 
                      % cuyos grados son iguales.


%Multiplicación de coeficiente por polinomio.
% Recibe tres parámetros, el primero es el coeficiente por el que se hará la 
% multiplicación del polinomio que es la lista recibida en el segundo
% argumento. El tercer argumento será la lista resultante de efectuar la 
% multiplicación.
mult_coef([],_,[]):-!. % Si multiplicamos una lista vacía, sin importar lo
                       % que exista en el segundo argumento, la respuesta 
                       % será una lista vacia.
mult_coef(_,[],[]):-!. % Sin importar el coeficiente, si lo multiplicamos 
                       % por una lista vacía de polinomios, el resultado 
                       % será una lista vacía.
mult_coef([],[],[]):-!. % Al multiplicar dos listas vacías, la salida será 
                        % una lista vacía.
mult_coef(Coef,[Ca2|Co2],[Z|Zr]):-  % Para el caso donde multiplicamos el
                                    %  coeficiente, por una lista no vacía 
                                    % de polinomios.
   Z is Coef*Ca2,       % La cabeza de la respuesta representada por la letra 
                        % Z será el resultado de multiplicar el coeficiente
                        % por la lista de polinomios, representada por Ca2.

   mult_coef(Coef,Co2,Zr). % Llamada recursiva para extraer el resto de 
                           % Coeficientes del polinomio para seguir 
                           % multiplicándolos por el coeficiente.
%Derivar
% Para hacer este método se crearon dos versiones:
% La primera versión cuenta con dos parámetros: el polinomio a derivar y el
% polinomio resultante.
% La segunda versión contiene contiene tres: primero el grado del polinomio, 
% después la lista a derivar y al final el resultado de la diferenciación.
derivada(_,[],[]):-!. % Se detiene si la segunda y tercera lista son vacías
derivada([],_):-!. % Se detiene si la primera lista es vacía sin importarle 
                   % el contenido de la segunda
derivada(Lista,R):-
  derivada(0,Lista,R). % Aquí se llama a la sobrecarga iniciando con el 
                       % exponente 0.
derivada(0,[_|T],R):-
  derivada(1,T,R). % Esta llamada separa la cola 
derivada(Grado,[Ca1|Ca2],[A|B]):-
  Aux is Grado+1, % Condición que aumenta el grado en 1
  derivada(Aux,Ca2,B), % Llamada recursiva que contiene el nuevo valor del 
                       % grado y la cola del polinomio.
  A is Ca1 * Grado. % Se deriva multiplicando el coeficiente por su exponente 
                    % y se agrega a la lista resultado.

%Composición.
% Contiene tres parámetros: el primero representa a p(x), el segundo 
% representa a q(X) y el tercero es la composición de p(q(x)).

composición([],_,[0]):-!. % Se detiene si la primera lista es vacía y el 
                          % resultado es el polinomio cero.
composición([A|B],Y,Res):-
    composición(B,Y,X), % Llamadas recursivas para extraer los coeficientes
                        % de p(x).
    multiplica(X,Y,Mult), % Según el método de Horner, evalúa q(x) en 
                              % p(x). Primero, realiza la composición de q(x) 
                              % en p(x).
    suma([A],Mult,Res). % Posteriormente, suma los grados iguales de los 
                        % coeficientes.


%Imprimir polinomio.
% Recibe como argumentos una lista de coeficientes de un polinomio, y el
% nombre del polinomio, o bien, la letra con la que se identifica. Esta 
% función imprime de la siguiente forma: NomLista = polinomio. 

imprime_polinomio([],_). % Caso base donde recibe una lista vacía y no
                         % regresa una impresión. 
imprime_polinomio(Lista,NomLista):- % Función principal.
    reverse(Lista,ListaR), % Usando bibliotecas oficiales de SWI - Prolog,
                           % invierte la lista para imprimir de mayor a 
                           % menor grado.
    write(NomLista), % Instrucciones para imprimir con el formato adecuado.
    write(" = "),
    imprime_primer(ListaR). % Llama a una función recursiva.

imprime_primer([X|Y]):- % Recibe como único argumento la lista invertida.
                        % Se encarga de imprimir el primer coeficiente de la
                        % lista, ya que la forma de escribir su signo cambia.
    X=\=0,
    length([X|Y],Z), % Usa la función length ya incorporada en SWI-Prolog para
                     % revisar el grado del polinomio y/o los términos.
    Z>2, % Trabaja con el caso en el que el coeficiente es de grado mayor 
         % o igual a 2 y no es un 0.
    signo_inicio(X),  % Imprime el signo negativo si es negativo, y nada si es
                      % positivo.
    abs_val_write(X), % Imprime el coeficiente sin signo.
    write("x"), % Impresión de X y su grado respectivo al ser >= 2.
    write("^"),
    Z1 is Z -1, % El grado del término es la longitud de la misma menos 1, ya que
                % el término independiente (grado 0), ocupa la última posición.
    write(Z1),
    imprime_main(Y). % Imprime los demás términos.

imprime_primer([X|Y]):- 
    length([X|Y],Z),
    Z=:=2, % Trabaja el caso en el que el coeficiente es del término grado 1, 
           % puesto que el formato de impresión muestra los términos de grado 1
           % como ax, y no ax^1.
    signo_inicio(X), % Sigue trabajando con ser el primer elemento de la lista.
    abs_val_write(X),
    write("x"),
    imprime_main(Y). % Imprime los demás términos.

imprime_primer([X]):- % Caso de impresión en el que el polinomio es de grado 0.
    signo_inicio(X),
    abs_val_write_1term(X). % Función que sirve únicamente para este caso. Ya 
                            % que si su único coeficiente es 0, lo imprime.

imprime_main(Lista):- % Función que imprime los términos de grado menor al del 
                      % polinomio a imprimir.
    length(Lista,X), 
    X>1, % Trabaja con el caso de imprimir términos de grado mayor a 0.
    imprime_termino(Lista).

imprime_main([X]):- % Trabaja el caso en el que solo queda un coeficiente de 
                    % grado 0.
    X =\=0, % Revisa que no sea un 0. De ser 0, no imprime el último término.
    signo(X),
    abs_val_write_fin(X).
imprime_main([_]). % Caso base de recursividad donde llegamos a un último coeficiente
                   % 0.

imprime_termino([X|Y]):- % Se encarga de imprimir términos de menor grado al del
                         % polinomio.
    X=\=0, % De ser 0, no imprime el término.
    length([X|Y],Z),
    Z > 2, % Revisa que sea de grado mayor o igual a 2.
    signo(X), % Imprime su signo.
    abs_val_write(X), % Imprime el coeficiente en valor absoluto.
    write("x"), % Imprime la variable x.
    write("^"), 
    Z1 is Z -1,
    write(Z1), % Imprime el grado del término.
    imprime_main(Y). % Continúa recursivamente con el resto de términos.

imprime_termino([X|Y]):- % Para esta instancia, sabemos que es de grado 1.
    X=\=0, % Nuevamente, se revisa no sea 0.
    signo(X),
    abs_val_write(X),
    write("x"), % Se imprime el signo, el coeficiente asociado y la variable x.
    imprime_main(Y). % Continúa recursivamente.

imprime_termino([X|Y]):-
    X =:=0, % De ser 0, no imprime y continúa recursivamente con el resto de términos.
    imprime_main(Y).

% Métodos adicionales para la función de imprimir polinomio.

abs_val_write(X):- % Es para imprimir coeficientes de los términos.
                   % Imprime un coeficiente.
    X>0, 
    X=\=1, %Si es diferente de uno y mayor a 0, imprime el coeficiente.
    write(X).

abs_val_write(X):- % Imprime coeficiente de no ser -1 y ser negativo.
    X<0,
    X=\=(-1),
    X1 is (X*(-1)), % Lo hace valor absoluto,
    write(X1).

abs_val_write(X):- % Caso de ser 0, no imprime nada.
    X =:= X, % Se usa simplemente para que sea true.
    write("").

abs_val_write_fin(X):- % En caso de ser el último término, grado 0.
    X>0, % Si es positivo lo escribe.
    write(X).

abs_val_write_fin(X):- % Si es negativo, lo escribe en valor absoluto.
    X<0,
    X1 is (X*(-1)),
    write(X1).

abs_val_write_1term(X):- % Únicamente para polinomios de grado 0.
    X>0,
    write(X). % Si es mayor a 0, imprime a X.

abs_val_write_1term(X):- % Si es menor a 0, imprime X*-1.
    X<0,
    X1 is (X*(-1)),
    write(X1).

abs_val_write_1term(X):- % Si 0 es el único coeficiente, lo imprime.
    X=:=0, 
    write(0).

signo(X):- % Para los términos de grado estrictamente menor al del 
           % polinomio.
    X>0, % Si es mayor a 0, imprime el signo +.
    write(" + ").
signo(X):- % Si es menor a 0, imprime el signo -.
    X<0, % Para evitar singleton variable.
    write(" - ").

signo_inicio(X):- % Para los términos de grado igual al del polinomio.
    X>=0,
    write("").
signo_inicio(X):-
    X<0, % Para evitar singleton variable.
    write(" - ").


%Evaluar.
% Evalúa un polinomio recibiendo como argumentos un polinomio y el número
% al que se quiere evaluar.

evaluar([0],_,R):-
    R is 0. % Caso base en el que recibe un polinomio igual a 0.

evaluar(Lista,Eval, R):-
    reverse(Lista, ListaR), % Invierte la lista para revisar más fácilmente
                            % el grado de los polinomios.
    eval_prim(ListaR,Eval, R). % Llama a una función recursiva.

eval_prim([],_,0). 
eval_prim([X|Y],Eval,R):-
    eval_prim(Y,Eval,W), % Llama recurisvamente a sí misma con
                         % el resto de los coeficientes. Primero se ejecuta
                         % esta por el funcionamiento de la pila.  
    length([X|Y],L),
    R is W + (X*(Eval**(L-1))). % Suma lo que lleve de la suma de la evaluación
                                % final con el argumento evaluado.








    