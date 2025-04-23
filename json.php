<?php

function RanCode($leng) {
  $char = str_split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123459');
  return implode('', array_fill(0, $leng, random_char($char)));
}

function random_char($) {
  return $string[rand(0, strlen($st ring) - 1)];
}

$datafile = [
  'username' => $_POST['username'],
  'password' => RanCode(random_int(10, 20)),
  'iflogin?' => true
];

function FileValue($name, $exp, $data) {
  file_put_contents($name . '.' . $exp, json_encode($data));
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
  FileValue("File", "json", $datafile);
}