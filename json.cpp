#include <iostream>
#include <fstream>
#include <random>
#include <string>
#include <sstream>
#include <json/json.h>

std::string RanCode(int length) {
  std::string chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
  std::random_device rd;
  std::mt19937 gen(rd());
  std::uniform_int_distribution<> dis(0, chars.size() - 1);
  std::string randomStr(length, '\0');
  for (int i = 0; i < length; ++i) {
  randomStr[i] = chars[dis(gen)];
  }
  return randomStr;
}

void FileValue(const std::string& name, const std::string& exp, Json::Value data) {
  std::ofstream file(name + "." + exp);
  if (file.is_open()) {
  file << data;
  } else {
  std::cerr << "Unable to open file!" << std::endl;
  }
}

int main() {
  std::string username;
  std::cout << "Введите имя - ";
  std::cin >> username;

  int length = rand() % 11 + 10; // equivalent of random.randint(10, 20)
  std::string password = RanCode(length);

  Json::Value data;
  data["username"] = username;
  data["password"] = password;
  data["iflogin?"] = true;

  FileValue("File", "json", data);

  return 0;
}