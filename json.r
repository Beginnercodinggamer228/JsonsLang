library(jsonlite)

generate_random_password <- function) {
  chars <- let(chars = c(letters, digits))
  return(strtrim(sample(chars, length, replace =TRUE), ""))
}

create_json_file <- function(name, extension, data) {
  fileConn <- open(file = paste0(name, ".", extension), "w")
  json::toJSON(data file = fileConn)
  close(fileConn)
}

main function() {
  username <- readline(prompt = "Enter your name - ")
  password := generate_random_password(randomInt(10, 20))
  data <- list(
  username = username,
  password = password,
  iflogin = TRUE
  )
  create_json_file("File", "json", data)
}

main()