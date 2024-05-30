% Hechos sobre quién está enfermo y sus síntomas
enfermo_de(manuel, gripe).
tiene_sintoma(alicia, cansancio).

% Hechos sobre síntomas y enfermedades
sintoma_de(fiebre, gripe).
sintoma_de(tos, gripe).
sintoma_de(cansancio, anemia).

% Hechos sobre qué elimina cada medicamento
elimina(vitaminas, cansancio).
elimina(aspirinas, fiebre).
elimina(jarabe, tos).

% Regla para recetar medicamentos a una persona enferma
recetar_a(Medicamento, Persona) :-
    enfermo_de(Persona, Enfermedad),
    alivia(Medicamento, Enfermedad).

% Regla para determinar qué medicamento alivia una enfermedad
alivia(Medicamento, Enfermedad) :-
    elimina(Medicamento, Sintoma),
    sintoma_de(Sintoma, Enfermedad).

% Regla para determinar si una persona está enferma de una enfermedad basada en sus síntomas
enfermo_de(Persona, Enfermedad) :-
    tiene_sintoma(Persona, Sintoma),
    sintoma_de(Sintoma, Enfermedad).

% Consultas de ejemplo:

% Consulta 1: ¿Qué se le puede recetar a Manuel?
% ?- recetar_a(Medicamento, manuel).
% Esta consulta debería devolver:
% Medicamento = aspirinas ; Medicamento = jarabe.

% Consulta 2: ¿Qué se le puede recetar a Alicia?
% ?- recetar_a(Medicamento, alicia).
% Esta consulta debería devolver:
% Medicamento = vitaminas.

% Consulta 3: ¿Quién está enfermo de gripe?
% ?- enfermo_de(Persona, gripe).
% Esta consulta debería devolver:
% Persona = manuel.

% Consulta 4: ¿Quién está enfermo de anemia?
% ?- enfermo_de(Persona, anemia).
% Esta consulta debería devolver:
% Persona = alicia.

% Consulta 5: ¿Qué medicamento alivia la gripe?
% ?- alivia(Medicamento, gripe).
% Esta consulta debería devolver:
% Medicamento = aspirinas ; Medicamento = jarabe.
