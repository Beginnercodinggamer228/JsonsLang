import crypto from 'crypto'

import os


def ranCode(length)

  chars = crypto.randomBytes(length).toString('hex')

  return chars


def fileValue(name, ext, data)

  fs = require('fs')

  fs.writeFileSync name + '.' + ext, JSON.stringify(data)


username = prompt("Введите имя - ")

password = ranCode(Math.floor Math.random() * 11) + Math.floor Math.random() * 10

datafile =

  username: username

  password: password

  iflogin?: true


if self is main then

  fileValue "File", 'json', datafile