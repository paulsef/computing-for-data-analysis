count <- function(cause = NULL){
  homicides <- readLines("homicides.txt")
  if (!is.null(cause) &&
      cause != "asphyxiation" &&
      cause != "blunt force" &&
      cause != "other" &&
      cause != "shooting" &&
      cause != "stabbing" &&
      cause != "unknown"){
    stop("not a valid cause of death")
  }
  pos_1 <- substr(cause, 1, 1)
  pos_2 <- substr(cause, 2, nchar(cause))
  #print(paste0("Cause: ", "[",toupper(pos_1), pos_1, "]", pos_2))
  number <- length(grep(
    paste0("Cause: ", "[",toupper(pos_1), pos_1, "]", pos_2), 
    homicides, ignore.case = TRUE))
  number
}