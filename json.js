function generateRandomCode(length) {
    const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    return Array.from({length}, () => characters[Math.floor(Math.random() * characters.length)]).join('');
  }
  
  function writeToFile(name, extension, data) {
    try {
    const fs = require('fs');
    fs.writeFileSync(`${name}.${extension}`, JSON.stringify(data));
    } catch (error) {
    console.error(error);
    }
  }
  
  const readline = require('readline').createInterface({
    input: process.stdin,
    output: process.stdout
  });
  
  readline.question('Введите имя - ', username => {
   const password = generateRandomCode(Math.floor(Math.random() *11) + 10);
    const datafile = {
    'username': username,
    'password': password,
    'iflogin?': true
    };
    writeToFile("File", "json", datafile);
    readline.close();
  });