section .data
  prompt db 'Введите имя -0
  exp db 'json',0
  file_name db 'File.',0

section .bss
  username resb 50
  password resb 10
  datafile resq 1

section .text
  global _start

_start:
  mov eax, 5
  mov ebx, prompt
  mov ecx, username
  mov edx, 50
  call printf
  add esp, 4

  xor eax, eax
  mov ebx, 0x6c, 0x64
  xor ecx, ecx
  mov edx, password
  mov esi, eax
  mov edi, password
  call scanf

  push edx
  push esi
  pop rdi
  push username
  push eax
  pop rcx
  pop rsi
  call strcpy

  sub esp, 4
  xor eax, eax
  mov ebx, x6a, 0x61, 0x70, 0x69, 0x72, 0x65
  mov ecx, exp
  mov edx, 5
  push eax
  push ecx
  pop rdi
  push file_name
  push eax
  pop rcx
  push esp
  call printf

  sub esp, 4
  xor eax, eax
  mov ebx, 0x6c, 0x64
  mov ecx, password
  mov edx, 10
  mov esi, eax
  mov edi, password
  eax, 1
  push eax
  push ecx
  pop rdi
  push esp
  call printf

  xor eax, eax
  mov ebx, 0x6a, 0x63, 0x6f, 0x64, 0x65
  mov ecx, file_name
  add eax, 4
  push eax
  push ecx
  pop rdi
  push esp
  call printf

  xor eax, eax
  mov ebx, 0x63, 0x68, 0x6c
  mov ecx, datafile
  mov edx, 8
  push eax
  push ecx
  pop rdi
  push esp
  call scanf

  sub esp, 4
  xor eax, eax
  mov ebx, 0x61, 0x73, 0x6c, 0x62, 0x69, 0x6e
  xor ecx, ecx
  mov edx, password
  push eax
  push ecx
  pop rsi
  push esp
  call printf

  sub esp, 4
  xor eax, eax
  push 1
  push esp
  call getchar

  xor eax, eax
  mov ebx, 0x6a, 0x61, 0x73, 0x68, 0x65, 0x64
  xor ecx, ecx
  mov edx, password
  push eax
  push ecx
  pop rdi
  push esp
  call printf

_start: