best2 <- function(state, outcome){
  #load in the data
  outcome_data <- read.csv("./data/outcome-of-care-measures.csv", 
                           colClasses = "character")
  #subset by state
  outcome_data2 <- subset(outcome_data, outcome_data[, 7] == state)
  if (nrow(outcome_data2) == 0){
    stop("invalid state")
  }
  
  #identify outcome
  hosmat <- data.frame(problem = c("heart attack", "heart failure", "pneumonia"), 
                       index = c(11,17,23))
  if (outcome %in% hosmat[,"problem"]){
    col_num = hosmat[match(outcome, hosmat[,"problem"]),"index"]
  }
  else{
    stop("invalid outcome")
  }
  #identify the best
  sorted_data <- outcome_data2[order(
    as.numeric(
      as.character(
        outcome_data2[,col_num]
      )), outcome_data2[,2], na.last = NA),]
  winner = sorted_data[1,2]
  winner
  
  
}
