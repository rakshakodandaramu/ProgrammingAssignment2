## Matrix caching


## create matrix for cache

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


##Inverse coomputing function

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
