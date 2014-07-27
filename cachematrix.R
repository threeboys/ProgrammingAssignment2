########################################################################
## File Name   : cachematrix.R
## Writer      : Dongwoo Lee (leewow9@naver.com)
## Last Update : 2014.07.27
## Desciption   
##    - Matrix inversion is usually a costly computation and there may be some 
##      benefit to caching the inverse of a matrix rather than computing it repeatedly 
##      (there are also alternatives to matrix inversion that we will not discuss here). 
##      There are two functions that cache the inverse of a matrix.
##
## Functions    
##    1) makeCacheMatrix - This function creates a special "matrix" object that can cache 
##                         its inverse.
##    2) cacheSolve -  This function computes the inverse of the special "matrix" returned 
##                     by makeCacheMatrix above. If the inverse has already been calculated 
##                     (and the matrix has not changed), then cacheSolve should retrieve 
##                     the inverse from the cache.
########################################################################

## makeCacheMatrix
##   - This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
  
  # init 
  inv <- NULL
  
  # set : Set the matrix variable
  set <- function(matrix) {
    m   <<- matrix
    inv <<- NULL
  }
  
  # get : Get the matrix variable
  get <- function() {
    m
  }
  
  # setInverse : Set the inverse of matrix
  setInverse <- function(inverseMatrix) {
    inv <<- inverseMatrix
  }
  
  # getInverse : Get the inverse of matrix
  getInverse <- function() {
    inv
  }
  
  # Return value : a list of the methods
  list (set = set, get = get,
        setInverse = setInverse, getInverse = getInverse)
}

## cacheSolve 
##   -  This function computes the inverse of the special "matrix" returned 
##      by makeCacheMatrix above. If the inverse has already been calculated 
##      (and the matrix has not changed), then cacheSolve should retrieve 
##      the inverse from the cache.

cacheSolve <- function(x, ...) {
  
  ## 1. Check the inverse of matrix has already been calculated
  
  # Get the inverse of matrix 
  invMatrix <- x$getInverse()
  
  # #f its already set, just return the inverse of matrix
  if (!is.null(invMatrix)) {
    message ("getting cached data")
    return (invMatrix)
  }
  
  ## 2. Calculate the inverse of matrix and setInverse
  
  # Get the new matrix of input object
  matrix <- x$get()
  
  # Calculate the inverse of matrix
  invMatrix <- solve(matrix, ...)
  
  # Set the new inverse matrix
  x$setInverse(invMatrix)
  
  ## 3. Return a matrix that is the inverse of 'x'
  invMatrix        
}

############ End of Document ############