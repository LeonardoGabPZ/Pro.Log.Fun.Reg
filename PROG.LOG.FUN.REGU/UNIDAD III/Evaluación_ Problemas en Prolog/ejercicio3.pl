% Hechos proporcionados
persona(juan).
persona(josé).
persona(jeremías).
persona(jorge).
persona(aída).
persona(analía).
persona(roberto).
persona(raúl).
persona(rodrigo).
persona(ana).
persona(anacleta).
persona(anastasia).

posee_auto(juan).
posee_auto(josé).
posee_auto(jeremías).
posee_auto(jorge).

vive_cerca(aída).
vive_cerca(analía).

vive_lejos(roberto).
vive_lejos(raúl).
vive_lejos(rodrigo).
vive_lejos(ana).
vive_lejos(anacleta).
vive_lejos(anastasia).

bebida(josé, jugo).
bebida(jeremías, jugo).
bebida(juan, vino).

se_dedico_a_bailar(jorge).

amigos(josé, ana).
amigos(jeremías, ana).
amigos(roberto, jeremías).
amigos(roberto, ana).
amigos(analía, juan).

% Reglas para determinar quiénes llegan seguros a casa

% Regla para determinar si alguien llega seguro a casa sin ayuda
llega_seguro_sin_ayuda(Persona) :-
    persona(Persona),
    (vive_cerca(Persona); vive_lejos(Persona), posee_auto(Persona)).

% Regla para determinar si alguien llega seguro a casa con ayuda
llega_seguro_con_ayuda(Persona) :-
    persona(Persona),
    posee_auto(Conductor),
    persona(Conductor),
    amigos(Conductor, Persona),
    (vive_cerca(Persona); vive_lejos(Persona), posee_auto(Persona)).

% Ejemplos de consultas

% Consultar quiénes llegan seguros a casa sin ayuda
% llega_seguro_sin_ayuda(Persona).
% La respuesta esperada sería "Persona = juan ;"

% Consultar quiénes llegan seguros a casa con ayuda
% llega_seguro_con_ayuda(Persona).
% La respuesta esperada dependerá de los datos proporcionados y las amistades establecidas.
