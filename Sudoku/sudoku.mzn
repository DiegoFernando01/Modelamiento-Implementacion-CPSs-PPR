% Solución problema 2.1 - Sudoku

include "globals.mzn";

% Definición del arreglo de variables
set of int: rango = 1..9;
array[rango, rango] of var rango: cuadricula;

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

% Restricciones para especificar condiciones iniciales
constraint cuadricula[1,1] = 5;
constraint cuadricula[1,2] = 3;
constraint cuadricula[1,5] = 7;
constraint cuadricula[9,1] = 6;
constraint cuadricula[9,7] = 8;

solve satisfy;
