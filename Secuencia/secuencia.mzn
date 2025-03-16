% Solución problema 2.3 - Secuencia mágica

% Definición de variables y dominios
int: n = 20; % longitud de la secuencia
array[0..n-1] of var 0..n-1: x;

% Restricción principal
constraint
  forall(i in 0..n-1) (
    count(x, i) = x[i]);

% Implementación restricción 2.1
constraint sum(x) = n;

% Implementación restricción 2.2
constraint sum(i in 0..n-1)( (i - 1) * x[i] ) = 0;

% Aplicación de las soluciones
solve satisfy;
%solve :: int_search(x, first_fail, indomain_min, complete) satisfy;
%solve :: int_search(x, input_order, indomain_max, complete) satisfy;
%solve :: int_search(x, first_fail, indomain_random, complete) satisfy;

% Formato de salida
output [
  "Secuencia mágica: " ++ show(x) ++ "\n",
  "Frecuencias:\n",
  concat([ "El número " ++ show(i) ++ " aparece " 
           ++ show(sum([ bool2int(x[j] == i) | j in 0..n-1 ]))
           ++ " veces.\n" | i in 0..n-1])];