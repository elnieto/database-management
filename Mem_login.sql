------------------------------MEMBER lOGIN PROCEDURE-----------------------------
SET SERVEROUTPUT ON
SET ECHO ON
ACCEPT  card_num    PROMPT 'Enter card member number.'
ACCEPT  card_pass   CHAR   PROMPT  'Enter card member password.'

DECLARE
    username   VARCHAR2(5)     :='&card_num';
    in_pass    VARCHAR2(40)    :='&card_pass';
    v_user     VARCHAR2(5);
    v_pass     VARCHAR2(40);
    wrong_user  EXCEPTION;
    wrong_pass  EXCEPTION;
    
    PROCEDURE login(    username    IN  VARCHAR2,
                        in_pass     IN  VARCHAR2,
                        v_user      OUT VARCHAR2,
                        v_pass      OUT VARCHAR2) IS
    BEGIN
        SELECT card INTO v_user
        FROM lib_members
        WHERE card = username;
            
            IF v_user = username THEN
                SELECT mem_pswrd INTO v_pass
                FROM lib_members
                WHERE mem_pswrd = in_pass;
                
                IF v_pass = in_pass THEN
                    DBMS_OUTPUT.put_line('Login Successful');
                --ELSE
                    --RAISE wrong_pass;
                END IF;     
            --ELSE
                --RAISE wrong_user;
            END IF;
    
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.put_line('Enter valid user name or password.');
        WHEN others THEN
            DBMS_OUTPUT.put_line('Please could not be completed');
    END;
BEGIN
login(username, in_pass, v_user, v_pass);
END;
/
