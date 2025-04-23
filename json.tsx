import * as crypto from 'crypto';
import * as fs from 'fs';

function generateRandomCode(length: numbe r): string {
  const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
  return Array.from({ length }, () => characters[Math.floor(Math.random() * characters.length)]).join('');
}

function saveToFile(name: string, extension: string, data: any) {
  fs.writeFileSync(`${name}.${extension}`, JSON.stringify(data));
}

let username = prompt("Enter your name: ");
const password = generateRandomCode(Math.floor(Math.random() * 11) + 10);
const dataFile = {
  'username': username,
  'password': password,
  'ifLogin?': true
};

if (require.main === module) {
  saveToFile('File', 'json', dataFile);
}