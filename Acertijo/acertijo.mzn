% Solución problema 2.4 - Acertijo lógico

include "globals.mzn";

% Definición de variables y dominios para cada amigo
enum listaNombres = {Juan, Oscar, Dario};
enum listaApellidos = {Gonzalez, Garcia, Lopez};
enum listaGenerosM = {Clasica, Pop, Jazz};
array[listaNombres] of var listaApellidos: apellidos;
array[listaNombres] of var 24..26: edades;
array[listaNombres] of var listaGenerosM: generosM;

% Restricciones de unicidad para los atributos
constraint all_different([apellidos[nombre] | nombre in listaNombres]);
constraint all_different([edades[nombre] | nombre in listaNombres]);
constraint all_different([generosM[nombre] | nombre in listaNombres]);

% Implementación pista 1: Juan es más viejo que González, a quien le gusta la música clásica
constraint
  forall(nombre in listaNombres where apellidos[nombre] == Gonzalez) (
    generosM[nombre] == Clasica /\ edades[Juan] > edades[nombre]);

% Implementación pista 2: El fan de la música Pop, que no es García, no tiene 24
constraint
  forall(nombre in listaNombres where generosM[nombre] == Pop) (
    apellidos[nombre] != Garcia /\ edades[nombre] != 24);

% Implementación pista 3: Oscar, quien no es López, tiene 25
constraint apellidos[Oscar] != Lopez;
constraint edades[Oscar] == 25;

% Implementación pista 4: La música favorita de Darío no es el Jazz
constraint generosM[Dario] != Jazz;

% Estrategias de búsqueda

% Opción 0: (Por defecto)
solve satisfy;

% Opción 1: Enfocarse en edades
% solve :: int_search(edades, first_fail, indomain_min, complete) satisfy;

% Opción 2: Asignación aleatoria de apellidos
% solve :: int_search([apellidos[n] | n in listaNombres], input_order, indomain_random, complete) satisfy;

% Opción 3: Asignación de géneros musicales
% solve :: int_search([generosM[n] | n in listaNombres], first_fail, indomain_max, complete) satisfy;

% Opción 4: Combinada
% solve :: seq_search([
%   int_search(edades, first_fail, indomain_min, complete),
%   int_search([apellidos[n] | n in listaNombres], input_order, indomain_min, complete),
%   int_search([generosM[n] | n in listaNombres], input_order, indomain_min, complete)
% ]) satisfy;

% Formato de salida.
output [
  "Nombre: Juan, Apellido: ", show(apellidos[Juan]), ", Edad: ", show(edades[Juan]), ", Música: ", show(generosM[Juan]), "\n",
  "Nombre: Oscar, Apellido: ", show(apellidos[Oscar]), ", Edad: ", show(edades[Oscar]), ", Música: ", show(generosM[Oscar]), "\n",
  "Nombre: Darío, Apellido: ", show(apellidos[Dario]), ", Edad: ", show(edades[Dario]), ", Música: ", show(generosM[Dario]), "\n"
];