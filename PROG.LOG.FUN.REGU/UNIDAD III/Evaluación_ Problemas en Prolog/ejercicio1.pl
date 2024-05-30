% Hechos proporcionados
padre(mirian, ricardo).
padre(marcelo, raul).
padre(marcelo, rita).
padre(juan, marcelo).
padre(juan, maría).
padre(raul, sergio).
padre(raul, victor).
madre(mirian, ricardo).
madre(raul, rita).
madre(rita, victor).
madre(rita, veronica).
lindo(mirian).
lindo(rita).

% Reglas para las consultas

% a. Quién es el abuelo de Víctor
abuelo(Abuelo, Nieto) :-
    padre(Abuelo, Padre),
    padre(Padre, Nieto).

% b. Quién es el nieto de Raúl
nieto(Nieto, Abuelo) :-
    padre(Abuelo, Padre),
    padre(Padre, Nieto).

% c. Quién es la hermana de Víctor
hermana(Hermana, Persona) :-
    madre(Madre, Persona),  % Cambiado a madre para evitar ambigüedades
    madre(Madre, Hermana),
    Persona \= Hermana.

% d. Quién es la hermana de Verónica
hermana(Hermana, Persona) :-
    madre(Madre, Persona),
    madre(Madre, Hermana),
    Persona \= Hermana.

% e. De quién es hija Verónica
hija(veronica, Madre) :-
    madre(Madre, veronica).

% f. Quién está casado con alguien linda
casado_con_linda(Hombre, Mujer) :-
    casado(Hombre, Mujer),
    lindo(Mujer).

% g. Qué relación familiar tienen las personas lindas
relacion_familiar_linda(Persona, Relacion) :-
    lindo(Persona),
    (madre(Persona, _), Relacion = madre;  % Cambiado a madre para evitar ambigüedades
     padre(Persona, _), Relacion = padre).

% h. Quiénes son tíos y cuáles son sus sobrinos
tio(Tio, Sobrino) :-
    padre(Padre, Sobrino),
    hermana(Hermana, Padre),
    padre(Tio, Hermana).

% Ejemplos de consultas

% Consultar quién es el abuelo de Víctor
% abuelo(Abuelo, victor).
% La respuesta esperada sería "Abuelo = juan."

% Consultar quién es el nieto de Raúl
% nieto(Nieto, raul).
% La respuesta esperada sería "Nieto = sergio."

% Consultar quién es la hermana de Verónica
% hermana(Hermana, veronica).
% La respuesta esperada sería "Hermana = rita."

% Consultar quién está casado con
