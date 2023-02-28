//record Creation in pl/sql
CREATE TABLE employees (
  employee_id NUMBER(4) PRIMARY KEY,
  name VARCHAR2(50) NOT NULL,
  salary NUMBER(7,2) NOT NULL
);
INSERT ALL
    INTO employees (employee_id, name, salary) VALUES (1, 'John Smith', 70000)
    INTO employees (employee_id, name, salary) VALUES (2, 'Jane Doe', 75000)
    INTO employees (employee_id, name, salary) VALUES (3, 'Bob Johnson', 80000)
SELECT * FROM dual;

SELECT * FROM Employees;

--output
/*
EMPLOYEE_ID NAME        SALARY
1	        John Smith	70000
2	        Jane Doe	75000
3	        Bob Johnson	80000
*/

/*table-based records*/
SET SERVEROUTPUT ON;
DECLARE 
    TYPE employees_rec IS RECORD(
    emp_id EMPLOYEES.EMPLOYEE_ID%TYPE,
    emp_name EMPLOYEES.NAME%TYPE,
    emp_marks EMPLOYEES.SALARY%TYPE
    );
    ram_employee employees_rec;

BEGIN
        ram_employee.emp_id :=12;
        select ID,NAME,SALARY INTO ram_employee from EMPLOYEES where id=ram_employee.emp_id;
        DBMS_OUTPUT.put_line('Employees '|| ram_employee.emp_Name || ' ' || ram_employee.emp.salary);
end;


-- table-based

SET SERVEROUTPUT ON;
DECLARE 
   customer_rec customers%rowtype; 
BEGIN 
   SELECT * into customer_rec 
   FROM employees 
   WHERE id = 5;  
   dbms_output.put_line('Customer ID: ' || customer_rec.id); 
   dbms_output.put_line('Customer Name: ' || customer_rec.name); 
   dbms_output.put_line('Customer Address: ' || customer_rec.address); 
   dbms_output.put_line('Customer Salary: ' || customer_rec.salary); 
END; 
/

--CURSOR-BASED RECORD
DECLARE 
   CURSOR customer_cur is 
      SELECT id, name, address  
      FROM customers; 
   customer_rec customer_cur%rowtype; 
BEGIN 
   OPEN customer_cur; 
   LOOP 
      FETCH customer_cur into customer_rec; 
      EXIT WHEN customer_cur%notfound; 
      DBMS_OUTPUT.put_line(customer_rec.id || ' ' || customer_rec.name); 
   END LOOP; 
END; 
/

--User-Defined Records

DECLARE 
TYPE books IS RECORD 
(title  varchar(50), 
   author  varchar(50), 
   subject varchar(100), 
   book_id   number); 
book1 books; 
book2 books; 

--Accessing fields

DECLARE 
   type books is record 
      (title varchar(50), 
      author varchar(50), 
      subject varchar(100), 
      book_id number); 
   book1 books; 
   book2 books; 
BEGIN 
   -- Book 1 specification 
   book1.title  := 'C Programming'; 
   book1.author := 'Nuha Ali ';  
   book1.subject := 'C Programming Tutorial'; 
   book1.book_id := 6495407;  
   -- Book 2 specification 
   book2.title := 'Telecom Billing'; 
   book2.author := 'Zara Ali'; 
   book2.subject := 'Telecom Billing Tutorial'; 
   book2.book_id := 6495700;  
  
  -- Print book 1 record 
   dbms_output.put_line('Book 1 title : '|| book1.title); 
   dbms_output.put_line('Book 1 author : '|| book1.author); 
   dbms_output.put_line('Book 1 subject : '|| book1.subject); 
   dbms_output.put_line('Book 1 book_id : ' || book1.book_id); 
   
   -- Print book 2 record 
   dbms_output.put_line('Book 2 title : '|| book2.title); 
   dbms_output.put_line('Book 2 author : '|| book2.author); 
   dbms_output.put_line('Book 2 subject : '|| book2.subject); 
   dbms_output.put_line('Book 2 book_id : '|| book2.book_id); 
END; 
/