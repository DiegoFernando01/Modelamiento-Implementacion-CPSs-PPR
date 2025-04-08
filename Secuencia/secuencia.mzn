% Solución problema 2.3 - Secuencia mágica

% Definición de variables y dominios
int: n; % longitud de la secuencia
array[0..n-1] of var 0..n-1: x;

% Restricción principal: cada elemento indica cuántas veces aparece en la secuencia.
constraint
  forall(i in 0..n-1) (
    count(x, i) = x[i]);

% Restricción 2.1: la suma de los elementos debe ser n.
constraint sum(x) = n;

% Restricción 2.2: balancea la secuencia.
constraint sum(i in 0..n-1)( (i - 1) * x[i] ) = 0;

% Estrategias de búsqueda:

% Opción 1: first_fail + indomain_min
solve :: int_search(x, first_fail, indomain_min, complete) satisfy;

% Opción 2: input_order + indomain_max
% solve :: int_search(x, input_order, indomain_max, complete) satisfy;

% Opción 3: first_fail + indomain_random
% solve :: int_search(x, first_fail, indomain_random, complete) satisfy;

% Formato de salida mejorado:
output 
  [ "Secuencia mágica: " ++ show(x) ++ "\n",
    "Frecuencias:\n"
  ]
  ++
  [ concat(
      [ "El número " ++ show(i) ++ " aparece " 
        ++ show(fix(sum([ bool2int(x[j] == i) | j in 0..n-1 ])))
        ++ " veces, suma = " 
        ++ show(i * fix(sum([ bool2int(x[j] == i) | j in 0..n-1 ])))
        ++ ".\n"
        | i in 0..n-1 where fix(sum([ bool2int(x[j] == i) | j in 0..n-1 ])) > 0
      ]
    )
  ];
