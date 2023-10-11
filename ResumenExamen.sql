-- DUDAS
  -- Que excepciones hay que saberse
  -- Que provoca el for each row
  -- Una funcion o procedimiento puede tener declare?
  -- Que codigos de error hay que saberse

SET SERVEROUTPUT ON; -- Para la salida por pantalla
DBMS_OUTPUT.PUT_LINE(''); 
pragma autonomous_transaction; -- Para cuando hacemos consultas de una tabla 
                               -- que ya estamos accediendo desde un trigger

/* ESTRUCTURA BÁSICA */
DECLARE
  -- Declaración de variables
BEGIN
  -- Programa
  EXCEPTION
    -- Excepciones
END;




/* BUCLES */

  -- IF
  IF condicion THEN
    -- Programa
  ELSE
    -- Programa
  END IF;
  
  -- WHILE
  WHILE condicion LOOP
    -- Programa
  END LOOP;
  
  -- LOOP
  LOOP
    -- Programa
    EXIT WHEN condicion;
  END LOOP;
  
  -- FOR
  FOR contador IN LIM..LIM LOOP
    -- Programa
  END LOOP;
  
  
  
  
/* EXCEPCIONES */

  RAISE <excepcion>;
  RAISE_APPLICATION_ERROR(<error_num>,<mensaje>);
    -- <error_num> es un entero negativo comprendido entre -20001 y -20999
    -- <mensaje> la descripción del error
  WHEN nombre THEN accion;
  
  -- Excepciones tipicas
    -- no_data_found
    -- too_many_rows
    -- others




/* CURSORES */

  -- IMPLICITOS (una fila)
  SELECT nombre INTO variable FROM ... ;
  
  -- EXPLICITOS (más de una fila)
    /* Hay que hacer los siguientes pasos:
      - Declarar
      - Abrir
      - Usar
      - Cerrrar
    */
    
    CURSOR nombre_cursor IS instrucción_SELECT ;
    
    OPEN nombre_cursor;
    
    LOOP
      FETCH nombre_cursor INTO variables;
      EXIT WHEN cursor%NOTFOUND;
    END LOOP;
    
    WHILE nombre_cursor%FOUND LOOP
      FETCH nombre_cursor INTO lista_variables;
    END LOOP; 

    CLOSE nombre_cursor;




/* PROCEDIMIENTOS */
  -- No devuelven nada
  -- Se sustituye el DECLARE
  CREATE OR REPLACE PROCEDURE nombre_procedimiento(variables) IS
    
  
/* FUNCIONES */
  -- Devuelven valores
  -- Se sustituye el DECLARE
  CREATE OR REPLACE FUNCTION nombre_procedimiento(variables) RETURN tipo_dato IS

/* DISPARADORES O TRIGGERS */
  CREATE OR REPLACE TRIGGER nombre_trigger {BEFORE, AFTER}
  {UPDATE OR DELETE OR INSERT} ON nombre_tabla FOR EACH ROW
  BEGIN
    -- Trigger
    IF INSERTING THEN
    --
    END IF;
    
    IF DELETING THEN
    --
    END IF;
    
    IF UPDATING THEN
    --
    END IF;
  END;
  
  -- Valor anterior :old.valor
  -- Valor nuevo: :new.valor