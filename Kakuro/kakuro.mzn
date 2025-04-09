% Solución problema 2.2 - Kakuro
include "globals.mzn";

% Definición de conjuntos para las pistas y resultados
set of int: res = index_set_1of2(kak);
set of int: pts = index_set_2of2(kak);
int: maxP = (max(pts) - 1) div 2;

% Parámetros del problema
int: fil; % número de filas (sin contar la primera fila de pistas)
int: col; % número de columnas (sin contar la primera columna de resultados)
array[int, int] of int: kak; % matriz de Kakuro que contiene pistas y posiciones
array[int] of 1..fil: bl; % posiciones (par de índices) donde debe haber celda en blanco

% Variable de decisión: celdas que se llenarán con valores entre 0 y 9
array[1..fil, 1..col] of var 0..9: cel;

% Restricción: las celdas indicadas por los blancos deben ser 0
constraint
  forall(i in 1..(length(bl) div 2)) (
    cel[ bl[2*(i-1)+1], bl[2*(i-1)+2] ] = 0
  );

% Restricciones asociadas a cada resultado o pista
constraint
  forall(p in res) (
    % La suma de los valores en las celdas asociadas debe coincidir con la pista objetivo,
    % considerando solo las posiciones indicadas en kak que sean mayores que 0.
    sum(i in 1..maxP where kak[p, 2*(i-1)+1] > 0)(
      cel[ kak[p, 2*(i-1)+1], kak[p, 2*(i-1)+2] ]
    ) = kak[p, max(pts)]
    /\
    % Los números en dichas celdas deben ser distintos
    all_different(i in 1..maxP where kak[p, 2*(i-1)+1] > 0)(
      cel[ kak[p, 2*(i-1)+1], kak[p, 2*(i-1)+2] ]
    )
    /\
    % Cada uno debe ser mayor que 0 (valores válidos: 1..9)
    forall(i in 1..maxP where kak[p, 2*(i-1)+1] > 0)(
      cel[ kak[p, 2*(i-1)+1], kak[p, 2*(i-1)+2] ] > 0
    )
  );

% Estrategias de búsqueda

% Opción 1: first_fail con indomain_min (estrategia por defecto)
% solve :: int_search(cel, first_fail, indomain_min, complete) satisfy;

% Opción 2: first_fail con indomain_random
% solve :: int_search(cel, first_fail, indomain_random, complete) satisfy;

% Opción 3: first_fail con indomain_split
% solve :: int_search(cel, first_fail, indomain_split, complete) satisfy;

% Opción 4: input_order con indomain_min (estrategia más óptima probada)
solve :: int_search(cel, input_order, indomain_min, complete) satisfy;

% Salida
output [
  if j = 1 then "\n" else " " endif ++ show(cel[i,j])
  | i, j in 1..(max(fil,col)) where (i <= fil /\ j <= col)
];