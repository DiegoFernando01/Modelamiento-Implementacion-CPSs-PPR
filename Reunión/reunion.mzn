% Solución problema 2.5 - Ubicación de personas en una reunión

include "globals.mzn";

% Definición del arreglo de variables y sus dominios

int: num_personas; % Número total de personas.
array[1..num_personas] of string: personas; % Nombres de las personas.

int: num_adyacentes; % Número de restricciones 'next'.
array[1..num_adyacentes, 1..2] of int: adyacentes; % Contiene [A, B] indicando que la persona A debe estar junto a la persona B.

int: num_separadas; % Número de restricciones 'separate'.
array[1..num_separadas, 1..2] of int: separadas; % Contiene [A, B] indicando que la persona A debe estar separada de la persona B.

int: num_distancias; % Número de restricciones 'distance'.
array[1..num_distancias, 1..3] of int: distancias; % Contiene [A, B, M] indicando que las personas A y B deben estar separadas como máximo por M personas.

array[1..num_personas] of var 1..num_personas: posicion; % Representa la posición (en la fila) que ocupa la persona i.

% Restricciones del modelo

% 1. Las posiciones deben ser una permutación (no puede haber dos personas en la misma posición).
constraint alldifferent(posicion);

% 2. Restricción redundante: la suma de las posiciones debe ser igual a la suma de 1 hasta num_personas.
constraint sum(i in 1..num_personas)(posicion[i]) = num_personas * (num_personas + 1) div 2;

% 3. Restricciones para "next": las personas deben estar juntas.
constraint
  forall(i in 1..num_adyacentes) (
    abs(posicion[adyacentes[i,1]] - posicion[adyacentes[i,2]]) = 1);

% 4. Restricciones para "separate": las personas no deben estar juntas.
constraint
  forall(i in 1..num_separadas) (
    abs(posicion[separadas[i,1]] - posicion[separadas[i,2]]) != 1);

% 5. Restricciones para "distance": la separación entre dos personas debe ser como máximo M personas.
constraint
  forall(i in 1..num_distancias) (
    abs(posicion[distancias[i,1]] - posicion[distancias[i,2]]) <= distancias[i,3] + 1);

% 6. Restricción para romper simetrías: fijar la posición de la primera persona.
constraint posicion[1] = 1;

% Estrategias de búsqueda

% Opción 1: first_fail + indomain_min
solve :: int_search(posicion, first_fail, indomain_min, complete) satisfy;

% Opción 2: input_order + indomain_random
% solve :: int_search(posicion, input_order, indomain_random, complete) satisfy;

% Opción 3: most_constrained + indomain_max
% solve :: int_search(posicion, most_constrained, indomain_max, complete) satisfy;

% Opción 4: secuencia de búsqueda (para ampliación futura)
% solve :: seq_search([
%   int_search(posicion, first_fail, indomain_min, complete)
% ]) satisfy;

% Impresión en consola
output [
  "Orden de personas en la fila:\n"
] ++
[
  "Posición " ++ show(i) ++ ": " ++ personas[j] ++ "\n"
  | i in 1..num_personas,
    j in 1..num_personas where fix(posicion[j]) == i
];
