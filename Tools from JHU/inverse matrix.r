

#  Function to find the inverse of a matrix
inverseMatrix <- function(input_matrix, given_Exponential = -1, given_Tolerance = NULL) {
  input_matrix <- as.matrix(input_matrix)
  matrix_dimensions <- dim(input_matrix)
  if(is.null(given_Tolerance)){
    given_Tolerance=min(1e-7, .Machine$double.eps*max(matrix_dimensions)*max(input_matrix))
  }
  if(matrix_dimensions[1] >= matrix_dimensions[2]) { 
    svd_temp <- svd(input_matrix)
    abolve_Tolerance <- which(svd_temp$d > given_Tolerance)
    output_matrix <- t( svd_temp$u[,abolve_Tolerance] %*% diag(svd_temp$d[abolve_Tolerance] ^ given_Exponential, nrow=length(abolve_Tolerance)) %*% t(svd_temp$v[,abolve_Tolerance]) )
  }
  if(matrix_dimensions[1] < matrix_dimensions[2]) { 
    svd_temp <- svd(t(input_matrix))
    abolve_Tolerance <- which(svd_temp$d > given_Tolerance)
    output_matrix <- svd_temp$u[,abolve_Tolerance]%*%diag(svd_temp$d[abolve_Tolerance]^given_Exponential, nrow=length(abolve_Tolerance))%*%t(svd_temp$v[,abolve_Tolerance])
  }
  return(output_matrix)
}
