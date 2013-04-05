rankall <- function(outcome, num = "best"){
  outcome_data <- read.csv("./data/outcome-of-care-measures.csv", 
                           colClasses = "character")
  state = unique(outcome_data[,7])
  hospital <-lapply(state, 
                       rankhospital, outcome, num)
  result <- as.data.frame(cbind(as.matrix(hospital),as.matrix(state)))
  colnames(result) <- c("hospital", "state")
  result
}