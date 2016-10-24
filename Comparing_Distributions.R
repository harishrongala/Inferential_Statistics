# For reproducibility we set random generator seed as following
set.seed(1993)
# Variabe to hold Exponential distribution
sample=NULL
lambda=0.2
for(i in 1:1000){
        sample=c(sample,mean(rexp(40,lambda)))
}
# Theoretical mean and variance
theoretical_mean=1/lambda
theoretical_var=1/lambda^2
# Mean and Variance of our simulations
sample_mean=mean(sample)
sample_var=var(sample)
# Tabulating the results
results<-matrix(c(theoretical_mean,sample_mean,theoretical_var,sample_var),byrow = T,ncol = 2)
rownames(results)<-c("Mean","Variance")
colnames(results)<-c("Theoretical","Sample")
results<-as.table(results)
print(results)


library(ggplot2)

sample<-as.data.frame(sample)
print(ggplot(sample,aes(sample))+geom_histogram(col="white",fill="grey",binwidth = 0.1)+geom_vline(xintercept = 5,colour="black",lwd=1)+labs(x="Sample Value",y=("Probability"),title="Exponential distribution"))