## The following codes create two functions which are makeCachematrix and
## cacheSolve. In general, they are used to store the values of a matrix, find
## its inverse and cache this value. If the function is prompt again with the 
## same matrix, the cached value is recovered and returned


## This function sets the cache value to NULL and provides the methods which 
## will be used by the second function

makeCacheMatrix <- function(x = matrix()) 
{
    inv <- NULL
    
    get <- function()
    {
        x    
    }
    
    set_inv <- function(inverse)
    {
        inv <<- inverse
    }
    
    get_inv <- function()
    {
        inv      
    }           
    
    list(get = get, set_inv = set_inv, get_inv = get_inv)
}


## This function identifies the matrix which will be inverted. If the inverse
## object is not NULL, than the inversion has already been calculated and a 
## cached value is returned. Else, this function makes the inversion of the 
## matrix and stores it in a variable that may be used by the previous function

cacheSolve <- function(x, ...) 
{
    inverse <- x$get_inv()
    if(!is.null(inverse))
    {
        message("getting cached data")
        return(inverse)
    }
    
    matrix <- x$get()
    inverse <- solve(matrix)
    x$set_inv(inverse)
    inverse
}
