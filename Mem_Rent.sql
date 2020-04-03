---------------------------RENTAL PROCEDURE --------------------------------
SET SERVEROUTPUT ON
ACCEPT cust PROMPT 'Enter a card  number.'
ACCEPT book PROMPT 'Enter a book isnb.'

DECLARE
    borrower    lib_members.mem_name%TYPE   := '&cust';
    v_borrower  lib_members.mem_name%TYPE;
    borrowed    lib_books.isnb%TYPE         := '&book';
    v_borrowed  lib_books.isnb%TYPE;
    r_title    lib_books.title%TYPE;
    
    PROCEDURE rent( borrower    IN  VARCHAR2,
                    borrowed    IN  VARCHAR2,
                    v_borrower    OUT  VARCHAR2,
                    v_borrowed    OUT  VARCHAR2,
                    r_title     OUT     VARCHAR2) IS
    BEGIN
        SELECT  card INTO v_borrower
        FROM lib_members
        WHERE card = borrower;
            IF v_borrower = borrower THEN 
                SELECT isnb INTO v_borrowed
                FROM lib_books
                WHERE isnb = borrowed;
                    IF borrowed = v_borrowed THEN
                        SELECT title INTO r_title
                        FROM lib_books
                        WHERE isnb = borrowed;
                        
                        INSERT INTO lib_rentals(rental_id,isnb,r_card,rented_date,due_date)
                        VALUES(s_lib_rentals.NEXTVAL, borrowed, borrower, sysdate, (sysdate+21)); 
                        DBMS_OUTPUT.put_line(r_title ||' is due on '|| (sysdate+21));
                    END IF;
            END IF;
            
    EXCEPTION 
        WHEN no_data_found THEN 
           DBMS_OUTPUT.put_line('Enter valid card number and book isnb.'); 
    END;
BEGIN
rent(borrower, borrowed, v_borrower, v_borrowed,r_title);
END;
/