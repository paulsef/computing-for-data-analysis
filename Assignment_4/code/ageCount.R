ageCount <- function(age = NULL){
  if (is.null(age) == TRUE){
    stop("please enter an age")
  }
  
  #load the data 
  homicides <- readLines("./data/homicides.txt")
  
  #get the number of instances the regular expression gets matched
  number <- as.integer(length(grep(paste0(" ", age, " years old"), 
                                   homicides, fixed = TRUE)))
  number
  
}