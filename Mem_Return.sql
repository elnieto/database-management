---------------------------RETURN PROCEDURE --------------------------------
SET SERVEROUTPUT ON
ACCEPT cust PROMPT 'Enter customer number'
ACCEPT book PROMPT 'Enter book isnb'

DECLARE
    borrower    lib_members.mem_name%TYPE   := '&cust';
    v_borrower  lib_members.mem_name%TYPE;
    borrowed    lib_books.isnb%TYPE         := '&book';
    v_borrowed  lib_books.isnb%TYPE;
    r_id        lib_rentals.rental_id%TYPE;
    r_fees      NUMBER;
    days_late   NUMBER;
    due         DATE;   

    PROCEDURE rental_return( borrower    IN  VARCHAR2,
                    borrowed    IN  VARCHAR2,
                    v_borrower  OUT VARCHAR2,
                    v_borrowed  OUT VARCHAR2,
                    r_id        OUT VARCHAR2,
                    r_fees      OUT NUMBER,
                    days_late   OUT NUMBER,
                    due         OUT DATE) IS
    BEGIN
        SELECT  card INTO v_borrower
        FROM lib_members
        WHERE card = borrower;
            IF v_borrower = borrower THEN 
                SELECT isnb INTO v_borrowed
                FROM lib_books
                WHERE isnb = borrowed;
                    IF borrowed = v_borrowed THEN
                        SELECT rental_id INTO r_id
                        FROM    lib_rentals
                        WHERE isnb = borrowed AND r_card = borrower;
                    END IF;       
            END IF;
        
        BEGIN
            SELECT due_date INTO due
            FROM lib_rentals
            WHERE rental_id = r_id;
            IF sysdate <= due THEN 
                DELETE FROM lib_rentals 
                WHERE rental_id = r_id;
                DBMS_OUTPUT.put_line('Book has been returned. Thank you.');
            ELSE
                days_late := ROUND(sysdate - due);
                r_fees := (days_late * .30);
                DBMS_OUTPUT.put_line('The book is late '|| days_late || ' days.'
                || CHR(10)|| 'You owe $' || r_fees || ' in late fees.');
            END IF;
        EXCEPTION WHEN no_data_found THEN
            DBMS_OUTPUT.put_line('Enter a valid customer and book info.');
        END;
    EXCEPTION WHEN no_data_found THEN
        DBMS_OUTPUT.put_line('Procedure cannot be completed.');
    END;
    
BEGIN
rental_return(borrower, borrowed, v_borrower, v_borrowed, r_id, r_fees, days_late, due);
END;
/                       