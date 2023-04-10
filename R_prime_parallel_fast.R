library(foreach)
library(doParallel)

registerDoParallel(40)

known_primes <- 
  c(2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31)

search_space <- rep(3:99, each=4)*10 + rep(c(1,3,7,9), 97)

found_primes <- foreach(check_i= search_space, .combine=c() ) %dopar% {
  if(any((check_i %% known_primes )==0 ) return(list())
  return(list(check_i))
}

write.table(sort(c(known_primes, found_primes)), file="R_prime_parallel_fast.txt")
