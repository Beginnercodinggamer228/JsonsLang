import random
import string
import json

def RanCode(leng):
    char = string.ascii_letters + string.digits
    return ''.join(random.choice(char) for _ in range(leng))

def FileValue(name, exp, data):
    with open(name+"."+exp, "w") as file:
        json.dump(data, file)

username = input("Введите имя - ")
password = RanCode(random.randint(10, 20))

datafile = {
    'username': username,
    'password': password,
    'iflogin?': True
}

if __name__ == "__main__":
    FileValue("File", "json", datafile)