$char = [Console]::ReadKey().KeyData -replace '\s+'

function RanCode {
  param ($length)
  return (Get-Random -Charactershell
$random = New-Object System.Random
function RanCode {
  param ($length)
  $chars = [char]::GetASCIIValues('A'..'Z') + [char]::GetASCIIValues('a'..'z') + [char]::GetASCIIValues('0'..'9')
  return ((Get-Random -Minimum 0 -Maximum $length) | ForEach-Object { $random.Choice($chars) }) -join ''
}

function FileValue {
  param ($name, $extension, $data)
  [PSCustomObject]$data | ConvertTo-Json | Out-File "$name.$extension"
}

$username = Read-Host "Введите имя"
$password = RanCode (Get-Random -Minimum 10 -Maximum 20)
$datafile = @{
  username = $username
  password = $password
  'iflogin?' = $true
}
FileValue "File" "json" $datafile