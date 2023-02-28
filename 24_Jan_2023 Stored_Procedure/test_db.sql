/*What do you mean by stored procedure?
A stored procedure is a prepared SQL code that you can s
ave, so the code can be reused over and over again. So if you have an SQL query 
that you write over and over again, save it as a stored procedure, and then just 
call it to execute it.
*/
CREATE OR REPLACE PROCEDURE add_employee IS
  var_name VARCHAR2(20) := 'Manish';
  var_web  varchar2(20) := 'tutorialpiont.com';
BEGIN
    DBMS_OUTPUT.PUT_LINE('whats up internet? I am' ||var_name||
    'from' || var_web);
    
END add_employee;
/
/*
output 
Procedure ADD_EMPLOYEE compiled
*/

--calling the stored procedure
set SERVEROUTPUT on;
EXECUTE add_employee;


CREATE TABLE employee (
   department_id NUMBER(5) NOT NULL,
   name VARCHAR2(50) NOT NULL,
   salary NUMBER(10,2) NOT NULL,
   PRIMARY KEY (department_id)
);


/* output of employee table

1	John Smith	50000
2	Revathi	50000
3	Santhosh	500000
4	Sanjay	51000 */

--stored procedure with parameters
Create or replace PROCEDURE emp_sal(dep_id Number, sal_raise Number)
IS 
BEGIN
    
    UPDATE employee set salary = salary * sal_raise WHERE department_id =dep_id;
    DBMS_OUTPUT.put_line('salary updated successfully');
END;
/


--calling Notations

Create or replace PROCEDURE emp_sal(dep_id Number, sal_raise Number)
IS 
BEGIN
    
    UPDATE employee set salary = salary * sal_raise WHERE department_id =dep_id;
    DBMS_OUTPUT.put_line('salary updated successfully');
END;
/


EXECUTE emp_sal(4,2)

1) Named calling Notations

Create or replace FUNCTION add_num(
var_1 Number,var_2 Number DEFAULT 0, var_3 Number)
return number
IS 
BEGIN
    DBMS_OUTPUT.put_line('va1_1 ->'||var_1);
    DBMS_OUTPUT.put_line('va1_1 ->'||var_1);
    DBMS_OUTPUT.put_line('va1_1 ->'||var_1);
    Return var_1+var_2+var_3; 
END;
/

DECLARE
var_result Number;
BEGIN
    var_result := add_num(var_3 => 5,var_1 => 2);
    DBMS_OUTPUT.put_line('Result ->'|| var_result);
End;
/

--output
/*
Function ADD_NUM compiled

va1_1 ->2
va1_2 ->0
va1_3 ->5
Result ->7

PL/SQL procedure successfully completed
*/



