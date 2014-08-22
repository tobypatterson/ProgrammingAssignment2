## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(matrix = matrix()) {
  inverse  <- NULL
  set  <- function(m){
    matrix <<- m
    inverse <<- NULL 
  }
  get  <- function() matrix
  setInverse  <- function(inverse) inverse  <<- inverse
  getInverse  <- function() inverse
  list(set= set, get = get, 
       setInverse = setInverse, 
       getInverse = getInverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
  
  # Error checking - make sure we can are working with corrected data type
  if (FALSE) {
    
  }
  # Attempt to fetch the cached version first
  previous  <- x$getInverse()
  if (!is.null(previous)){
    message("Found cached matrix")
    return(previous)
  }
  
  # Nope - solve and cache
  data  <- x$get()
  solved  <- solve(data, ...)
  x$setInverse(solved)
  
  # Return our data
  return(solved)
}
