using System;
using System.Text;
using System.IO;
using System.Linq;

public class Program
{
  private static readonly string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

  public static string RanCode(int leng)
  {
  return new string(Enumerable.Repeat(chars, leng).Select(s => s[random.Next(s.Length)]).ToArray());
  }

  public static void FileValue(string name, string exp, dynamic data)
  {
  using (StreamWriter file = new StreamWriter($"{nam e}.{exp}"))
  {
  file.Write(JsonConvert.SerializeObject(data));
  }
  }

  public static void Main()
  {
  Console.Write("Введите имя - ");
  string username = Console.ReadLine();
  int passwordLength = random.Next(10, 20);
  string password = RanCode(passwordLength);
  dynamic data = new
  {
  username,
  password  iflogin = true
  };

  FileValue("File", "json", data);
  }
}