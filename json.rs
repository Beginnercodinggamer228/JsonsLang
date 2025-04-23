use rand::Rng;
use std::fs::{OpenOptions, File};
use std::io::Write;

fn generate_random_string(length: usize) -> String {
  let mut rng = rand::thread_rng();
  (0..length).map(|_| rng.choice(&'a..='z').to_string()).collect()
}

fn write_file(name: &str, extension: &str, data: serde_json::Value) {
  let mut file = OpenOptions::new().write(true).create(true).open(format!("{}.{}", name, extension)).unwrap();
  serde_json::to_writer_pretty(&mut file, &data).unwrap();
}

fn main() {
  println!("Введите имя - ");

  let username = get_username();

  let password = generate_random_string(rand::thread_rng().gen_range(10..20));

  let data = serde_json::json!({
  "username": username,
  "password": password,
  "iflogin?": true
  });

  write_file("File", "json", data);
}

fn get_username() -> String {
  let mut username = String::new();
  std::io::stdin().read_line(&mut username).expect("Failed to read line");
  username.trim().to_string()
}