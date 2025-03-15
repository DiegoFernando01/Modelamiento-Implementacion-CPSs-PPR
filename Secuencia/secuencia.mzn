% Solución problema 2.3 - Secuencia mágica

% Definición de variables y dominios
int: n = 4; % longitud de la secuencia
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

% Formato de salida
output ["Secuencia mágica: ", show(x)];