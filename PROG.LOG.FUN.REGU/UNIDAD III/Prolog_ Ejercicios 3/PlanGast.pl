% Predicados para el transporte
transporte(roma, 20000).
transporte(londres, 25000).
transporte(tunez, 15000).

% Predicados para el alojamiento
alojamiento(hotel, roma, 25000).
alojamiento(hotel, londres, 15000).
alojamiento(hotel, tunez, 10000).

alojamiento(hostal, roma, 15000).
alojamiento(hostal, londres, 10000).
alojamiento(hostal, tunez, 8000).

alojamiento(camping, roma, 10000).
alojamiento(camping, londres, 5000).
alojamiento(camping, tunez, 5000).

% Regla para calcular el costo total del viaje
costo_total(Lugar, Alojamiento, Dias, CostoTotal) :-
    transporte(Lugar, CostoTransporte),
    alojamiento(Alojamiento, Lugar, CostoAlojamiento),
    CostoTotal is CostoTransporte + (CostoAlojamiento * Dias).
%costo_total(roma, camping, 7, Costo).
