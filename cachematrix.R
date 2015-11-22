## After an hour of attempts, I've finally opened this file into R. So that's nice
## calculate the inverse of a matrix, for Neo, but if you've done that, do it once more.


makeCacheMatrix <- function(x=matrix()) {
  m <- NULL
  set <- function(y) {
    x<<-y
    m<<-NULL
  }
  get <- function() x
  setinverse<- function(inverse) m <<-inverse
  getinverse <- function() m
  list(set=set, get=get,
       setinverse=setinverse,
       getinverse=getinverse)
}


cacheSolve <- function(x,... ) {
  m <- x$getinverse()
  if (!is.null(m)) {
    message("getting cached inverse")
    return(m)
  } else {
    m <- solve(x$get())
    x$setinverse(m)
    return(m)
  }
}
