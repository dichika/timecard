sushi <- function(num_loop=3, interval=0.5){
  for(i in seq(num_loop)){
    Sys.sleep(interval)
    cat("\U0001f363")
    flush.console()
  }
}
loadTimecard <- function(){
require(timecard)
cat("Push Enter key till a cursor advent...")
}

.onLoad <- function(libname = find.package("timecard"), pkgname = "timecard"){
  if (!interactive()) return()
  un <-   readline("username: ")
  write(un, "timecard_temporary")
  sushi(1)
  res <- httr::POST("https://docs.google.com/forms/d/1PUoc23ss4hZ32uRHAczPkZgQkKgiZPxujL-f-PFfwkw/formResponse",
             body=list(
               entry.1383529339="enter",
               entry.618965421=un
             ))
  sushi(2, 0.5)
  .Last <<- function(){
    cat("wait... now posting")
    sushi(1)
    on.exit(unlink("timecard_temporary"))
    if(file.exists("timecard_temporary")){
      un <- readLines("timecard_temporary")
      httr::POST("https://docs.google.com/forms/d/1PUoc23ss4hZ32uRHAczPkZgQkKgiZPxujL-f-PFfwkw/formResponse",
                 body=list(
                   entry.1383529339="quit",
                   entry.618965421=un
                 ))
      sushi(2, 0.5)
    }
  }
}
