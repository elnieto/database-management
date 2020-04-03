---------------------------- VALUE INPUT ---------------------------------
---------------------------- LIB_ME VALUE INSERT  ---------------------------------
INSERT INTO lib_members(card, mem_name, phone, dob, mem_pswrd) 
    VALUES(s_lib_members.NEXTVAL, 'Andy Bernard', '773-773-7733', DATE '1981 - 11- 17', 'iloveacapela');
INSERT INTO lib_members(card, mem_name, phone, dob, mem_pswrd) 
    VALUES(s_lib_members.NEXTVAL,'Michael Scott', '773-777-7777', DATE '1978-12-25', 'dundermifflin4life');
INSERT INTO lib_members(card, mem_name, phone, dob, mem_pswrd) 
    VALUES(s_lib_members.NEXTVAL,'Jim Halpert', '773-888-8888',  DATE '1980 -11-20', 'nodwight');
INSERT INTO lib_members(card, mem_name, phone, dob, mem_pswrd) 
    VALUES(s_lib_members.NEXTVAL,'Dwight Schrute', '773-999-9999', DATE '1977-05-28', 'beetsbearsbatlestargallactica');
INSERT INTO lib_members(card, mem_name, phone, dob, mem_pswrd) 
    VALUES(s_lib_members.NEXTVAL,'kevin Malone', '773-555-5555', DATE '1977 - 04-01', 'chili');

----------------------------- LIB_BOOKS VALUE INSERT  ---------------------------------
INSERT INTO lib_books(isnb, title, author, genre)
    VALUES('111-1111-1111', 'Complete Guide to Raising Beets', 'Mose Schrute', 'gardening');
INSERT INTO lib_books(isnb, title, author, genre)
    VALUES('222-2222-2222', 'Pranks Tricks and Other Nonesense', 'Pam Beasley', 'humor');
INSERT INTO lib_books(isnb, title, author, genre)
    VALUES('333-3333-3333', 'Somehow I Manage', 'Michael Scott', 'Self Improvement');
INSERT INTO lib_books(isnb, title, author, genre)
    VALUES('444-4444-4444', 'Intro to Accounting for Dummies', 'Creed', 'Education');
INSERT INTO lib_books(isnb, title, author, genre)
    VALUES('555-5555-5555', 'Growing Mungbeans in your Desk' , 'Creed', 'gardening');
INSERT INTO lib_books(isnb, title, author, genre)
    VALUES('666-6666-6666', 'Best Chili Recipes' , 'Mother Malone', 'Cooking');
INSERT INTO lib_books(isnb, title, author, genre)
    VALUES('777-7777-7777', 'Bed and Breakfast Guide', 'Jan Levinson', 'Travel');
INSERT INTO lib_books(isnb, title, author, genre)
    VALUES('888-8888-8888', 'Scranton: The Electric City', 'Michael Scott', 'Travel');
INSERT INTO lib_books(isnb, title, author, genre)
    VALUES('111-1111-4444', 'History of Paper', 'Robert Dunder', 'History');
INSERT INTO lib_books(isnb, title, author, genre)
    VALUES('999-9999-9999', 'Declaring Bankrupcy', 'Robert Mifflin', 'Personal Finance');
INSERT INTO lib_books(isnb, title, author, genre)
    VALUES('111-1111-2222', 'Learnign German', 'August Heischman', 'Education');
INSERT INTO lib_books(isnb, title, author, genre)
    VALUES('111-1111-3333', 'Jamaica', 'Arthur Finch', 'Travel');
INSERT INTO lib_books(isnb, title, author, genre)
    VALUES('111-1111-5555', 'Improvisations', 'Michael Scott', 'Humor');
----------------------------- LIB_RENTALS VALUE INSERT  ---------------------------------
INSERT INTO lib_rentals(rental_id,isnb,r_card,rented_date,due_date)
    VALUES(s_lib_rentals.NEXTVAL,'444-4444-4444','5',DATE '2019-08-20', DATE '2019-08-30');
INSERT INTO lib_rentals(rental_id,isnb,r_card,rented_date,due_date)
    VALUES(s_lib_rentals.NEXTVAL,'666-6666-6666', '3', DATE '2019-08-20', DATE '2019-08-29');
INSERT INTO lib_rentals(rental_id,isnb,r_card,rented_date,due_date)
    VALUES(s_lib_rentals.NEXTVAL,'666-6666-6666', '5', DATE ' 2019-08-01', DATE '2019-08-21');
