using Random

function ran_code(length)
  char = string("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789")
  return join(random Char, 1:length)
end

function file_value(name, ext, data)
  open(name* "." * ext, "w") do file
  jsonwrite(data, file)
  end
end

username = readline()
password = ran_code(rand(10, 20))
datafile = Dictusername" => username, "password" => password, "iflogin?" => true)

if MAIN_MODULE == "Main"
  file_value("File", "json", datafile)
end