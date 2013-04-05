rankhospital <- function(state, outcome, num = "best"){
  #load the data
  outcome_data <- read.csv("./data/outcome-of-care-measures.csv", 
                           colClasses = "character")
  #subset the data by state
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
  sorted_data <- outcome_data2[order(
    as.numeric(
      as.character(
        outcome_data2[,col_num]
      )), outcome_data2[,2], na.last = NA),]
  if (num == "best"){
    rank <- 1
  }else if (num == "worst"){
    rank <- nrow(sorted_data)
  }else{
    rank = num
  }
  ranked_hospital = sorted_data[rank,2]
  ranked_hospital
}