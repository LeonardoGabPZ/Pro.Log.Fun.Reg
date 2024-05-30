% Hechos que definen el número de días en cada mes
dias_en_mes(1, 31). % Enero
dias_en_mes(2, 28). % Febrero (no bisiesto)
dias_en_mes(3, 31). % Marzo
dias_en_mes(4, 30). % Abril
dias_en_mes(5, 31). % Mayo
dias_en_mes(6, 30). % Junio
dias_en_mes(7, 31). % Julio
dias_en_mes(8, 31). % Agosto
dias_en_mes(9, 30). % Septiembre
dias_en_mes(10, 31). % Octubre
dias_en_mes(11, 30). % Noviembre
dias_en_mes(12, 31). % Diciembre

% Hechos que definen el rango de fechas para cada signo zodiacal
horoscopo(aries, 21, 3, 20, 4).
horoscopo(tauro, 21, 4, 20, 5).
horoscopo(geminis, 21, 5, 20, 6).
horoscopo(cancer, 21, 6, 22, 7).
horoscopo(leo, 23, 7, 22, 8).
horoscopo(virgo, 23, 8, 22, 9).
horoscopo(libra, 23, 9, 22, 10).
horoscopo(escorpio, 23, 10, 21, 11).
horoscopo(sagitario, 22, 11, 21, 12).
horoscopo(capricornio, 22, 12, 19, 1).
horoscopo(acuario, 20, 1, 18, 2).
horoscopo(piscis, 19, 2, 20, 3).

% Regla para determinar el signo zodiacal
signo(Dia, Mes, Signo) :-
    dias_en_mes(Mes, DiasEnMes),
    Dia >= 1, Dia =< DiasEnMes, % Verifica que el día esté dentro del rango permitido para el mes
    horoscopo(Signo, DiaIni, MesIni, DiaFin, MesFin),
    (
        (Mes = MesIni, Dia >= DiaIni);
        (Mes = MesFin, Dia =< DiaFin);
        (Mes > MesIni, Mes < MesFin)
    ).

% Consultas de ejemplo:
% ?- signo(8, 5, Signo).
% ?- signo(7, 8, Signo).
% ?- signo(7, X, Signo).
% ?- signo(X, 7, Signo).
