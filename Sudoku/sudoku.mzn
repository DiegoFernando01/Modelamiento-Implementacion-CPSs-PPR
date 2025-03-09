% Solución problema 2.1 - Sudoku

include "globals.mzn";

% Definición del arreglo de variables y su dominio
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
constraint cuadricula[1,3] = 1;
constraint cuadricula[1,6] = 9;
constraint cuadricula[1,7] = 6;
constraint cuadricula[1,8] = 2;
constraint cuadricula[3,6] = 6;
constraint cuadricula[3,8] = 9;
constraint cuadricula[3,9] = 4;
constraint cuadricula[4,2] = 9;
constraint cuadricula[4,3] = 6;
constraint cuadricula[4,5] = 3;
constraint cuadricula[4,6] = 8;
constraint cuadricula[4,7] = 1;
constraint cuadricula[5,7] = 3;
constraint cuadricula[6,1] = 7;
constraint cuadricula[6,4] = 6;
constraint cuadricula[6,6] = 1;
constraint cuadricula[6,8] = 4;
constraint cuadricula[7,2] = 6;
constraint cuadricula[7,4] = 8;
constraint cuadricula[7,7] = 4;
constraint cuadricula[8,1] = 1;
constraint cuadricula[8,3] = 5;
constraint cuadricula[8,5] = 2;

% Aplicación de las soluciones

solve satisfy;
%solve :: int_search([cuadricula[i, j] | i in 1..9, j in 1..9], first_fail, indomain_min, complete) satisfy;

% Impresión en consola

output [show([cuadricula[i,j]| j in rango]) ++ "\n"| i in rango];