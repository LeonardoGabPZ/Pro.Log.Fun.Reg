% Hechos proporcionados (Distancias entre ubicaciones)
distancia(nueva_cordoba, alta_cordoba, 3000).
distancia(nueva_cordoba, casco_centrico, 200).
distancia(casco_centrico, villa_allende, 4000).
distancia(alta_cordoba, villa_allende, 750).
distancia(nueva_cordoba, villa_arguello, 5000).
distancia(villa_arguello, villa_allende, 3000).
distancia(nueva_cordoba, las_palmas, 4000).
distancia(las_palmas, villa_allende, 3200).
distancia(nueva_cordoba, los_platanos, 2000).
distancia(los_platanos, san_fernando, 3000).
distancia(san_fernando, villa_allende, 1700).

% Reglas para encontrar la alternativa de viaje más corta
ruta_mas_corta(Desde, Hasta, Distancia) :-
    dijkstra(Desde, Hasta, Distancia).

% Reglas para encontrar la alternativa de viaje más larga
ruta_mas_larga(Desde, Hasta, Distancia) :-
    dijkstra_inverso(Desde, Hasta, Distancia).

% Algoritmo de Dijkstra para encontrar la ruta más corta
dijkstra(Desde, Hasta, Distancia) :-
    shortest_path(Desde, Hasta, [], Distancia).

shortest_path(Desde, Desde, _, 0).
shortest_path(Desde, Hasta, Visitados, Distancia) :-
    distancia_minima(Desde, Vecino, Dist),
    \+ member(Vecino, Visitados),
    shortest_path(Vecino, Hasta, [Vecino|Visitados], RestoDistancia),
    Distancia is Dist + RestoDistancia.

distancia_minima(Desde, Vecino, Distancia) :-
    distancia(Desde, Vecino, Distancia).
distancia_minima(Desde, Vecino, Distancia) :-
    distancia(Vecino, Desde, Distancia).

% Algoritmo de Dijkstra para encontrar la ruta más larga
dijkstra_inverso(Desde, Hasta, Distancia) :-
    longest_path(Desde, Hasta, [], Distancia).

longest_path(Desde, Desde, _, 0).
longest_path(Desde, Hasta, Visitados, Distancia) :-
    distancia_maxima(Desde, Vecino, Dist),
    \+ member(Vecino, Visitados),
    longest_path(Vecino, Hasta, [Vecino|Visitados], RestoDistancia),
    Distancia is Dist + RestoDistancia.

distancia_maxima(Desde, Vecino, Distancia) :-
    distancia(Desde, Vecino, Distancia).
distancia_maxima(Desde, Vecino, Distancia) :-
    distancia(Vecino, Desde, Distancia).
% Consulta para encontrar la ruta más corta desde Nueva Córdoba hasta Villa Allende
% ruta_mas_corta(nueva_cordoba, villa_allende, Distancia).
% La respuesta esperada dependerá de los datos proporcionados y el algoritmo de Dijkstra.

% Consulta para encontrar la ruta más larga desde Nueva Córdoba hasta Villa Allende
% ruta_mas_larga(nueva_cordoba, villa_allende, Distancia).
% La respuesta esperada dependerá de los datos proporcionados y el algoritmo de Dijkstra.
