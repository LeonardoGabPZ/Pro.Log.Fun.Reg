:- use_module(library(pce)).

mostrar(V, D, M):- 
    new(I, image(V)),
    new(B, bitmap(I)),
    new(F2, figure),
    send(F2, display, B),
    new(D1, device),
    send(D1, display, F2),
    send(D, display, D1),
    send(D1, below(M)).

:- pce_global(@name_prompter, make_name_prompter).

make_name_prompter(P) :-
    new(P, dialog),
    send(P, kind, transient),
    send(P, append, label(prompt)),
    send(P, append, new(TI, text_item(name, '', message(P?ok_member, execute)))),
    send(P, append, button(ok, message(P, return, TI?selection))),
    send(P, append, button(cancel, message(P, return, @nil))).

ask_name(Prompt, Label, Name) :-
    send(@name_prompter?prompt_member, selection, Prompt),
    send(@name_prompter?name_member, label, Label),
    send(@name_prompter?name_member, clear),
    get(@name_prompter, confirm_centered, RawName),
    send(@name_prompter, show, @off),
    RawName \== @nil,
    Name = RawName.

ask_name :-
    ask_name('Buscar planta medicinal:', 'Nombre de la planta', Planta),
    pp(Planta).

ask_name_mal :-
    ask_name('Buscar planta por malestar:', 'Malestar a aliviar', Malestar),
    pp_mal(Malestar).

ask_category :-
    ask_name('Buscar categoría de planta:', 'Nombre de la categoría', Categoria),
    pp_categoria(Categoria).

