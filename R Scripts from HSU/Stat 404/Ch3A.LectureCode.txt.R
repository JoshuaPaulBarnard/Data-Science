bumpus <- read.table(file=
          "http://users.humboldt.edu/rizzardi/Data.dir/BumpusManly.txt",
           header=T, skip=10)
attach(bumpus)

# Compare data using box plots
dev.new()
boxplot(tl[sv==1], tl[sv==0], names=c("alive","dead"), ylab="total length (mm)" )
title(main="Female sparrow lengths(Bumpus dataset)")

t.test( tl[sv==1], tl[sv==0], var.equal=TRUE ) 
t.test( tl[sv==1], tl[sv==0], var.equal=FALSE ) # Welch's test

# Look at sample size for each group
( n.alive <- sum(sv==1) )  # n1 
( n.dead <- sum(sv==0) )   # n2

table(sv) # shortcut to show sample size for dead and alive groups

# Look at sd for each group
( s.alive <- sd(tl[sv==1]) )
( s.dead  <- sd(tl[sv==0]) )
tapply(tl,sv,sd) # shortcut for quick inspection

# Pooled sd
s.pooled <- sqrt( ( (n.alive-1)*s.alive^2 + (n.dead-1)*s.dead^2 ) / (length(sv)-2) )
s.pooled

# 2-sample t-statistic
( mean.alive <- mean(tl[sv==1]) )
( mean.dead  <- mean(tl[sv==0]) )
(mean.alive-mean.dead) / (s.pooled * sqrt(1/n.alive + 1/n.dead) ) # t-stat

2* pt( -.993, df=47 ) # p-value for 2-tailed test
# p-value large, keep Ho of no difference

############# Tests for data ############
### Test for normality
## See wikipedia for Shapiro-Wilk test for more information
shapiro.test(tl[sv==1]) # can't reject Ho of normality
shapiro.test(tl[sv==0]) # can't reject Ho of normality

# Quantile-Quantile plots
dev.new()
qqnorm(tl[sv==1])
qqline(tl[sv==1]) # a little right skewed

dev.new()
qqnorm(tl[sv==0])
qqline(tl[sv==0]) # slightly short tails

# Examples
# t-distribution has thick (long) tails
dev.new()
x <- rt(1000, df=4)
qqnorm( x, main="t(df=4)"); qqline(x)
hist(x)

# Chi-square is skewed right
dev.new()
x <- rchisq(1000, df=3)
qqnorm(x,main="chisq(df=3)"); qqline(x)
hist(x)

# Short tailed distribution, chop off tails of Z distribution 
dev.new()
x <- rnorm(5000)
x <- x[ abs(x)<1.5 ] 
qqnorm( x], main="chopped off tails of Z distn")
qqline( x)
hist(x)

######## Test for equal variances
## Levene's Test
# library(car)  
leveneTest(tl,sv)  # Keep null hypothesis of equal variances

###################
#### Show one-dimension normal density curve
dev.new() #open new graph window
x <- seq( from=-3.5, to=3.5, by=.001 )
plot( x, dnorm(x,mean=0,sd=1), type="l" )
text(0,.1,"univariate standard normal density curve", cex=.8,srt=30)

dev.new()
plot(x,pnorm(x,mean=0,sd=1),type="l")
title("Cumulative distn function for Z")

dev.new()
probs <- seq( from=0, to=1, by=.001)
plot( qnorm(probs), probs, type="l")
title("Same graph using quantiles of Z distn")


######## Show bivariate normal density curve
# Load multivaraite normal package
#chooseCRANmirror(ind=83)
#install.packages("mvtnorm")
#library(mvtnorm)

# Draw contour and 3-d plots of bivariate density function
x.points <- seq(-3,4,length=100)
y.points <- x.points
z <- matrix(0,nrow=100,ncol=100)
mu <- c(1,1)
sigma <- matrix(c(2,1,1,1),nrow=2)
for (i in 1:100) 
{
   for (j in 1:100)
   {
     z[i,j] <- dmvnorm(c(x.points[i],y.points[j]),mean=mu,sigma=sigma)
    }
}
dev.new()
contour(x.points,y.points,z, nlevels=15)
title("contour plot of a bivariate normal density")
dev.new()
persp(x.points,y.points,z, theta=30, phi=45, shade=0.1)
title("3-d perspective of a bivariate normal density")

dev.new()
contour(x.points,y.points,z, nlevels=15)
points(rmvnorm(1000,mean=mu,sigma=sigma))





