
source("cachematrix.R")

dumpMatrix <- function(x, name="") {
  print(name)
  print(x)
}

#matrix <- matrix(1:4, nrow=2)
#matrix <- matrix(-3:5, nrow=3)
ncol <- 10 
matrix <- matrix(rexp(ncol*ncol, rate=1), ncol=ncol)

cacheMatrix <- makeCacheMatrix(matrix)
#cacheMatrix$set(matrix)

solved <- cacheSolve(cacheMatrix)
solved <- cacheSolve(cacheMatrix)
solved <- cacheSolve(cacheMatrix)
solved2 <- solve(matrix)

dumpMatrix(matrix, 'orig')
dumpMatrix(solved, 'solved')
dumpMatrix(solved - solved2, 'should zero')

