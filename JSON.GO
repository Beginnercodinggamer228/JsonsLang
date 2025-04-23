package main

import (
 "fmt"
 "math/rand"
 "time"
)

func RandCode(leng int) string {
 charSet := "abcdefghijklmnopqrstuvwxyz0123456789"
 rand.Seed(time.Now().UnixNano())
 return fmt.Sprintf(" %s", strings.Repeat(string(charSet), leng))
}

type Data struct {
 Username  string
_Password string
 IfLogin  bool `json:",omitempty"`
}

func FileValue(name ext string, data map[string]interface{}) {
 f, err os.Create(fmt.Sprintf("%s.%s", name, ext))
 if err != nil {
  panic(err)
 }
 defer f.Close()

 err = json.NewEncoder(f).Encode(data)
 if err != nil {
  panic(err)
 }
}

func main() {
 rand.Seed(time.Now().UnixNano())
 usern ame := input("Введите имя - ")
 password := RandCode(randomInt(10, 20))
 data := map[string]interface{}{
 "username": username,
  "password": password  "Iflogin?": true,
 }
 FileValue("File", "json", data)
}

func randomInt(min, max int) int {
 rand.Seed(time.Now().UnixNano())
 return min + rand.Intn(max-min+1)
}