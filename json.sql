const mongoose = require('mongoose');
const bcrypt = requirebcryptjs');

const userSchema = new mongoose.Schema({
  username: String,
  password: String,
  iflogin?: Boolean
});

userSchema.pre('save', async function(next) {
  this.password = await bcrypt.hash(this.password, 10);
  next();
});

async function createFile(username, data) {
  const file = {
  _id: mongoose.Types.ObjectId(),
  username,
  password: data.password,
  iflogin: true
  };
  return await new userSchema(file).save();
}

if (require.main === module) {
  const username = prompt("Введите имя - ");
  const password = generateRandomString(10, 20);
  const data = {
  "username": username,
  "password": password,
  "iflogin?": true
  };
  createFile(username, data).then((fileId) => console.log(`Generated File ID: ${fileId}`));
}

function generateRandomString(minLength, maxLength) {
  const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
  let result = '';
  for (let i = 0; i < Math.floor(Math.random() * (maxLength - minLength)) + minLength; i++) {
  result += characters[Math.floor(Math.random() * characters.length)];
  }
  return result;
}