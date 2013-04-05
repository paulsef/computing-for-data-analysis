count <- function(cause = NULL){
  
  #determine if input is valid
  cause_list <- c("asphyxiation", "blunt force", "other","shooting","stabbing",
                  "unknown")
  if ((is.null(cause))||(!(cause %in% cause_list))){
    stop("invalid cause of death")
  }
  
  #read in the data
  homicides <- readLines("./data/homicides.txt")
  
  #get the number of instances the regular expression was matched
  number <- as.integer(length(grep(paste0("Cause: ", cause), 
                        homicides, ignore.case = TRUE)))
  number
}