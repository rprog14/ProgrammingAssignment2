## Matrix inversion is usually a costly computation and there may be some
## benefit to caching the inverse of a matrix rather than computing it
## repeatedly. These functions provide a way to store the matrix inversion, and
## retrieve it, without compute the result again.

## This function creates a object that can cache a matrix and its inverse.

makeCacheMatrix <- function(matrix = matrix()) {
        invMatrix <- NULL
        setMatrix <- function(y) {
                matrix <<- y
                invMatrix <<- NULL
        }
        getMatrix <- function() matrix
        setInvMatrix <- function(inv) invMatrix <<- inv
        getInvMatrix <- function() invMatrix
        list(setMatrix = setMatrix, 
             getMatrix = getMatrix,
             setInvMatrix = setInvMatrix,
             getInvMatrix = getInvMatrix)
}


## This function computes the inverse of a matrix returned by `makeCacheMatrix`
## above. If the inverse has already been calculated (and the matrix has not
## changed), then `cacheSolve` retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inv <- x$getInvMatrix()
        if(!is.null(inv)) {
                return(inv)
        }
        data <- x$getMatrix()
        inv <- solve(data)
        x$setInvMatrix(inv)
        inv
}
