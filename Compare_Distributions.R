library(ggplot2)
library(gridExtra)
# For reproducibility we set random generator seed as following
set.seed(1993)
# Variabe to hold Exponential distribution
sample=NULL
# We take lambda as 0.2
lambda=0.2
for(i in 1:1000){
        sample=c(sample,mean(rexp(40,lambda)))
}
# Calculate mean of the sample
sam_mean<-mean(sample)
# For the purpose of plotting, convert it into a dataframe
sample<-as.data.frame(sample)
# Plot the averaged distribution - sample
plot1<-ggplot(sample,aes(sample))+geom_histogram(aes(y=..density..),col="white",fill="skyblue",binwidth = 0.1)+geom_vline(xintercept = sam_mean, lwd=1, col="black")+geom_density(col="black",lwd=1)+labs(x="Sample Value",y=("Probability"),title="Average Exponential distribution")
set.seed(1993)
# Generate original data
orig_data<-rexp(1000,lambda)
org_mean<-mean(orig_data)
orig_data<-as.data.frame(orig_data)
# Plot original data
plot2<-ggplot(orig_data,aes(orig_data))+geom_histogram(aes(y=..density..),col="white",fill="seagreen",binwidth = 0.8)+geom_vline(xintercept = org_mean, lwd=1, col="black")+geom_density(col="black",lwd=1)+labs(x="Sample Value",y=("Probability"),title="Original Exponential distribution")
grid.arrange(plot2,plot1,ncol=2)