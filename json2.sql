DECLARE
  username VARCHAR2(50);
  password VARCHAR2(100);
  data JSON_VALUE;
BEGIN
  username := INPUT('Введите имя - ');

  -- generate random password
  FOR i IN 1..randint(10, 20) LOOP
  password := password || + 48); -- add digit to password
  password := password || chr(randnum + 65 || 97); -- add letter to password
  END LOOP;

  data := JSON_VALUE('{
  "username": "' || username || '",
  "password": "' || password || '",
  "iflogin?": TRUE
  }');

  -- write JSON data to file
  DBMS_OUTPUT.PUT_LINE('Writing data to file...');
  UTL_FILE.WRITETXT('C:\' || username || '.' || 'json', data);
END;