library(readr)
library(caret)
library(pROC)
setwd("~/Desktop/artificialecon")
ny_binary <- read_csv("./clean/ny_binary.csv")
(prop.table(table(ny_binary$HIT)))
ny_binary <- data.matrix(ny_binary, rownames.force = NA)
outcomeName <- 'HIT'

ny_binary <- ny_binary[, c(5,7,8,9)]
#(predictorsNames <- names(ny_binary)[names(ny_binary) != outcomeName])
X <- ny_binary[,c(1,2,3)]
ny_binary$HIT <- factor(ifelse(ny_binary$HIT==0, "Zero", "One"))
Y <- ny_binary[, c(4)]



objControl <- trainControl(method='cv', number=3, returnResamp='none', summaryFunction = twoClassSummary, classProbs = TRUE)
objModel <- train(X, make.names(Y), 
                  method='gbm', 
                  trControl=objControl,  
                  metric = "ROC",
                  preProc = c("center", "scale"))
summary(objModel)
