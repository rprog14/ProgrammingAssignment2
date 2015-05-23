## This is a test script to test 'cachematrix.R'

source("cachematrix.R")

# create a random matrix (hopefully invertible)
mat = matrix(sample(1000, 10000, TRUE), 100, 100)

# solving the inverse matrix without caching the result
startNoCache <- proc.time()
for (i in 1:1000){
        solve(mat)
}
finalNoCache <- proc.time() - startNoCache

# solving the inverse matrix caching the result
cache = makeCacheMatrix(mat)
startCache <- proc.time()
for (i in 1:1000){
        cacheSolve(cache)
}
finalCache <- proc.time() - startCache

# print the results
if (all.equal(solve(mat), cacheSolve(cache))) {
        message("Execution time Without cache:")
        print(finalNoCache)
        message("Execution time with cache:")
        print(finalCache)
} else {
        message("Error: inverse matrix are different!")
}
