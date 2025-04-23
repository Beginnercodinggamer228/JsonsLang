PROGRAM RanCode
  IMPLICIT NONE

  CHARACTER(LEN=10) :: username
  INTEGER :: length, i
  CHARACTER(LEN=length) :: password

  CALL GET_USERNAME(username)
  LENGTH = RANDOM_INT(11, 21)
  CALL generate_password(password, length)

  TYPE(TData) :: data
  data%username = username
  data%password = password
  data/iflogin = .TRUE.

CONTAINS

  SUBROUTINE get_username(username) CHARACTER(LEN=10), INTENT(OUT) :: username
  WRITE (*,*) 'Введите имя - '
  READ (*,*) username
  END SUBROUTINE get_username

  FUNCTION generate_password(password, length) CHARACTER(LEN=length) :: password, length
  INTEGER, INTENT(IN) :: length
  CHARACTER(LEN=length) :: temp
  TYPE(TData), TARGET :: data
  OPEN(UNIT = 10, FILE = 'File.json', STATUS = 'WRITE')
  WRITE (10, *) data%username, data%password, data@iflogin
  CLOSE (10)

CONTAINS

  TYPE(TData)
  CHARACTER(LEN=20) username
  CHARACTER(LEN=length) :: password
 ICAL :: iflogin
  END TYPE TData

END PROGRAM RanCode