#lang racket

(import (random)
  (string)
 (json))

(define (ran-code length)
  (string -join (map random-string (range 0 length)) ""))

(define (file-value name exp data)
  (with-output-to-file (name "." exp) (lambda ()
  (json-write! data)))

(define username
  (define user-input (command-line-argument #f))
  (if (not (string? user-input))
  (error "Input must be a string!")
  user-input))

(define password (ran-code (+ (random 10) 10)))

(define datafile
  (list 'username username
  'password password
  'iflogin? #t))

(file-value "File" "json" datafile)