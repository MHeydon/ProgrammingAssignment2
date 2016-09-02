## These two functions create an object that stores a matrix and caches 
## its inverse matrix

## The first function, makeCacheMatrix, creates a list containing
## functions to
	## 1. set the value of the matrix
	## 2. get the value of the matrix
	## 3. set the value of the inverse matrix
	## 4. set the value of the inverse matrix

makeCacheMatrix <- function(x = matrix()) {
		m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setinv <- function(solve) m <<- solve
        getinv <- function() m
        list(set = set, get = get,
             setinv = setinv,
             getinv = getinv)
}

## This function calculates and caches the inverse of the matrix

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m <- x$getinv()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setinv(m)
        m
}
