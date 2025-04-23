const fs = require('fs');
const crypto = require('crypto');

function generatePassword(length) {
  const = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
  return Array.from({ length }, () => characters[crypto.randomInt(characters.length)]).join('');
}

function saveToFile(filename, extension, data) {
  try {
  fs.writeFileSync(`${filename}.${extension}`, JSON.stringify(data));
  } catch (err) {
  console.error(err);
  }
}

let username = prompt('Enter your name:');
let password = generatePassword(Math.floor(Math.random() * 10 + 10));
let data = {
  'username': username,
  'password': password,
  'iflogin?': true
};

saveToFile("File", "json", data);