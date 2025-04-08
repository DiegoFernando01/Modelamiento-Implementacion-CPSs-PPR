% Solución problema 2.1 - Sudoku
include "globals.mzn";

% Definición del arreglo de variables y su dominio
set of int: rango = 1..9;
array[rango, rango] of var rango: cuadricula;
array[rango, rango] of 0..9: restricciones;  % 0 significa celda vacía

% Restricciones para especificar condiciones iniciales
constraint
  forall(fila in rango, columna in rango) (
    if restricciones[fila, columna] != 0 then
      cuadricula[fila, columna] = restricciones[fila, columna]
    else
      true
    endif);

% Restricciones para las fila
constraint
  forall(fila in rango) (
    all_different([ cuadricula[fila, columna] | columna in rango ]));

% Restricciones para las columna
constraint
  forall(columna in rango) (
    all_different([ cuadricula[fila, columna] | fila in rango ]));

% Restricciones para las cajas
constraint
  forall(filita in 0..2, columnita in 0..2) (
    all_different([ cuadricula[3*filita + fila, 3*columnita + columna] | fila in 1..3, columna in 1..3 ]));

% Restricciones redundantes
constraint
  forall(fila in rango)(
    sum([ cuadricula[fila, columna] | columna in rango ]) = 45); % la suma de cada fila debe ser 45
constraint
  forall(columna in rango)(
    sum([ cuadricula[fila, columna] | fila in rango ]) = 45); % la suma de cada columna debe ser 45

% Restricción de rompimiento de simetrías
constraint
  if restricciones[1,1] = 0 then cuadricula[1,1] = 1 else true endif;

% Estrategias de búsqueda
solve :: int_search([cuadricula[i, j] | i in rango, j in rango], first_fail, indomain_min, complete) satisfy;

% Impresión en consola
output [show([cuadricula[i,j]| j in rango]) ++ "\n"| i in rango];
