#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <locale.h>
#include <json/json.h>

// Function to generate random string of a given length
char* RanCode(int leng) {
  const char* chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
  char* password = (char*)malloc(leng + 1);
  if (!password) {
  return NULL;
  }
  for (int i = 0; i < leng; i++) {
  password[i] = chars[rand() % (sizeof(chars) - 1)];
  }
  password[leng] = '\0';
  return password;
}

// Function to write data to a file in JSON format
void FileValue(const char* name, const char* extension, Json::Value data) {
  FILE* file = fopen(name + "." + extension, "w");
  if (!file) {
  printf("Error opening file for writing.\n");
  return;
  }
  json::Value json_data = data;
  json::WriterBuilder builder;
  std::string output = builder.build(json_data);
  fwrite(output.c_str(), sizeof(char), strlen(output), file);
  fclose(file);
}

int main() {
  srand(time(NULL)); // Seed for random number generation
  printf("Введите имя - ");
  char username[100];
  fgets(username,  99, stdin);
  username[strcspn(username, "\n")] = 0; // Remove newline character
  int password_len = rand() % 10 + 1;
  char* password = RanCode(password_len);
  if (!password) {
  printf("Error generating password.\n");
  return 1;
  }
  Json::Value data;
  data["username"] = username;
  data["password"] = password;
  data["iflogin?"] = true;
  FileValue("File", "json", data);
  free(password); // Free allocated memory
  return 0;
}