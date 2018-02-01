## Matrix caching


## create matrix for cache
## step one to to set function for cache
## othe steps include to get x where it use lexical scoping and set to assign arguments
## get inverse is to inverse the matrix and set the inversed matrix
makeCacheMatrix <- function(x = matrix())
{
 T<-NULL
 set<-function(Y)
    {
        x<<-Y
        T<<-NULL
    }
 
 
 get<- function()x
 set_inverse_matrix<-function(inverse) T<<- inverse
 get_inverse_matrix<- function() T
 
 list(set=set,get=get, set_inverse_matrix =set_inverse_matrix,get_inverse_matrix=get_inverse_matrix)
 
}


##cache will be checked if avaliable , if its null then cumpute else get from cache

cacheSolve <- function(x, ...)
  {
        
    T<-x$get_inverse_matrix()
    if(!is.null(T))
    {
      print("cached data")
      return (T)
    }
  
    getdata<-x$get()
    T<-solve(getdata,...)
    x$set_inverse_matrix(T)
    print(T)
}
