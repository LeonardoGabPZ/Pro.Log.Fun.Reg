% Hechos proporcionados
persona(barbara, mujer).
persona(susana, mujer).
persona(maría, mujer).
persona(juan, hombre).
persona(roberto, hombre).
persona(pedro, hombre).

amistad(barbara, roberto).
amistad(susana, juan).
amistad(barbara, juan).
amistad(barbara, maría).
amistad(susana, pedro).

sospechoso(susana).

% Regla para encontrar hombres que tuvieron amistad con Susana (a)
sospechoso_hombres_que_amigaron_con_susana(Hombre) :-
    persona(Hombre, hombre),
    amistad(Susana, Hombre).

% Regla para encontrar mujeres que tuvieron relación con hombres que Susana conocía (b)
sospechoso_mujeres_relacionadas_con_hombres_conocidos_por_susana(Mujer) :-
    persona(Mujer, mujer),
    amistad(Susana, Hombre),
    persona(Hombre, hombre),
    amistad(Hombre, Mujer).

% Regla para encontrar amigos de mujeres que tuvieron relación con hombres que Susana conocía (c)
sospechoso_amigos_de_mujeres_relacionadas_con_hombres_conocidos_por_susana(Amigo) :-
    persona(Amigo, hombre),
    amistad(Mujer, Amigo),
    persona(Mujer, mujer),
    amistad(Susana, Hombre),
    persona(Hombre, hombre),
    amistad(Hombre, Mujer).

% Ejemplos de consultas

% Consultar hombres que tuvieron amistad con Susana (a)
% sospechoso_hombres_que_amigaron_con_susana(Hombre).
% La respuesta esperada sería "Hombre = juan ;"

% Consultar mujeres que tuvieron relación con hombres que Susana conocía (b)
% sospechoso_mujeres_relacionadas_con_hombres_conocidos_por_susana(Mujer).
% La respuesta esperada sería "Mujer = maría ;"

% Consultar amigos de mujeres que tuvieron relación con hombres que Susana conocía (c)
% sospechoso_amigos_de_mujeres_relacionadas_con_hombres_conocidos_por_susana(Amigo).
% La respuesta esperada sería "Amigo = roberto ;"
