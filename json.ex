defmodule Main do
  def generate_random_code(length), do: String.duplicate(Enum.join([?a..?z, ?0..?9], ""), length)

  def write_file(name, extension, data) do
  File.write(file_path(name, extension), Jason.encode!(data))
  end

  defp file_path(name, extension), do: "#{System.get_cookie(:user)}_#{name}#{extension}"

  def main() do
  username = IO.gets("Введите имя - ")
  password = generate_random_code(randint(10, 20))
  datafile = %{username => username, password => password, iflogin? => true}

  write_file("File", "json", datafile)
  end

  def run() do
  main()
  end
end

Main.run()
