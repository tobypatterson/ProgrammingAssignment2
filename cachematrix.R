## 
# Class: R Programming (rprog-006)
# Project: #2, Programming Assignment 2 (peer assessment): Lexical Scoping
# URL: https://class.coursera.org/rprog-006/human_grading/view/courses/972578/assessments/3/submissions
# Author: Toby Patterson
##

# makeCacheMatrix
#
# Create a list with special accessor functions used later by the cacheSolve()
# 
# @param  matrix Matrix to store for later conversion
#
# @return List containing values that are actually gets/sets
#
# @see    cacheSolve()
# 
# Note: original source from makeVector
makeCacheMatrix <- function(matrix = matrix()) {
  inverse  <- NULL
  set  <- function(m){
    matrix <<- m
    inverse <<- NULL 
  }
  get  <- function() matrix
  setInverse  <- function(i) inverse  <<- i
  getInverse  <- function() inverse
  
  # Build and return a list of our accessor functions
  list(set= set, get = get, 
       setInverse = setInverse, 
       getInverse = getInverse)
}


# cacheSolve()
# 
# Solve a matrix contained within the special list generated by makeCacheMatrix
#
# @param  x    A list generated by the makeCacheMatrix function
# @param  ...  Additional options to supply to solve()
#
# @return Matrix
#
# @see    makeCacheMatrix()
cacheSolve <- function(x, ...) {
  
  # Error checking - make sure we can are working with corrected data type
  if(class(x) != 'list') { 
    warning("Need to pass an object from makeCacheMatrix()")
    return()
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
  if(class(solved) != 'matrix') { 
    warning("Cannot solve the matrix")
    return();
  }
  
  x$setInverse(solved)
  
  # Return our data
  return(solved)
}
