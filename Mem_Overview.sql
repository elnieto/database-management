----------------------DISPLAY CUSTOMER OVERVIEW--------------------
SET SERVEROUTPUT ON
ACCEPT cust_num     PROMPT  'Enter Customer Number.'

DECLARE 

    cust        VARCHAR2(5) :='&cust_num';
    m_name      lib_members.mem_name%TYPE;
    m_phone     lib_members.phone%TYPE;
    m_dob       lib_members.dob%TYPE;
    
    PROCEDURE mem_overview( cust        IN  VARCHAR2,
                            m_name    OUT VARCHAR2,
                            m_phone   OUT VARCHAR2,
                            m_dob       OUT VARCHAR2)IS
    BEGIN
        SELECT mem_name, phone, dob INTO m_name, m_phone, m_dob
        FROM lib_members
        WHERE card = cust;
        
        DBMS_OUTPUT.put_line('Member Name:  ' ||m_name);
        DBMS_OUTPUT.put_line('Phone:        ' ||m_phone);
        DBMS_OUTPUT.put_line('DOB:          ' ||m_dob);
    EXCEPTION 
    WHEN no_data_found THEN
        DBMS_OUTPUT.put_line('Enter a valid customer number.'); 
    WHEN OTHERS THEN 
    DBMS_OUTPUT.put_line('Procedure could not be completed');
    END;
BEGIN    
mem_overview(cust, m_name, m_phone, m_dob);
END;
/
    