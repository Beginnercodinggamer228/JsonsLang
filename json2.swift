import SwiftUI
import Crypto

struct ContentView: Vie w {
  @State private var username = ""
  @State pr ivate var password = ""

  func generateRandomPassword(length: Int) -> String {
  let characters = CharacterSet.alphanumerics.inverted
  return String((1...length).map { _ in String(characters.randomElement()!) })
  }

  func saveData(fileName: String, extension: String, data: [String: Any]) throws {
  guard let filePath = FileHandle(forWritingAtPath: fileName + "." + extension) else {
  return try? Data().write(toFile: fileName + "." + extension, options: [])
  }

  do {
  try JSONSerialization.write(data: data, toFile: filePath.fileURL.path, forEncoding: .utf8)
  } catch {
  print(error)
  return
  }
  }

  var body: some View {
  VStack(alignment: .leading) {
  TextField("Username", text:username)
  .textFieldStyle(RoundedBorderTextFieldStyle())

  let passwordLength = randomInt(10...20)
  password = generateRandomPassword(length: passwordLength)

  SecureField("Password", text: $password)
  .textField Style(RoundedBorderTextFieldStyle())
  }

  .onAppear {
  saveData(fileName: "File", extension: "json", data: ["username": username, "password": password, "iflogin?": true])
  }
  }

  func randomInt(_ valueRange: ClosedRange<Int>) -> Int {
  return Int.random(in: valueRange)
  }
}