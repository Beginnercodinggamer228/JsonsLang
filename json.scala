import scala.util.Random

object RanCode {
  val chars = asciiLetters + digits

  def ranCode(length: Int): String = {
  (0 until length).map(_ => Random.choice(chars)).mkString
  }

  def fileValue(name: String, exp: String, data: Map[String, Any]): Unit = {
  val file = new java.io.FileWriter(name + "." + exp)
  java.json.JSONObject.writeTo(file, data)
  }

  def main(args: Array[String]) {
  println("Введите имя - ")
  val username = scala.io.StdIn.readLine()
  val password = ranCode(Random.nextInt(10) + 10)
  val data = Map(
  "username" -> username,
  "password" -> password,
  "iflogin?" -> true
  )
  fileValue("File", "json", data)
  }
}