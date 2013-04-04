best <- function(state, outcome){
  outcome_data <- read.csv("outcome-of-care-measures.csv", 
                           colClasses = "character")
  outcome_data2 <- subset(outcome_data, outcome_data[, 7] == state)
  if (nrow(outcome_data2) == 0){
    stop("invalid state")
  }
  
  if (outcome == "heart attack"){
    col_num = 11
  }
  else if (outcome == "heart failure"){
    col_num = 17
  }
  else if (outcome == "pneumonia"){
    col_num = 23
  }
  else{
    stop("invalid outcome")
  }
  sorted_data <- outcome_data2[order(
    as.numeric(
      as.character(
        outcome_data2[,col_num]
      )), outcome_data2[,2], na.last = NA),]
  winner = sorted_data[1,2]
  winner
  
  
}
