program CodeConverter;

var
  username: string;
  password: string;
  datafile: string;

function RanCode(leng: integer): string;
begin
  var
  charSet: set of char;
  choice: char;
  begin
  charSet := 'abcdefghijklmnopqrstuvwxyz0123456789';
  for i := 1 to leng do
  choice := Random(charSet);
  Result := choice;
  end;
end;

procedure FileValue(name, extension, data: string);
var
  file: text;
begin
  AssignFile(file, name+, true); // Opens and creates the file if it doesn exist
  Writeln(file, jsontoString(data));
  CloseFile(file);
end;

function jsontoString(data: string): string;
var
  i: integer = 1;
begin := '{"username": "' + username + '",';
  Result := Result + ' "password":"' + password + '",  Result := Result + ' "iflogin?":true}';
end;

begin
  writeln('Введите имя:');
  Readln(username);
  write('Password: ');
  Write(password :=Code(random(10) + 1));
  datafile := '{"username":"'+ username +'",';
  datafile := datafile + ' "password":"' + password + '",';
  datafile := datafile + '"iflogin?":true}';
  FileValue('File', '.json', datafile);
end.