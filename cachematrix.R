## This pair of functions is aimed to cache the inverse of a matrix instead of computing it repeadly.


## In this function, we create a special list in which we can: setting values in the matrix, getting values in the matrix, setting values 
## in the inverse matrix and getting values in the inverse matrix.
makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y){
    x <<- y
    m <<- NULL
  }
  get <-function()x
  setin <- function(inverse)m <<- inverse
  getin <- function()m
  list(set = set, get = get, setin = setin, getin = getin)
}


## In this function, the inverse matrix is generated. It will first check if the inverse matrix has already been calculated. If so, it gets
## the inverse matrix from the cache. Otherwise it will calculate the inverse matrix and set it in the cache.
cacheSolve <- function(x, ...) {
  m <- x$getin()
  if(!is.null(m)){
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setin(m)
  m
        ## Return a matrix that is the inverse of 'x'
}
