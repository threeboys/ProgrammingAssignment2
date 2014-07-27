## test_cachematrix.R
##   - Test code for cachematrix.R (makeCacheMatrix(), cacheSolve())

getwd()
setwd("./PA2")

############## test code #################

source("cachematrix.R")

m = rbind(c(1, -1/4), c(-1/4, 1))  

matrix <- makeCacheMatrix(m)

matrix$get()
matrix$getInverse()

cacheSolve(matrix)
matrix$getInverse()
matrix$get() %*% matrix$getInverse()


############## End of Document ################