best1 <- function(state, outcome){
  outcome_data <- read.csv("./data/outcome-of-care-measures.csv", 
                           colClasses = "character")
  outcome_data2 <- subset(outcome_data, outcome_data[, 7] == state)
  if (nrow(outcome_data2) == 0){
    stop("invalid state")
      #"Error in Best (" * state * "," * outcome * ") invalid state")
  }
  #hosmat <- data.frame(outcome = c("heart attack", "heart failure", "pneumonia"), 
  #                    index = c(11,17,23))
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
      #"Error in Best (" * state * "," * outcome * ") invalid outcome")
  }
  #numeric_outcome = as.numeric(outcome_data2[,col_num])
  sorted_data <- outcome_data2[order(
    as.numeric(
      as.character(
        outcome_data2[,col_num]
      )), outcome_data2[,2], na.last = NA),]
  print(sorted_data[1:3,c(2, col_num)])
  winner = sorted_data[1,2]
  winner
  
  
}