mostrar_indice_plan :-
    new(Dialog, dialog('Mensaje')),
    send(Dialog, append, new(Text, text('
    LISTADO DE PLANTAS 
* Digitalis
* Papaver somniferum
* Ipecacuana
* Nuez Vomica
* Eleboro Blanco
* Colchico
* Belladona
* Quina
* Cacao
* Retama
* Coca
* Peyote
* Efedra
* Barbasco
* Nenufar Amarillo
* Name
* Artemisa
* Semilla de Yute
* Toloache
* Eucalipto
* Rosal

    '))),
    send(Dialog, open).

mostrar_indice_mal :-
    new(Dialog, dialog('Mensaje')),
    send(Dialog, append, new(Text, text('
    LISTADO DE MALESTARES 
* Alergia            * Amigdalitis        * Abcesos           * Abceso
* Ácido              * Acné               * Aftas             * Agotamiento
* Albuminaria        * Alcoholismo        * Almorranas        * Anemia
* Anginas            * Anorexia           * Arteriosclerosis  * Artritis
* Asma               * Atonia             * Bazo              * Boca
* Estomatitis        * Bronquitis         * Bronconeumonia    * Cabello
* Calambres          * Cálculos           * Callos            * Caries
* Caspa              * Cáncer             * Ciática           * Circulación
* Cistitis           * Cólicos            * Colitis           * Contusiones
* Corazón            * Depurativos        * Diabetes          * Diarrea
* Difteria           * Disentería         * Dispepsia         * Dolores
* Empacho            * Enteritis          * Epilepsia         * Epistaxis
* Erisipela          * Escarlatina        * Escorbuto         * Estreñimiento
* Flatulencias       * Faringitis         * Flemas            * Flebitis
* Forúnculos         * Gastralgia         * Gonorrea          * Gota
* Hemorragia         * Hepatitis          * Hernia            * Herpes
* Hidropesía         * Hígado             * Hipertensión      * Hipotensión
* Hipo               * Histerismo         * Insomnio          * Intestino
* Impotencia         * Jaqueca            * Lactancia         * Laringitis
* Leucorrea          * Lombrices          * Lumbago           * Llagas
* Malaria            * Menopausia         * Menstruación      * Metrorragia
* Muelas             * Nariz              * Náuseas           * Neuralgias
* Neurastenia        * Nefritis           * Obesidad          * Oídos
* Ojos               * Paludismo          * Pecas             * Pies
* Piquetes           * Pleuresía          * Piorrea           * Próstata
* Pulmonía           * Quemaduras         * Raquitismo        * Reumatismo
* Riñones            * Ronquera           * Sabañones         * San
* Sarampión          * Sarna              * Sarpullido        * Sed
* Solitaria          * Sudoración         * Tifoidea          * Tiña
* Tos                * Tuberculosis       * Úlcera            * Urticaria
* Varices            * Vejiga             * Verrugas          * Vértigos
* Vómitos            * Voz                * Vitaminas
    '))),
    send(Dialog, open).

mostrar_indice_cat :-
    new(Dialog, dialog('Mensaje')),
    send(Dialog, append, new(Text, text('
    LISTADO DE CATEGORIAS (tIPOS DE PLANTAS) 
* Afrodisiaca           * Analgesica
* Anestesica            * Antidiarreica
* Antiespasmodica       * Antiflogistica
* Antipiretica          * Antiseptica
* Aperitiva             * Astringente
* Carminativa           * Colagoga
* Depurativa            * Diaforetica
* Digestiva             * Diuretica
* Emetica               * Emenagoga
* Estupefaciente        * Expectorante
* Hemostatica           * Hepatica
* Laxante               * Pectoral
* Sedante               * Tonica
* Toxica                * Vermifuga
* Vulneraria
    '))),
    send(Dialog, open).


start :-
    new(D, dialog('Busqueda de plantas medicinales')),
    send(D, size, size(500,400)),
    send(D, colour, colour(red)),
    send(D, append, new(Menu, menu_bar)),
    send(Menu, append, new(Iniciar, popup(iniciar))),
    send_list(Iniciar, append,
              [menu_item(iniciar, message(@prolog, ask_name)),
               menu_item('Buscar por Malestar', message(@prolog, ask_name_mal)),
               menu_item('Buscar por Categoria', message(@prolog, ask_category)),
               menu_item('Indice de Plantas', message(@prolog, mostrar_indice_plan)),
            menu_item('Indice por Malestar', message(@prolog, mostrar_indice_mal)),
            menu_item('Indice por Categoria', message(@prolog, mostrar_indice_cat))]),


    mostrar('C:/ProyectoYerberito/portada.jpg', D, Menu),
    send(D, open, point(0,0)),
    consult('yerberitoExperto2.pl'),
    nl.

% Base de datos de plantas
planta('Digitalis', 'Digitalis purpurea', 'Tonico cardiaco').
planta('Papaver somniferum', 'Opio', 'Morfina y codeina').
planta('Ipecacuana', 'Cephaelis ipecacuanha', 'Emetina para disenteria, hemoptisis y hepatitis amibiana').
planta('Nuez Vomica', 'Strychnos nux-vomica', 'Estricnina').
planta('Eleboro Blanco', 'Veratrum album', 'Veratrina (hipotensor)').
planta('Colchico', 'Colchicum autumnale', 'Colquicina para la gota').
planta('Belladona', 'Atropa belladonna', 'Atropina de uso en oftalmologia').
planta('Quina', 'Cinchona officinalis', 'Quinina').
planta('Cacao', 'Theobroma cacao', 'Teobromina de accion diuretica').
planta('Retama', 'Cytisus scoparius', 'Esmparteina (tonico cardiaco)').
planta('Coca', 'Erythroxylum coca', 'Cocaina').
planta('Peyote', 'Lophophora williamsii', 'Mescalina y otros 30 alcaloides').
planta('Efedra', 'Ephedra sinica', 'Efedrina').
planta('Barbasco', 'Dioscorea mexicana', 'Hormonas').
planta('Nenufar Amarillo', 'Nuphar lutea', 'Luteina (WeNO antibiotico)').
planta('Name', 'Dioscorea villosa', 'Diosgenina').
planta('Artemisa', 'Artemisia absinthium', 'Tujoona').
planta('Semilla de Yute', 'Corchorus olitorius', 'Olitorisida (glucosido)').
planta('Toloache', 'Datura stramonium', 'Acido lisergico (LSD)').
planta('Eucalipto', 'Eucalyptus globulus', 'Eucaliptol').
planta('Rosal', 'Rosa spp.', 'Vitamina C, quercitrina').

% Base de datos de malestares y plantas que los curan
malestar('Alergia', ['Saúco', 'Ortiga', 'Llantén', 'Manzanilla']).
malestar('Amigdalitis', ['Limón', 'Tamarindo', 'Pitahaya']).

malestar('Abcesos', ['Malva']).
malestar('Abceso Hepático', ['Zarzaparrilla']).
malestar('Acidez Estomacal', ['Anis', 'Perejil']).
malestar('Ácido Úrico', ['Sanguinaxia', 'Limón', 'Savco']).
malestar('Acné', ['Órnica']).
malestar('Aftas', ['Llantén', 'Fenogreco', 'Zarzamora']).
malestar('Agotamiento', ['Salvia', 'Tilo', 'Valeriana']).
malestar('Agruras', ['Yerbabuena', 'Manzanilla', 'Jugo de limón', 'Toronja']).
malestar('Albuminaria', ['Pingüica', 'Quina roja', 'Encino rojo']).
malestar('Alcoholismo', ['Pimiento']).
malestar('Almorranas', ['Salvia', 'Hamamelis', 'Sanguinaxia', 'Cola de caballo', 'Árnica', 'Savco']).
malestar('Anemia', ['Ajenjo', 'Germen de trigo', 'Quina', 'Canela', 'Alholva']).
malestar('Anginas', ['Eucalipto', 'Cebada', 'Salvia', 'Tabachin', 'Borraja']).
malestar('Anorexia', ['Ajenjo', 'Genciana', 'Yerbabuena']).
malestar('Arteriosclerosis', ['Limón']).
malestar('Artritis', ['Zarzaparrilla', 'Árnica', 'Chicalote', 'Alcanfor', 'Toronja']).
malestar('Asma', ['Eucalipto', 'Marrubio', 'Toloache', 'Orégano', 'Salvia']).
malestar('Atonia Estomacal', ['Lúpulo', 'Eucalipto', 'Cuasia']).
malestar('Bazo', ['Uva', 'Cerezo']).
malestar('Boca Inflamación', ['Malva', 'Rosal', 'Limón', 'Salvia']).
malestar('Estomatitis', ['Rosa', 'Encina', 'Salvia', 'Zarzamora']).
malestar('Bronquitis', ['Eucalipto', 'Borraja', 'Anacahuite', 'Gordolobo', 'Tilo', 'Benjui', 'Maxrubio', 'Rábano']).
malestar('Bronconeumonia', ['Gordolobo', 'Eucalipto', 'Ipecacuana', 'Mostaza']).
malestar('Cabello (caída del)', ['Ortiga', 'Espinosilla', 'Maxrubio', 'Romero']).
malestar('Calambres', ['Anis', 'Tila', 'Manzanilla', 'Ajenjo']).
malestar('Cálculos Biliares', ['Diente de leon', 'Aceite de oliva', 'Retama']).
malestar('Calculos Renales', ['Cabellos de elote', 'Pingüica', 'Cola de caballo']).
malestar('Callos', ['Ajo', 'Cebolla']).
malestar('Caries', ['Hiedra', 'Cola de caballo']).
malestar('Caspa', ['Ortiga', 'Limón', 'Romero']).
malestar('Cáncer del Útero', ['Cuachalalate', 'Llantén', 'Siempreviva']).
malestar('Ciática', ['Mastuerzo', 'Higuera', 'Sauco']).
malestar('Circulación', ['Toronjil', 'Sanguinaxia', 'Salvia', 'Hamamelis']).
malestar('Cistitis', ['Cola de caballo', 'Doradilla', 'Ajo', 'Cabellos de elote']).
malestar('Cólicos', ['Menta', 'Hinojo', 'Manzanilla', 'Toronjil', 'Boldo']).
malestar('Colitis', ['Linaza', 'Anis', 'Romero', 'Cola de caballo']).
malestar('Contusiones', ['Árnica', 'Hamamelis', 'Laurel', 'Brionia']).
malestar('Corazón (Tónico)', ['Digital', 'Salvia', 'Nuez de Kola', 'Tejocote']).
malestar('Depurativos de la Sangre', ['Achicoria', 'Diente de leon', 'Apio', 'Sanguinaria', 'Zarzaparrilla', 'Berro']).
malestar('Diabetes', ['Matarique', 'Tronadora', 'Eucalipto', 'Damiana']).
malestar('Diarrea Crónica', ['Capulin', 'Mezquite (corteza)', 'Tlalchichinole']).
malestar('Diarrea por Irritación', ['Linaza', 'Membrillo', 'Arroz', 'Cebada']).
malestar('Diarrea por Inflamación', ['Guayaba', 'Albahaca', 'Granada']).
malestar('Diarrea Verdosa', ['Manzanilla', 'Simonillo', 'Sirampromiva (lavado)']).
malestar('Diarrea con Sangre', ['Chaparro amargoso', 'Muicle', 'Monacillo']).
malestar('Difteria', ['Limón', 'Naranja']).
malestar('Disentería', ['Tamarindo', 'Chaparro amargoso', 'Ipecacuana', 'Cedrón']).
malestar('Dispepsia', ['Anis', 'Menta', 'Yerbabuena', 'Diente de león', 'Tilo', 'Genciana', 'Tabaquillo', 'Ruibarbo']).
malestar('Dolores Musculares', ['Alcanfor']).
malestar('Empacho', ['Tamarindo']).
malestar('Enteritis', ['Linaza', 'Cedrón', 'Llantén']).
malestar('Epilepsia', ['Valeriana']).
malestar('Epistaxis (Hemorragia nasal)', ['Hierba del pollo', 'Cebolla', 'Perejil']).
malestar('Erisipela', ['Sauco', 'Hiedra', 'Zanahoria']).
malestar('Escarlatina', ['Borraja', 'Sauco', 'Cebolla']).
malestar('Escorbuto', ['Limón', 'Berro', 'Cebolla', 'Geranio']).
malestar('Estreñimiento', ['Ciruela', 'Linaza', 'Chia', 'Tamarindo', 'Agar-agar']).
malestar('Flatulencias', ['Anis', 'Estrella de Anis', 'Hinojo', 'Toronjil', 'Romero', 'Ruibarbo', 'Ruda', 'Menta']).
malestar('Faringitis', ['Eucalipto', 'Lavanda', 'Anacahuite']).
malestar('Flebitis', ['Árnica', 'Alfalfa', 'Lino', 'Malvavisco', 'Romero', 'Quina']).
malestar('Flemas', ['Genciana', 'Orégano']).
malestar('Forúnculos', ['Fenogreco', 'Malvavisco', 'Hiedra']).
malestar('Gastralgia (Dolor de estómago)', ['Manzanilla', 'Anis estrella', 'Cola de caballo', 'Doradilla', 'Zarzaparrilla', 'Pino', 'Alcanfor', 'Aconito']).
malestar('Gonorrea', ['Cola de caballo']).
malestar('Gota', ['Apio', 'Cerezo', 'Limón', 'Pino', 'Belladona', 'Beleño', 'Colchico', 'Chicalote']).
malestar('Grietas del Ano', ['Encina']).
malestar('Grietas del Pezón', ['Encina', 'Nogal', 'Milenkama']).
malestar('Gripe', ['Eucalipto', 'Limón', 'Quina', 'Zarzaparrilla', 'Calendula']).
malestar('Halitosis (Mal aliento)', ['Hinojo', 'Menta']).
malestar('Hemorragia Interna', ['Mastuerzo', 'Ortiga', 'Rosal']).
malestar('Hepatitis', ['Betama', 'Boldo', 'Alcachofa', 'Prodigiosa', 'Cascara Sagrada']).
malestar('Hernia', ['Helecho', 'Ricino', 'Tabaco']).
malestar('Herpes', ['Linaza', 'Llantén']).
malestar('Heridas', ['Árnica', 'Hamamelis']).
malestar('Hidropesía', ['Alcachofa', 'Cardo', 'Perejil', 'Sauco', 'Berros', 'Retama']).
malestar('Hígado (congestión)', ['Marrubio', 'Boldo', 'Doradilla', 'Ruibarbo']).
malestar('Ictericia', ['Papaloquelite', 'Achicoria', 'Berros', 'Llantén', 'Retama', 'Tecomasuchil']).
malestar('Hipertensión (alta)', ['Ajo', 'Espárrago', 'Alpiste', 'Muérdago']).
malestar('Hipotensión (baja)', ['Miel', 'Nuez de Kola', 'Crategus', 'Acedera']).
malestar('Hipo', ['Anis', 'Hinojo', 'Tila', 'Valeriana']).
malestar('Histerismo', ['Azahar', 'Beleño', 'Gelsemio', 'Tila', 'Valeriana']).
malestar('Insomnio', ['Pasiflora', 'Azahar', 'Menta', 'Manzanilla', 'Lechuga', 'Tila']).
malestar('Intestino (Atonia)', ['Genciana', 'Melisa']).
malestar('Impotencia', ['Yohimbo', 'Damiana', 'Nuez Vódmica', 'Aguacate']).
malestar('Jaqueca', ['Manzanilla', 'Aconito', 'Valeriana', 'Tila', 'Chicalote']).
malestar('Lactancia', ['Hinojo', 'Anis', 'Menta', 'Perejil', 'Zanahoria']).
malestar('Laringitis', ['Aconito', 'Borraja', 'Cebolla', 'Rosa', 'Benjui', 'Encino']).
malestar('Leucorrea', ['Encina', 'Zarzaparrilla', 'Pino', 'Enebro', 'Genciana']).
malestar('Lombrices', ['Ajenjo', 'Ajo', 'Cebolla', 'Brionia', 'Aguacate', 'Papaya']).
malestar('Lumbago', ['Avena', 'Cebada', 'Tomillo', 'Verbena', 'Reparote']).
malestar('Llagas', ['Fenogreco', 'Eucalipto', 'Llantén', 'Sanguinaria']).
malestar('Malaria', ['Quina', 'Girasol', 'Eucalipto', 'Cardo']).
malestar('Menopausia', ['Azahar', 'Hamamelis', 'Tila', 'Quina roja']).
malestar('Menstruación Abundante', ['Azafrán', 'Hamamelis']).
malestar('Menstruación Dolorosa', ['Belladona', 'Anis Estrella']).
malestar('Menstruación Escasa', ['Ruda', 'Ajenjo', 'Manzanilla']).
malestar('Menstruación Irregular', ['Apio', 'Hisopo', 'Quina amarilla', 'Sabina', 'Artemisa']).
malestar('Metrorragia (Hemorragia vaginal)', ['Hamamelis', 'Zoapatle', 'Perejil', 'Cuexrecillo', 'Centena']).
malestar('Muelas (Dolor)', ['Clavo', 'Hiedra']).
malestar('Nariz (Hemorragias)', ['Ortiga', 'Cola de caballo', 'Ruda', 'Eucalipto']).
malestar('Náuseas', ['Anis', 'Ajenjo', 'Menta', 'Salvia']).
malestar('Neuralgias', ['Manzanilla', 'Menta', 'Valeriana', 'Boldo']).
malestar('Neurastenia', ['Pasiflora', 'Té Negro', 'Mate', 'Valeriana']).
malestar('Nefritis (inflamación de los riñones)', ['Linaza', 'Grama', 'Cebada', 'Llantén', 'Doradilla', 'Espárrago', 'Ruda']).
malestar('Obesidad', ['Toronjil', 'Marrubio', 'Limón', 'Malva', 'Espárrago']).
malestar('Oídos', ['Boldo', 'Aceite de oliva', 'Llantén', 'Hiedra']).
malestar('Ojos (conjuntivitis, irritación)', ['Manzanilla', 'Limón', 'Llantén', 'Salvia', 'Ruda', 'Rosal']).
malestar('Paludismo', ['Ajenjo', 'Quina']).
malestar('Pecas', ['Berro', 'Genciana', 'Rábano', 'Papaya']).
malestar('Pies Olorosos', ['Laurel', 'Encina']).
malestar('Piquetes de Abeja', ['Miel', 'Perejil', 'Cebolla', 'Pulque']).
malestar('Piquetes de Araña', ['Fresno', 'Ipecacuana']).
malestar('Piquetes de Mosco', ['Alcanfor', 'Perejil', 'Hamamelis']).
malestar('Piquetes de Vibora', ['Anagálida']).
malestar('Pleuresía', ['Jengibre', 'Linaza', 'Cardo', 'Girasol']).
malestar('Piorrea', ['Ipecacuana']).
malestar('Próstata', ['Cola de caballo']).
malestar('Pulmonía', ['Eucalipto', 'Ocote', 'Gordolobo', 'Borraja', 'Sauco']).
malestar('Quemaduras', ['Linaza (cataplasma)', 'Cebolla', 'Hiedra', 'Gordolobo']).
malestar('Raquitismo', ['Nogal']).
malestar('Reumatismo', ['Ajo', 'Apio', 'Borraja', 'Gobernadora', 'Pino', 'Romero', 'Sanguinaxia', 'Maxrubio', 'Tabaco']).
malestar('Riñones', ['Cabellos de elote', 'Cola de caballo', 'Apio']).
malestar('Ronquera', ['Eucalipto', 'Pino', 'Gordolobo']).
malestar('Sabañones', ['Ajo', 'Cebolla']).
malestar('San Vito (mal de)', ['Estafiate', 'Valeriana']).
malestar('Sarampión', ['Borraja', 'Ortiga', 'Sauco']).
malestar('Sarna', ['Ajo', 'Alcanfor', 'Menta', 'Tomillo', 'Romero']).
malestar('Sarpullido', ['Encina', 'Salvia', 'Tila']).
malestar('Sed', ['Limón', 'Tamarindo', 'Pitahaya']).
malestar('Solitaria', ['Semilla de calabaza', 'Granado', 'Coquito de aceite', 'Raiz de Granado agrio', 'Helecho macho']).
malestar('Sudoración Excesiva', ['Encina']).
malestar('Tifoidea', ['Alcanfor', 'Borraja', 'Quina', 'Canela', 'Romero', 'Salvia']).
malestar('Tiña', ['Berro', 'Tila', 'Tamarindo', 'Salvia']).
malestar('Tos', ['Eucalipto', 'Capulin', 'Cedrón', 'Salvia', 'Malva', 'Marrubio']).
malestar('Tos Ferina', ['Gelsemio', 'Quina', 'Rábano', 'Videta']).
malestar('Tuberculosis', ['Jugo de vástago de plátano morado', 'Mastuerzo', 'Berro', 'Ajo', 'Eucalipto', 'Pirul', 'Pino', 'Roble']).
malestar('Úlcera', ['Cuachalalate', 'Sanguinaria', 'Cola de caballo', 'Girasol']).
malestar('Urticaria', ['Limón', 'Ruibarbo']).
malestar('Varices', ['Hamamelis', 'Castaño de Indias', 'Llantén', 'Toronjil']).
malestar('Vejiga', ['Apio', 'Espárrago', 'Cola de caballo', 'Ortiga', 'Malva']).
malestar('Verrugas', ['Leche de higuera', 'Cebolla', 'Nogal']).
malestar('Vértigos', ['Albahaca', 'Espino']).
malestar('Vómitos', ['Menta', 'Tila', 'Marrubio', 'Valeriana', 'Salvia']).
malestar('Voz', ['Cilantro', 'Ajo', 'Limón', 'Pino']).
malestar('Vitaminas (Deficiencia de)', ['Alfalfa', 'Espinacas', 'Acelga', 'Berro', 'Cebolla', 'Limón', 'Zanahoria', 'Aceite de hígado de bacalao']).

% Base de datos de categorías de plantas
categoria('Afrodisiaca', 'Excita el apetito sexual').
categoria('Analgesica', 'Quita o modera el dolor').
categoria('Anestesica', 'Insensibiliza el cuerpo o parte del mismo').
categoria('Antidiarreica', 'Controla diarreas o deposiciones').
categoria('Antiespasmodica', 'Controla espasmos nerviosos').
categoria('Antiflogistica', 'Actúa contra las inflamaciones').
categoria('Antipiretica', 'Quita o disminuye la fiebre').
categoria('Antiseptica', 'Mata los tejidos').
categoria('Aperitiva', 'Produce apetito o deseo de comer').
categoria('Astringente', 'Hace contraer los tejidos').
categoria('Carminativa', 'Evita la formación de gases o provoca su expulsión').
categoria('Colagoga', 'Ayuda a expulsar la bilis').
categoria('Depurativa', 'Limpia y purifica la sangre').
categoria('Diaforetica', 'Provoca sudoración').
categoria('Digestiva', 'Favorece la digestión').
categoria('Diuretica', 'Provoca la orina').
categoria('Emetica', 'Provoca náuseas y vómitos').
categoria('Emenagoga', 'Activa la menstruación').
categoria('Estupefaciente', 'Aquieta, duerme o atonta').
categoria('Expectorante', 'Expulsa flemas y mucosidades').
categoria('Hemostatica', 'Corta o detiene hemorragias').
categoria('Hepatica', 'Ayuda al hígado').
categoria('Laxante', 'Purga sin provocar diarrea').
categoria('Pectoral', 'Ayuda al pecho').
categoria('Sedante', 'Calma dolores intestinales').
categoria('Tonica', 'Da fuerza al organismo').
categoria('Toxica', 'Es venenosa').
categoria('Vermifuga', 'Expulsa gusanos intestinales').
categoria('Vulneraria', 'Cura llagas y heridas').


pp(Planta) :-
    planta(Planta, Especie, Uso),
    new(D, dialog(Planta)),
    send(D, size, size(660,500)),
    send(D, colour, colour(black)),
    send(D, append, new(Menu, menu_bar)),
    send(D, display, text(Planta, center, normal), point(320,5)),

    send(D, display, text('Especie:', center, normal), point(320,20)),
    send(D, display, text(Especie, center, normal), point(440,20)),

    send(D, display, text('Uso medicinal:', center, normal), point(320,40)),
    send(D, display, text(Uso, center, normal), point(440,40)),

    mostrar_imagen(Planta, D, Menu),

    send(D, open, point(200,200)),
    nl.

pp_mal(Malestar) :-
    malestar(Malestar, Plantas),
    new(D, dialog(Malestar)),
    send(D, size, size(660,500)),
    send(D, colour, colour(black)),
    send(D, append, new(Menu, menu_bar)),
    send(D, display, text(Malestar, center, normal), point(320,5)),

    send(D, display, text('Plantas que alivian el malestar:', center, normal), point(320,20)),
    mostrar_plantas(Plantas, 60, D),

    send(D, open, point(200,200)),
    nl.
    
pp_categoria(Categoria) :-
    categoria(Categoria, Descripcion),
    new(D, dialog(Categoria)),
    send(D, size, size(660,500)),
    send(D, colour, colour(black)),
    send(D, append, new(Menu, menu_bar)),
    send(D, display, text(Categoria, center, normal), point(320,5)),

    send(D, display, text('Descripción:', center, normal), point(320,20)),
    send(D, display, text(Descripcion, center, normal), point(440,20)),

    send(D, open, point(200,200)),
    nl.

mostrar_plantas([], _, _).
mostrar_plantas([Planta|Resto], Y, D) :-
    send(D, display, text(Planta, center, normal), point(320, Y)),
    NewY is Y + 20,
    mostrar_plantas(Resto, NewY, D).

mostrar_imagen(Planta, D, Menu) :-
    planta_imagen(Planta, Ruta),
    mostrar(Ruta, D, Menu).

% Rutas de imágenes de las plantas
planta_imagen('Digitalis', 'C:/ProyectoYerberito/imgPlantas/plantaEjemplo.jpg').
planta_imagen('Papaver somniferum', 'C:/ProyectoYerberito/plantaEjemplo/ejemplo.jpg').
planta_imagen('Ipecacuana', 'C:/ProyectoYerberito/imgPlantas/plantaEjemplo.jpg').
planta_imagen('Nuez Vomica', 'C:/ProyectoYerberito/imgPlantas/plantaEjemplo.jpg').
planta_imagen('Eleboro Blanco', 'C:/ProyectoYerberito/imgPlantas/plantaEjemplo.jpg').
planta_imagen('Colchico', 'C:/ProyectoYerberito/imgPlantas/plantaEjemplo.jpg').
planta_imagen('Belladona', 'C:/ProyectoYerberito/imgPlantas/plantaEjemplo.jpg').
planta_imagen('Quina', 'C:/ProyectoYerberito/imgPlantas/plantaEjemplo.jpg').
planta_imagen('Cacao', 'C:/ProyectoYerberito/imgPlantas/plantaEjemplo.jpg').
planta_imagen('Retama', 'C:/ProyectoYerberito/imgPlantas/plantaEjemplo.jpg').
planta_imagen('Coca', 'C:/ProyectoYerberito/imgPlantas/plantaEjemplo.jpg').
planta_imagen('Peyote', 'C:/ProyectoYerberito/imgPlantas/plantaEjemplo.jpg').
planta_imagen('Efedra', 'C:/ProyectoYerberito/imgPlantas/plantaEjemplo.jpg').
planta_imagen('Barbasco', 'C:/ProyectoYerberito/imgPlantas/plantaEjemplo.jpg').
planta_imagen('Nenufar Amarillo', 'C:/ProyectoYerberito/imgPlantas/plantaEjemplo.jpg').
planta_imagen('Name', 'C:/ProyectoYerberito/imgPlantas/plantaEjemplo.jpg').
planta_imagen('Artemisa', 'C:/ProyectoYerberito/imgPlantas/plantaEjemplo.jpg').
planta_imagen('Semilla de Yute', 'C:/ProyectoYerberito/imgPlantas/plantaEjemplo.jpg').
planta_imagen('Toloache', 'C:/ProyectoYerberito/imgPlantas/plantaEjemplo.jpg').
planta_imagen('Eucalipto', 'C:/ProyectoYerberito/imgPlantas/plantaEjemplo.jpg').
planta_imagen('Rosal', 'C:/ProyectoYerberito/imgPlantas/plantaEjemplo.jpg').
