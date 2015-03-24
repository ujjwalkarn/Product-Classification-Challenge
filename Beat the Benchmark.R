#install and load the neural network package
install.packages("nnet")
library(nnet)

#set the seed so that the results are reproducible
set.seed(342)
train<-read.csv("train.csv")
test<-read.csv("test.csv")
fit<-nnet(target ~ ., train[,-1], size = 3, rang = 0.1, decay = 5e-4, maxit = 500) 
predicted<-as.data.frame(predict(fit,test[,-1],type="raw"))  
id<-test[,1]
output<-cbind(id,predicted) 
write.csv(output,"submission.csv",row.names=FALSE)
