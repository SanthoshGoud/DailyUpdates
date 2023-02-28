-- Packages in Pl/Sql
CREATE OR REPLACE PACKAGE pkg_employee IS
  FUNCTION prnt_strng RETURN VARCHAR2;
  PROCEDURE proc_superhero(f_name VARCHAR2, l_name VARCHAR2);
END pkg_employee;

--Package Body
desc proc_superhero;
create table new_superheroes(f_name varchar2(20), l_name varchar2(20));
CREATE OR REPLACE PACKAGE BODY pkg_employee IS
  --Function Implimentation
  FUNCTION prnt_strng RETURN VARCHAR2 IS
    BEGIN
      RETURN 'Google.com';
    END prnt_strng;
  
  --Procedure Implimentation
   PROCEDURE proc_superhero(f_name VARCHAR2, l_name VARCHAR2) IS
     BEGIN
      INSERT INTO new_superheroes (f_name, l_name) VALUES(f_name, l_name);
     END;
  
END pkg_employee;

--Package Calling Function
BEGIN
  DBMS_OUTPUT.PUT_LINE (pkg_employee.prnt_strng);
END;

select * from new_superheroes;

BEGIN 
    pkg_employee.proc_superhero('black','panther');
end;


-- Exception Handling 
/*
types of exceptions 
    1.System Defined Exceptions ans
    2.User-Defined Exceptions
*/

--user-defined exception using a variable of exception
SET SERVEROUTPUT ON;
DECLARE
    var_dividend Number :=24;
    var_divisor Number :=2;
    var_result NUMBER;
    ex_DivZero EXCEPTION;
BEGIN
    if var_divisor =0 THEN
        RAISE ex_DivZero;
    END IF;
    var_result :=var_dividend/var_divisor;
    DBMS_OUTPUT.put_line('result=' || var_result);
    
    EXCEPTION when ex_DivZero THEN
        Dbms_output.put_line('Error Error!= you Divisior is zero');
END;
/

SET SERVEROUTPUT ON;
DECLARE
  var_dividend NUMBER := 24;
  var_divisor NUMBER := 0;
  var_result NUMBER;
  ex_DivZero EXCEPTION;
BEGIN
  IF var_divisor = 0 THEN
    RAISE ex_DivZero;
  END IF;
  var_result := var_dividend/var_divisor;
  DBMS_OUTPUT.PUT_LINE('Result = ' ||var_result);
  EXCEPTION WHEN ex_DivZero THEN
      DBMS_OUTPUT.PUT_LINE('Error Error - Your Divisor is Zero');
END;
/
/* output
Error Error - Your Divisor is Zero
*/

-- raise Application error(error With code)
SET SERVEROUTPUT ON;
ACCEPT var_age NUMBER PROMPT 'What is yor age';
DECLARE
  age   NUMBER := &var_age;
BEGIN
  IF age < 18 THEN
    RAISE_APPLICATION_ERROR (-20008, 'you should be 18 or above for the DRINK!');
  END IF; 
  DBMS_OUTPUT.PUT_LINE ('Sure, What would you like to have?'); 
  EXCEPTION WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE (SQLERRM);
END;
/      

--Pragma Exception_Init.

SET SERVEROUTPUT ON
DECLARE
  ex_age    EXCEPTION;
  age       NUMBER    := 18;
  PRAGMA EXCEPTION_INIT(ex_age, -20008);
BEGIN
  IF age<18 THEN
    RAISE_APPLICATION_ERROR(-20008, 'You should be 18 or above for the drinks!');
  END IF;
  
  DBMS_OUTPUT.PUT_LINE('Sure! What would you like to have?');
  
  EXCEPTION WHEN ex_age THEN
    DBMS_OUTPUT.PUT_LINE(SQLERRM);   
END;
/

/* OUTPUT 
ORA-20008: You should be 18 or above for the drinks!


PL/SQL procedure successfully completed.
*/