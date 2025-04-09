% Solución problema 2.6 - Construcción de un rectángulo

include "globals.mzn";

% Parámetros de entrada
array[int] of int: cuadrados;
int: n = length(cuadrados);  % número de cuadrados
int: ancho;
int: alto;

% Variables de decisión: coordenadas (esquina inferior izquierda) de cada cuadrado
array[1..n] of var 0..ancho: posX;
array[1..n] of var 0..alto: posY;

% Cada cuadrado se ubica dentro del rectángulo sin salirse de los límites
constraint 
  forall(i in 1..n)(
    posX[i] + cuadrados[i] <= ancho /\
    posY[i] + cuadrados[i] <= alto
  );

% Restricción de no solapamiento
constraint 
  forall(i, j in 1..n where i < j)(
    (posX[i] + cuadrados[i] <= posX[j]) \/
    (posX[j] + cuadrados[j] <= posX[i]) \/
    (posY[i] + cuadrados[i] <= posY[j]) \/
    (posY[j] + cuadrados[j] <= posY[i])
  );

% Verificar que el área total de los cuadrados sea igual al área del rectángulo
constraint 
  sum(i in 1..n)(cuadrados[i] * cuadrados[i]) = ancho * alto;

% Restricción para romper simetrías: fija la posición del primer cuadrado en (0,0)
constraint posX[1] = 0;
constraint posY[1] = 0;

% Estrategias de búsqueda

% Opción 1: first_fail + indomain_mi
% solve :: int_search(posX ++ posY, first_fail, indomain_min, complete) satisfy;

% Opción 2: input_order + indomain_min
% solve :: int_search(posX ++ posY, input_order, indomain_min, complete) satisfy;

% Opción 3: input_order + indomain_random
% solve :: int_search(posX ++ posY, input_order, indomain_random, complete) satisfy;

% Opción 4: most_constrained + indomain_max (opción más óptima)
solve :: int_search(posX ++ posY, most_constrained, indomain_max, complete) satisfy;

% Opción 5: combinación
%solve :: seq_search([
%  int_search(posX, first_fail, indomain_min, complete),
%  int_search(posY, first_fail, indomain_min, complete)
%]) satisfy;

% Formato de salida: se muestra la ubicación y el tamaño de cada cuadrado
output [
  "Ubicación de cuadrados:\n"
] ++
[
  "Cuadrado " ++ show(i) ++ " (tamaño " ++ show(cuadrados[i]) ++ "): (" 
  ++ show(posX[i]) ++ ", " ++ show(posY[i]) ++ ")\n"
  | i in 1..n
];