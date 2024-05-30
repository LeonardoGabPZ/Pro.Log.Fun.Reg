% Definición de los platos
entrada(antipasto).
entrada(sopa).
entrada(quesos).
carne(milanesa).
carne(bife_de_chorizo).
carne(pollo_asado).
pescado(congrio).
pescado(pejerey).
postre(flan).
postre(helado).
postre(fruta).

% Definición de la relación plato_principal
plato_principal(P) :- carne(P).
plato_principal(P) :- pescado(P).

% Definición de la relación comida
comida(E, P, D) :- entrada(E), plato_principal(P), postre(D).

% Definición de las calorías de cada plato
calorias(antipasto, 200).
calorias(sopa, 150).
calorias(quesos, 300).
calorias(milanesa, 400).
calorias(bife_de_chorizo, 600).
calorias(pollo_asado, 350).
calorias(congrio, 250).
calorias(pejerey, 200).
calorias(flan, 250).
calorias(helado, 300).
calorias(fruta, 100).

% Definición del valor calórico total de una comida
valor(E, P, D, V) :- calorias(E, X), calorias(P, Y), calorias(D, Z), V is X + Y + Z.

% Definición de una comida equilibrada
comida_equilibrada(E, P, D) :- valor(E, P, D, V), V =< 800.

%consulta de comida no equlibrada 
%comida(E, P, D), \+ comida_equilibrada(E, P, D).
%ejemplos de consultas 
%comida_equilibrada(E, P, D). para encontrar todas las comidas equlibradas posibles 
%valor(antipasto, milanesa, flan, V). calcular el valor de esta comida u otras 
%comida(E, P, D).encontrar todas las combinaciones de comidas 
%plato_principal(X). todos los platos principales disponibles 
%entrada(X). todas las entradas posibles 

