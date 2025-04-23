import 'dart:convert';
import 'dart:math';

void RanCode(int length) {
  const char = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  return List.generate(length, (index) => char[Random().nextInt(char.length)]).join();
}

void FileValue(String name, String extension, Map data) {
  final filename = '$name.$extension';
  final file = File(filename);
  file.writeAsString(jsonEncode(data));
}

void main() {
  stdout.write('Введите имя - ');
  final username = stdin.readLineSync()!;
  final password = RanCode(20);
  final datafile = {'username': username, 'password': password, 'iflogin?': true};
  FileValue('File', 'json', datafile);
}