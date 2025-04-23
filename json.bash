#!/bin/bash

# Generate a random password of given length
generate_password() {
  local leng=$1
  local chars=$(echo {a..z} {A..Z} {0..9})
  echo "${chars:$((RANDOM%${#chars}-leng)):$leng}" | tr -d '\n'
}

# Create a JSON file with given data and filename
create_json_file() {
  local filename=$1
  local data=$2
  local extension=$3
  echo "$data" > $filename.$extension
}

# Main function
main() {
  username=$(read -p "Введите имя - ")
  password=$(generate_password $(($RANDOM%11+10)))
  declare -A datafile
  datafile[username]=$username
  datafile.password=$password
  datafile.iflogin?$=true

  create_json_file "File" "$(declare -p datafile)" "json"
}

main