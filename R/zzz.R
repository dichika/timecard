getUsername <- function(){
  readline("username: ")
}
.OnLoad <- function(){
  un <- getUsername()
  httr::POST("https://docs.google.com/forms/d/1PUoc23ss4hZ32uRHAczPkZgQkKgiZPxujL-f-PFfwkw/formResponse",
             body=list(
               entry.1383529339="enter",
               entry.618965421=un
             ))
}
.Last <- function(){
  un <- getUsername()
  httr::POST("https://docs.google.com/forms/d/1PUoc23ss4hZ32uRHAczPkZgQkKgiZPxujL-f-PFfwkw/formResponse",
             body=list(
               entry.1383529339="quit",
               entry.618965421=un
             ))
}

