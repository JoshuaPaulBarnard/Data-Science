NormalMLE <- function(params, data){
	mLL <- -1 * sum(log(dnorm(data, mean = params[1], sd = params[2])))
	mLL  }

NegBinomMLE <- funcition(r, data) {
	mLL <- -1 * sum(log(			}

Perm <- function(n, r = n)   {
	P <- numeric(max(n))
	P <- factorial(n) / factorial(n - r)
	return(P)   }

Comb <- function(n,r)     {
	C <- factorial(n) / (factorial(r) * factorial(n - r) )
	return(C)   }

sampleMean <- function(data) {  (1/length(data))*sum(data) }

sampleVar <- function(data) { (1/(length(data)-1))*(sum((data - (1/length(data))*sum(data))^2))  }

sampleSD <- function(data) { ((1/(length(data)-1))*(sum((data - (1/length(data))*sum(data))^2)))^(1/2)  }

CI_mean <- function(data, variance = var(data), conf.level = 0.95) {
	z <- qnorm((1 - conf.level)/2, lower.tail = FALSE)
	xbar <- mean(data)
	sdx <- sqrt(variance/length(data))
	c(xbar - z * sdx, xbar + z * sdx) }

CI_var <- function(data, conf.level = 0.95) {
	df <- length(data) - 1
	chilower <- qchisq((1 - conf.level)/2, df)
	chiupper <- qchisq((1 - conf.level)/2, df, lower.tail = FALSE)
	v <- var(data)
	c(df * v/chiupper, df * v/chilower)  }

CI_sd <- function(data, conf.level = 0.95) {
	df <- length(data) - 1
	chilower <- qchisq((1 - conf.level)/2, df)
	chiupper <- qchisq((1 - conf.level)/2, df, lower.tail = FALSE)
	v <- var(data)
	c((df * v/chiupper)^(1/2), (df * v/chilower))^(1/2)  }


tTestPop   <- function(xbar, mu0, s, n, alpha = 0.05)    {
	df   <- n-1
	t    <- (xbar - mu0)/(s/sqrt(n))
	t.alpha <- qt(1-alpha, df) 
	pval <- pt(t, df)
	c(t,t.alpha,(1-pval))		}


Area <- function(r, b=0, c=0, R=2)
	{
	sq <- r*r
	rec <- r*b
	par <- r*b
	tra <- (c/2) * (r + b)
	cir <- pi * r^2
	ell <- pi * r * b
	tri <- (1/2) * r * b
	return(round(c("square"=sq, "rectangle"=rec, "parallelogram"=par, "trapezoid"=tra, "circle"=cir, "ellipse"=ell, "triangle"=tri),R))
	}


Volume <- function(r, b=0, c=0, R=2)
	{
	cub <- r^3
	rec <- r*b*c
	pri <- r*b
	pyr <- (1/3) * r * b
	con <- (1/3) * pi * r^2 * b
	sph <- (4/3) * pi * r^3
	ell <- (4/3) * pi * r * b * c
	return(round(c("Cube" = cub, "Rectangular Prism" = rec, "Irregular Prism" = pri, "Pyramidal" = pyr, "Cone" = con, "Sphere" = sph, "Ellipsoid"=ell),R))
	}


areavol <- function(r, b=0, c=0)
	{
	sq <- r*r
	rec <- r*b
	par <- r*b
	tra <- (c/2) * (r + b)
	cir <- pi * r^2
	ell <- pi * r * b
	tri <- (1/2) * r * b
	cub <- r^3
	cubarea <- 6 * r ^ 2
	rec <- r*b*c
	pri <- r*b
	pyr <- (1/3) * r * b
	con <- (1/3) * pi * r^2 * b
	sph <- (4/3) * pi * r^3
	spharea <- 4 * pi * r ^ 2
	ell <- (4/3) * pi * r * b * c
	

	return(round(c("Area - square"=sq, "Area - rectangle"=rec, "Area - parallelogram"=par, 
		"Area - trapezoid"=tra, "Area - circle"=cir, "Area - ellipse"=ell, "Area - triangle"=tri, 
		"Volume - Cube" = cub, "Area - Cube" = cubarea, "Volume - Sphere" = sph, "Area - Sphere" = spharea,
		"Volume - Rectangular Prism" = rec, "Volume - Irregular Prism" = pri, "Volume - Pyramidal" = pyr, 
		"Volume - Cone" = con,  "Volume - Ellipsoid"=ell),2))  }


fact <- function(n)
	{
	y=1
	for(i in 1:n)
		{
		y = y * i
		}
	return(y)
	}



factShow <- function(n)
	{
	y=1
	for(i in 1:n)
		{
		y = y * i
		print(y)
		}
	}


Dice <- function(n,s=6,R=2)
	{
	Ans <- sample(1:s,n,rep=T)
	return(round(c(mean(Ans),sd(Ans),table(Ans)),R))
	}


ProbDist <- function(x=0:5,n=1000,p,R=2)
	{
	Ans <- sample(x, n, prob=p, rep=T)
	return(round(c(mean(Ans), sd(Ans), table(Ans)),R))
	}


Pasc <- function(n, a=1, b=1)
	{
	Ans <- (a + b) ^ n
	return(Ans)
	}


tTests <- function(n) {
results <- numeric(n)
for(i in 1:n) {
x <- rnorm(30, 100, 6)
y <- rnorm(30, 101, 6)
results[i] <- t.test(x, y, var.equal=T)$p.value  }
return(results)  }


tTestsProb <- function(n, p=0.05) {
results <- numeric(n)
for(i in 1:n) {
x <- rnorm(30, 100, 6)
y <- rnorm(30, 101, 6)
results[i] <- t.test(x, y, var.equal=T)$p.value  }
A <- results<=p
table(A)[2]/table(A)[1]  }




