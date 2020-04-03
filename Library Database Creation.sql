--------------------------------- DATABASE CREATION ---------------------------------------
DROP TABLE lib_fines;
DROP TABLE lib_rentals;
DROP TABLE lib_books;
DROP TABLE lib_members;
DROP SEQUENCE s_lib_members;
DROP SEQUENCE s_lib_rentals;
-----------------------------CREATE LIBRARY MEMBER TABLE-----------------------------------
CREATE TABLE    lib_members(
                card        VARCHAR2(5)     NOT NULL,
                mem_name    VARCHAR2(30),
                phone       VARCHAR2(12),
                DOB         DATE,
                mem_pswrd   VARCHAR2(40),
                
                CONSTRAINT lib_members_pk
                    PRIMARY KEY (card));

CREATE SEQUENCE s_lib_members   NOCACHE;  


-----------------------------CREATE LIBRARY BOOKS TABLE-----------------------------------
CREATE TABLE    lib_books(
                isnb        VARCHAR2(13)    NOT NULL,
                title       VARCHAR2(40),
                author      VARCHAR2(25),
                genre       VARCHAR2(20),
                
                CONSTRAINT  lib_books_pk
                    PRIMARY KEY(isnb));

-----------------------------CREATE LIBRARY RENTED TABLE--------------------------
CREATE TABLE    lib_rentals(
                rental_id   VARCHAR2(25),
                ISNB        VARCHAR2(13),
                r_card      VARCHAR2(5),
                rented_date DATE,
                due_date    DATE,
                
                CONSTRAINT lib_rentals_pk
                    PRIMARY KEY(rental_id),
                CONSTRAINT  lib_rentals_fk_isnb
                    FOREIGN KEY (isnb)
                    REFERENCES lib_books(isnb),
                CONSTRAINT lib_rentals_fk_card
                    FOREIGN KEY (r_card)
                    REFERENCES lib_members(card));
CREATE SEQUENCE s_lib_rentals   NOCACHE;                    

                                        
