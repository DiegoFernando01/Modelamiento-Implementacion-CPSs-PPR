TALLER 1 - MODELAMIENTO E IMPLEMENTACIÓN DE CSPs
==============================================

UNIVERSIDAD DEL VALLE
Escuela de Ingeniería de Sistemas y Computación
Programación con Restricciones
Semestre: 2025-I
Profesor: Robinson Andrey Duque Agudelo

AUTORES:
- Diego Fernando Victoria (202125877) - diego.victoria@correounivalle.edu.co
- Janiert Sebastián Salas (201941265) - janiert.salas@correounivalle.edu.co
- Jhon Alexander Valencia (202042426) - jhon.hilamo@correounivalle.edu.co

DESCRIPCIÓN DEL PROYECTO:
------------------------
Este proyecto contiene la solución al taller #1 sobre modelamiento e implementación de 
problemas de satisfacción de restricciones (CSPs) utilizando MiniZinc. Se implementaron 
varios modelos para diferentes tipos de problemas clásicos y originales.

ARCHIVOS INCLUIDOS:
-----------------
1. Acertijo/
   - acertijo.mzn: Implementación de un acertijo lógico.

2. Kakuro/
   - kakuro.mzn: Implementación del juego kakuro.
   - Pruebas/: Contiene archivos de datos (Prueba1.dzn, Prueba2.dzn) para probar el modelo.

3. Rectángulo/
   - rectangulo.mzn: Implementación del problema de empaquetamiento de rectángulos.
   - Pruebas/: Contiene archivos de datos (Prueba1.dzn, Prueba2.dzn, Prueba3.dzn) para probar el modelo.

4. Reunión/
   - reunion.mzn: Implementación del problema de programación de reuniones.
   - pruebas/: Contiene archivos de datos (Prueba1.dzn, Prueba2.dzn, Prueba3.dzn) para probar el modelo.

5. Secuencia/
   - secuencia.mzn: Implementación del problema de secuenciación.

6. Sudoku/
   - sudoku.mzn: Implementación del juego sudoku.
   - Pruebas/: Contiene archivos de datos (prueba1.dzn, prueba2.dzn, prueba3.dzn) para probar el modelo.

INSTRUCCIONES DE USO:
-------------------
Para ejecutar los modelos, es necesario tener instalado MiniZinc. Los modelos pueden 
ejecutarse usando la interfaz gráfica de MiniZinc IDE o mediante línea de comandos.

- Para modelos sin archivos de datos:
  minizinc Acertijo/acertijo.mzn

- Para modelos con archivos de datos:
  minizinc Kakuro/kakuro.mzn Kakuro/Pruebas/Prueba1.dzn

ENLACES IMPORTANTES:
------------------
- Repositorio GitHub: https://github.com/DiegoFernando01/Modelamiento-Implementacion-CPSs-PPR
- Informe completo: https://docs.google.com/document/d/1m8O5nrGJ9o798lfLnqP-0JoZgPKfS0XeqfqHkS5DJfg/edit?usp=sharing

Para información más detallada sobre el proyecto, descripciones de cada modelo, 
y enlaces a la documentación completa, consultar el archivo README.md.