import java.util.Random

fun generatePassword(length: Int): String {
  val chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
  return StringBuilder(length).appendRandom(chars).toString()
}

fun saveToFile(name: String, extension: String, data: Map<String, Any>) {
  val file = File("$name.$extension")
  file.writer().use { writer ->
  writer.write(JSON.stringify(data))
  }
}

fun main() {
  val username = readLine("Введите имя - ")
  val password = generatePassword(random.nextInt(10) + 10)
  val data = mapOf(
  "username" to username,
  "password" to password,
  "iflogin?" to true
  )
  saveToFile("File", "json", data)
}