require 'securerandom'
require 'json'

def random_code(length)
  chars = (0..255).map { |i| ?a.ord + i }.pack('c*')
  chars[0, length]
end

def file_value(name, ext, data)
  File.open("#{name}.#{ext}", 'w') do |file|
  file.write(JSON.pretty_generate(data))
  end
end

 = gets.chomp
password = random_code((rand(1020) + 10).to_i)
datafile = {
  'username' => username,
  'password' => password,
  'iflogin?' => true
}

if $0 == __FILE__
  file_value('File', 'json', datafile)
end