outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
heart_attack = as.numeric(outcome[, 11])
heart_failure = as.numeric(outcome[,17])
pneumonia = as.numeric(outcome[,23])
mean_attack = mean(heart_attack, na.rm = TRUE)
mean_failure = mean(heart_failure, na.rm = TRUE)
mean_pneumonia =  mean(pneumonia, na.rm = TRUE)
par(mfrow = c(3,1), mar = c(4,3,3,2))
hist(heart_attack, 
     main = substitute("Heat Attack " * bar(X) == k, list(k = mean_attack)),
     xlab = "30-day Death Rate", 
     xlim = range(heart_attack, heart_failure, pneumonia, 
                  na.rm = TRUE),
     prob = TRUE
     )
abline(v = mean(heart_attack, na.rm = TRUE))
lines(density(heart_attack, na.rm = TRUE))

hist(heart_failure, main = "Heart Failure",
     xlab = "30-day Death Rate", 
     xlim = range(heart_attack, heart_failure, pneumonia, 
                  na.rm = TRUE))
abline(v = mean(heart_failure, na.rm = TRUE, col = green))

hist(pneumonia, main = "Pneumonia",
     xlab = "30-day Death Rate",
     xlim = range(pneumonia, heart_failure, pneumonia, 
                  na.rm = TRUE))
abline(v = mean(pneumonia, na.rm = TRUE, col = green))