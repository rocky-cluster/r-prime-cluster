library(foreach)
registerDoSeq()

known_primes <- 
  c(2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31)

search_space <- 34:999

found_primes <- foreach(check_i= search_space, .combine=c() ) %do% {
  if(any((check_i %% known_primes )==0 ) return(list())
  return(list(check_i))
}

write.table(sort(c(known_primes, found_primes)), file="R_prime_serial.txt")
