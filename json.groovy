import java.util.Random
import java.util.UUID
import java.io.FileWriter
import java.io.IOException

def generateRandomPassword(length) {
  def charSet = (Character) 'a'..(Character) 'z' + (int) ('0')..(int) ('9')
  def randomPassword = []
  Random rand = new Random()
  for (int i=0; i<length; i++) {
  randomPassword += charSet[rand.nextInt(charSet.size())]
  }
  return (String)randomPassword.join('')
}

def writeToJsonFile(name, extension, data) throws IOException {
  FileWriter fileWriter = new FileWriter((name + "." + extension), true)
  fileWriter.write(jsonToString(data))
  fileWriter.close()
}

def jsonToString(obj) {
  def json = new JsonBuilder().build(obj)
  return json.toString()
}

 String username = System.console().readLine("Введите имя - ")
String password = generateRandomPassword(random.nextInt(10, 20))
Map data = [
  'username': username,
  'password': password,
  'iflogin?': true
]

if (System.getProperty('main')?.equals(this.class.name)) {
  writeToJsonFile("File", "json", data)
}