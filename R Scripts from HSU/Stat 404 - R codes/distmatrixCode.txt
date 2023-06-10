distmatrix <- function(covariates,group,type="Mahalanobis")
{
  ########################################
  ##Function to compute a matrix of distances between group means.
  ##
  ####Arguments
  # covariates: data.frame consisting of n observations of p continuous variables
  # group:  an n-vector "group" containing designations of the levels (at least 2) 
  #         of the factor being tested.
  # type:   c("Mahalanobis", "Penrose", "Euclidean")   
  #
  #### Details
  #  Usually, "group" will be a column of the data.frame whose continuous variables are contained
  #  in "covariates". Default distance is Mahalanobis.  Data are standardized for Euclidean distance. 
  #  See section 5.3 of Manly's 3rd ed."Multivariate Statistical Methods"
  #
  #### Values
  #  Returns a symmetric p-by-p matrix of the distances between each group.  The Mahalanobis distance
  #  returned is actually the "squared" Mahalanobis (D^2) distance. 
  #  D: matrix of distances
  #  C: pooled covariance matrix
  #  means: means for each variable within each group
  ##########################################
  
  m <- nlevels(group)  #Determine the number of levels of the factor
  size <- dim(as.matrix(covariates)) #Dimensions of data matrix
  n <- size[1] #Number of observations
  p <- size[2] #Number of variables
  grpsize <- by(covariates,group,dim) #group sample sizes
  if (type=="Euclidean") covariates <- scale(covariates)  # standardize the data (centered and scaled)
  means <- aggregate(covariates,by=list(group), mean)  #group mean vectors
  
  covs <- by(covariates,group,cov) 
  
  C <- diag(0,p) #pxp matrix full of 0 entries
  for (i in 1:m) C <- C+(grpsize[[i]][1]-1)*covs[[i]] #weighted sum of covariance matrices
  C <- C/(n-m)  #Pooled covariance matrix (page 50, Manly)
  
  if (type == "Mahalanobis")  #Default is Mahalanobis distance--compute pooled C  
    A <- solve(C)  #Inverse of C
  
  if (type == "Penrose")  #use 1/p * diagonal matrix of variances instead of Cinv
    A <- (1/p)*diag(1/diag(C))
  
  if (type == "Euclidean")  #use I instead of Cinv
    A <- diag(1,p)
  
  
  D <- matrix(0,m,m)  # m x m matrix full of 0 entries
  meansdata <- data.matrix(means[,-1])
  for (i in 2:m)
  { 
    for (j in 1:(i-1))  #fill in diagonal and lower diagonal of D
    {
      D[i,j] <- t(meansdata[i,]-meansdata[j,]) %*% A %*% ( meansdata[i,]-meansdata[j,] )
    }
  }
  for (i in 1:(m-1))
  {
    for (j in (i+1):m)
    {
      D[i,j] <- D[j,i]  #Fill in upper triangle of symmetric matrix D
    }
  }
  if (type=="Euclidean") D <- sqrt(D)
  D <- as.data.frame(D)  
  names(D) <- levels(group)   #attach names to columns
  rownames(D) <- levels(group)  #attach names to rows
  return(list(D=D,C=C,means=means))
}

skulls <- read.table(file=
                       "http://users.humboldt.edu/rizzardi/Data.dir/skull.txt",
                     header=T, skip=16)
skull.penrose <- distmatrix(skulls[,1:4], as.factor(skulls[,5]), type="Penrose")
skull.mahal <- distmatrix(skulls[,1:4], as.factor(skulls[,5]))
skull.euclidean <- distmatrix(skulls[,1:4], as.factor(skulls[,5]), type="Euclidean")

