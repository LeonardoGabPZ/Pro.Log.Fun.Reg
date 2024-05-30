% Hechos: Personajes
personaje(hamlet).
personaje(claudio).
personaje(gertrudis).
personaje(polonio).
personaje(Ofelia).

% Relaciones entre personajes
hermano(hamlet, Ofelia).
tio(claudio, hamlet).
esposo(claudio, gertrudis).
padre(polonio, Ofelia).

% Eventos principales
evento(asesinato).
evento(duelo).
evento(insania).

% Relaciones entre eventos y personajes
implicado(asesinato, claudio).
implicado(asesinato, gertrudis).
implicado(duelo, hamlet).
implicado(duelo, laertes).
causa(duelo, insania).

% Lugares
lugar(castillo).
lugar(cementerio).
lugar(bosque).

% Relaciones entre personajes y lugares
ubicacion(hamlet, castillo).
ubicacion(gertrudis, castillo).
ubicacion(claudio, castillo).
ubicacion(Ofelia, cementerio).
ubicacion(polonio, bosque).

% Reglas
es_familia(X, Y) :- hermano(X, Y); tio(X, Y); esposo(X, Y); padre(X, Y).
