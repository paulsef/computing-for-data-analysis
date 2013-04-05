rankAll <- function(outcome, num = "best"){
  #load in the data
  outcome_data <- read.csv("./data/outcome-of-care-measures.csv", 
                           colClasses = "character")
  #identify all the states in the data set
  state_list = unique(outcome_data[,7])
  #determine the rank of hospitals in all identified states
  hospital_list <-lapply(state_list, 
                       rankhospital, outcome, num)
  #result <- data.frame(hospital = hospital_list, state = state_list)
  result <- as.data.frame(cbind(as.matrix(hospital_list),as.matrix(state_list)))
  colnames(result) <- c("hospital", "state")
  result
}