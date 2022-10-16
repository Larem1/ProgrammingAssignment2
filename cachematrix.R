## The first function will create methods to cache the inverse
## The second function will check if the inverse is in cache 
## if not then it will compute the inverse and store in cache

## This function will make a list of functions to be able to cache
## the inverse

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setinv <- function(inverse) inv <<- inverse
  getinv <- function() inv
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)
}


## This function will check if the inverse is stored in cache
## if not it will compute the inverse and store in cache

cacheSolve <- function(x, ...) {
  inv <- x$getinv()
  if(!is.null(inv)){
    message("getting cached data")
    return(inv)
  }
  inv <- solve(x$get())
  x$setinv(inv)
  inv
        ## Return a matrix that is the inverse of 'x'
}
