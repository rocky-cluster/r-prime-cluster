library(foreach)
library(doParallel)

registerDoParallel(40)

known_primes <- 
  c(2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31)

search_space <- 34:999

found_primes <- foreach(check_i= search_space, .combine=c ) %dopar% {
  if(any((check_i %% known_primes )==0 ) ) return(integer())
  return(c(check_i))
}

# write.table(sort(c(known_primes, found_primes)), file="R_prime_parallel.txt", 
#             row.names = F,col.names = F)


# primes less than 10^6
known_primes <- c(known_primes, found_primes)
search_space_3 <- rep(0:99, each=4)*10 + rep(c(1,3,7,9), 100)

found_primes_6 <- foreach(search_i= icount(1e3), .combine=c ) %dopar% {
  
  res <- foreach(check_i= search_i*1e3 +search_space_3, .combine=c ) %do% {
    if(any((check_i %% known_primes )==0 ) ) return(integer())
    return(c(check_i))
  }
  return(res)
}

write.table(sort(c(known_primes, found_primes_6)), file="R_prime_parallel_6.txt", 
            row.names = F,col.names = F)
