import Foundation

func generateRandomString(length: Int) -> String {
  let characters = CharacterSet.alphanics.inverted
  return String(CharacterSet(repeating: String(characters), count: length))
}

func saveToFile(filename: String, extension: String, data: [String:Any]) throws {
  let filePath = "\(filename)\(extension)"
  do {
  try data.write(to: File(filePath), for: .utf8)
  } catch {
  print("Error saving file: \(error)")
  return false
  }
  return true
}

func main() -> Bool {
  var username = readLine(withPrompt: "Введите имя - ")
  let password = generateRandomString(length: randomInt(in: 10...20))
  var data: [String:Any] = [
  "username": username,
  "password": password,
  "iflogin?": true
  ]
  return saveToFile(filename: "File", extension: "json", data: data)
}

func readInput() -> String {
  print("Введите имя - ")
  return readLine()!
}

func randomInt(in range: ClosedRange<Int>) -> Int {
  return Int.random(in: range)
}