% Predicado principal para iniciar la canción con 99 botellas
bottles_of_beer :- bottles_of_beer(99).

% Predicado recursivo para generar la letra de la canción
bottles_of_beer(0) :- !. % Caso base: no hay más botellas, termina la recursión
bottles_of_beer(N) :-
    write(N), write(' bottles of beer on the wall, '), write(N), write(' bottles of beer.'), nl,
    write('Take one down and pass it around, '), N1 is N - 1,
    write(N1), write(' bottles of beer on the wall.'), nl,
    bottles_of_beer(N1). % Llamada recursiva con N-1 para continuar la canción

%bottles_of_beer. pa´que jale al llavaso. 