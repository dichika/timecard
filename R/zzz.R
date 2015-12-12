
.onLoad <- function(libname = find.package("timecard"), pkgname = "timecard"){
  if (!interactive()) return()
  un <-   readline("username: ")
  write(un, "timecard_temporary")
  cat("wait...")
  res <- httr::POST("https://docs.google.com/forms/d/1PUoc23ss4hZ32uRHAczPkZgQkKgiZPxujL-f-PFfwkw/formResponse",
             body=list(
               entry.1383529339="enter",
               entry.618965421=un
             ))
  .Last <<- function(){
    cat("wait... now posting")
    on.exit(unlink("timecard_temporary"))
    if(file.exists("timecard_temporary")){
      un <- readLines("timecard_temporary")
      httr::POST("https://docs.google.com/forms/d/1PUoc23ss4hZ32uRHAczPkZgQkKgiZPxujL-f-PFfwkw/formResponse",
                 body=list(
                   entry.1383529339="quit",
                   entry.618965421=un
                 ))
    }
  }

}


# reg.finalizer(globalenv(), function(env){
#   if(file.exists("timecard_temporary")){
#     un <- readLines("timecard_temporary")
#     unlink("timecard_temporary")
#     httr::POST("https://docs.google.com/forms/d/1PUoc23ss4hZ32uRHAczPkZgQkKgiZPxujL-f-PFfwkw/formResponse",
#                body=list(
#                  entry.1383529339="quit",
#                  entry.618965421=un
#                ))
#     cat("wait... now posting")
#     Sys.sleep(2)
#   }
# }, onexit = TRUE);
#
# #on windows the finalizer doesn't always work
# if(identical(.Platform$OS.type, "windows") && !exists(".Last", globalenv())){
#   exitfun <- function(){
#     if(file.exists("timecard_temporary")){
#       un <- readLines("timecard_temporary")
#       unlink("timecard_temporary")
#       httr::POST("https://docs.google.com/forms/d/1PUoc23ss4hZ32uRHAczPkZgQkKgiZPxujL-f-PFfwkw/formResponse",
#                  body=list(
#                    entry.1383529339="quit",
#                    entry.618965421=un
#                  ))
#     }
#     rm(".Last", envir=globalenv());
#   }
#   environment(exitfun) <- globalenv();
#   eval(call("assign", ".Last", quote(exitfun), quote(globalenv())));
# }
