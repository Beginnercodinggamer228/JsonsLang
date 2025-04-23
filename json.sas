data dict;
  do i = 1 to &leng;
  char = 'A' + 'a' * (0 .. 35);
  put char;
  end;
run;

proc file 
  infile="C:\file" 
  outfile="C:\file"&exp."json"
  datalines =
  "username=username
  password=&char1
  iflogin?=true"
  ;
run;

%let username = %sexpr(input("Введите имя - "));
%let char1 %eval(&leng*2);
data dict;
  do i = 1 to &leng;
  let char = 'A' + 'a' * (0 .. 35);
  output;
  end;
run;

proc print data=dict;
run;

data create_data;
  username = &username;
  password = &char1;
  iflogin? = true;
run;

proc file 
  infile="C:\file" 
  outfile="C:\file"&exp."json"
  datalines =
  "username=username
  password=CreateData.password
  iflogin?=true"
  ;
run;

%let username = %sysfunc(input(&username));