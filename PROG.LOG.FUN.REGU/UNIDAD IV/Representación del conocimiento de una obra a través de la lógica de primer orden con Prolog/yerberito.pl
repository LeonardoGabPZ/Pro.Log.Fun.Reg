% Hechos: Plantas y sus propiedades
planta(digital).
planta(opio).
planta(ipecacuana).
planta(nuez_vomica).
planta(eleboro_blanco).
planta(colchico).
planta(belladona).
planta(quina).
planta(cacao).
planta(retama).
planta(coca).
planta(peyote).
planta(barbasco).
planta(neufar_amarillo).
planta(nyame).
planta(artemisa).
planta(yute).
planta(toloache).
planta(eucalipto).
planta(rosal).
planta(nopal).
planta(nogal).
planta(ocote).

propiedad(digital, tonico_cardiaco).
propiedad(opio, estupefaciente).
propiedad(ipecacuana, emetica).
% Define más propiedades para otras plantas según sea necesario

% Nombres científicos de las plantas
nombre_cientifico(digital, 'Digitalis purpurea').
nombre_cientifico(opio, 'Papaver somniferum').
nombre_cientifico(ipecacuana, 'Cephaelis ipecacuanha').
% Define más nombres científicos para otras plantas según sea necesario

% Nombres comunes de las plantas
nombre_comun(digital, digital).
nombre_comun(opio, opio).
nombre_comun(ipecacuana, ipecacuana).
% Define más nombres comunes para otras plantas según sea necesario

% Efectos sobre el organismo humano
efecto(digital, tonico_cardiaco).
efecto(opio, estupefaciente).
efecto(ipecacuana, emetica).
% Define más efectos para otras plantas según sea necesario

% Enfermedades comunes y tratamientos
enfermedad(resfriado, tos).
enfermedad(resfriado, congestion_nasal).
enfermedad(gastritis, dolor_estomago).
enfermedad(gastritis, acidez).
% Define más enfermedades y sus síntomas según sea necesario

tratamiento(resfriado, eucalipto).
tratamiento(gastritis, nogal).
% Define más tratamientos para otras enfermedades según sea necesario

% Reglas
trata_enfermedad(Planta, Enfermedad) :-
    tratamiento(Enfermedad, Planta).

tiene_propiedad(Planta, Propiedad) :-
    propiedad(Planta, Propiedad).

efecto_sobre_organismo(Planta, Efecto) :-
    efecto(Planta, Efecto).

% Consultas de ejemplo
% ¿Qué plantas se utilizan para tratar la gastritis?
% ?- trata_enfermedad(Planta, gastritis).
% Planta = nogal.

% ¿Qué propiedades tiene la planta digital?
% ?- tiene_propiedad(digital, Propiedad).
% Propiedad = tonico_cardiaco.

% ¿Cuál es el efecto de la planta opio sobre el organismo humano?
% ?- efecto_sobre_organismo(opio, Efecto).
% Efecto = estupefaciente.
