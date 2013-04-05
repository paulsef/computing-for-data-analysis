outcome <- read.csv("outcome-of-care-measures.csv", 
                    colClasses = "character")
heart_attack = as.numeric(outcome[, 11])
table3 = as.data.frame(table(outcome$State))
subset_table = subset(table3, Freq > 20)
subset_list = subset_table[,1]
outcome2 <- subset(outcome, State %in% subset_list)

death = as.numeric(outcome2[,11])
state = outcome2[,7]

split_data <- split(outcome2, outcome2$State)
state_median <- sapply(split_data, 
                     function(x) median(as.numeric(x[,11]), 
                     na.rm = TRUE))
sort_median <- sort(state_median)
sort_median_frame <- as.data.frame(sort_median)
sort_state_list <- row.names(sort_median_frame)

full_sort_list = c()
for i in sort_state_list{
  for j in outcome2[,State]{
    if (i == j){
      paste0(full_sort_list, as.numeric(outcome[j,11]))
      
    }
  }
}
  }
}
}

par(las = 2)
death <- as.numeric(outcome2[,11])
state <- outcome2$State
boxplot(death ~ state, main = "Heart Attack 30-Day Death Rate by State",
        ylab = "30-Day Death Rate")
