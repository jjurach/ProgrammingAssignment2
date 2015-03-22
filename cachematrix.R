## Cache a matrix inverse
##
## Usage:
##   cacheMatrix <- makeCacheMatrix(matrix)
##   solution <- cacheSolve(cacheMatrix) 

## makeCacheMatrix() returns an instance with a pair of getters and setters
## for access to a matrix and its calculated inverse.

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setCached <- function(cached) m <<- cached
    getCached <- function() m
    list(set = set, get = get,
        setCached = setCached,
        getCached = getCached)
}

## cacheSolve() returns the inverse of the matrix contained
## within the passed cacheMatrix instance.

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    solution <- x$getCached()
    if(!is.null(solution)) {
        message("getting cached data")
        return(solution)
    }
    data <- x$get()
    solution <- solve(data, ...)

    # alternative inverse matrix solution:
    #library(MASS)
    #solution <- ginv(data, ...)

    x$setCached(solution)
    solution
}

