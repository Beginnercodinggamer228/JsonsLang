import crypto from 'crypto';

function generateRandomCode(length) {
  const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
  return Array.from({ length }, () => characters[Math.floor(Math.random() * characters.length)]).join('');
}

function writeToFile(name, extension, data) {
  const fileContent = JSON.stringify(data);
  const fs = require('fs');
  fs.writeFile(`${name}.${extension}`, fileContent, (err) => {
  if (err) throw err;
  });
}

const username = prompt("Введите имя - ");
const password = generateRandomCode(Math.floor(Math.random() * 10 + 10));
const dataFile = {
  'username': username,
  'password': password,
  'iflogin?': true
};

if (require.main === module) {
  writeToFile("File", "json", dataFile);
}