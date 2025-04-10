<p align='center'>
  <img width='200' heigth='225' src='https://user-images.githubusercontent.com/62605744/171186764-43f7aae0-81a9-4b6e-b4ce-af963564eafb.png'>
</p>

# Solución Taller 1 - Modelamiento e Implementación de CSPs

## 🎓 Universidad del Valle - Escuela de Ingeniería de Sistemas y Computación

- **Asignatura:** Programación con Restricciones
- **Semestre:** 2025-I
- **Profesor:** Robinson Andrey Duque Agudelo

---

## 📚 Descripción

Este repositorio contiene la solución al taller #1 sobre modelamiento e implementación de CSPs (Programación por Restricciones).

---

## 🧑‍💻 Autores

| Nombre                  | Código    | Email                                |
| ----------------------- | --------- | ------------------------------------ |
| Diego Fernando Victoria | 202125877 | diego.victoria@correounivalle.edu.co |
| Janiert Sebastián Salas | 201941265 | janiert.salas@correounivalle.edu.co  |
| Jhon Alexander Valencia | 202042426 | jhon.hilamo@correounivalle.edu.co    |

---

## 📁 Contenido

El informe completo se encuentra disponible en [Google Docs](https://docs.google.com/document/d/your-document-id/edit) con acceso exclusivo a correos de la Universidad del Valle. A continuación, enlaces a las secciones específicas:

1. [Introducción](https://docs.google.com/document/d/your-document-id/edit#heading=h.introduccion)
2. [Modelos Implementados](https://docs.google.com/document/d/1m8O5nrGJ9o798lfLnqP-0JoZgPKfS0XeqfqHkS5DJfg/edit?tab=t.0#heading=h.mxg7nek8hb4q)
   - [Acertijo](https://docs.google.com/document/d/1m8O5nrGJ9o798lfLnqP-0JoZgPKfS0XeqfqHkS5DJfg/edit?tab=t.0#heading=h.j2k89rhf6jjw)
   - [Kakuro](https://docs.google.com/document/d/1m8O5nrGJ9o798lfLnqP-0JoZgPKfS0XeqfqHkS5DJfg/edit?tab=t.0#heading=h.eiy8j6qnbbu2)
   - [Rectángulo](https://docs.google.com/document/d/1m8O5nrGJ9o798lfLnqP-0JoZgPKfS0XeqfqHkS5DJfg/edit?tab=t.0#heading=h.7a11bglh5pi4)
   - [Reunión](https://docs.google.com/document/d/1m8O5nrGJ9o798lfLnqP-0JoZgPKfS0XeqfqHkS5DJfg/edit?tab=t.0#heading=h.vf17hs3znsry)
   - [Secuencia](https://docs.google.com/document/d/1m8O5nrGJ9o798lfLnqP-0JoZgPKfS0XeqfqHkS5DJfg/edit?tab=t.0#heading=h.30b7obe44v31)
   - [Sudoku](https://docs.google.com/document/d/1m8O5nrGJ9o798lfLnqP-0JoZgPKfS0XeqfqHkS5DJfg/edit?tab=t.0#heading=h.cpggf1vf8fuo)

---

## 🛠️ Instalación y Uso

1. Clonar el repositorio:
   ```bash
   git clone https://github.com/DiegoFernando01/Modelamiento-Implementacion-CPSs-PR.git
   ```
2. Navegar al directorio del proyecto:
   ```bash
   cd Modelamiento-Implementacion-CPSs-PR
   ```
3. Para ejecutar los modelos, necesitarás tener instalado MiniZinc:

   - Puedes descargar MiniZinc desde [https://www.minizinc.org/software.html](https://www.minizinc.org/software.html)

4. Ejecutar los modelos MiniZinc:

   - **Opción 1:** Abrir MiniZinc IDE

     - Inicia MiniZinc IDE
     - Selecciona File > Open y navega hasta el archivo .mzn que deseas ejecutar
     - Para modelos que tienen archivos de datos de prueba (archivos .dzn):
       - Selecciona el archivo .mzn (por ejemplo, `kakuro.mzn`)
       - En la opción "Open" del IDE, selecciona uno de los archivos .dzn de la carpeta Pruebas (por ejemplo, `Pruebas/Prueba1.dzn`)
     - Haz clic en "Run" para ejecutar el modelo

   - **Opción 2:** Usar la línea de comandos
     - Para ejecutar un modelo sin archivo de datos externo
     ```bash
     minizinc Acertijo/acertijo.mzn
     ```
     - Para ejecutar un modelo con un archivo de datos de prueba
     ```bash
     minizinc Kakuro/kakuro.mzn Kakuro/Pruebas/Prueba1.dzn
     ```

5. Los modelos disponibles son:
   - `Acertijo/acertijo.mzn` - No requiere archivo de datos
   - `Kakuro/kakuro.mzn` - Usa archivos en Kakuro/Pruebas/
   - `Rectángulo/rectangulo.mzn` - Usa archivos en Rectángulo/Pruebas/
   - `Reunión/reunion.mzn` - Usa archivos en Reunión/pruebas/
   - `Secuencia/secuencia.mzn` - No requiere archivo de datos
   - `Sudoku/sudoku.mzn` - Usa archivos en Sudoku/Pruebas/

---

## 📜 Licencia

Este proyecto está bajo la Licencia MIT.

---
