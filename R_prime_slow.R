library(foreach)
registerDoSEQ()

known_primes <- 
  c(2, 3, 5, 7)

search_space <- 10:99

found_primes <- foreach(check_i= search_space, .combine=c ) %do% {
  Sys.sleep(1)
  if(any((check_i %% known_primes )==0 ) ) return(numeric())
  cat(sprintf("Found %d to be a prime!\n", check_i ) )
  return(c(check_i))
}

write.table(sort(c(known_primes, found_primes)), file="R_prime_slow.txt", 
            row.names = F,col.names = F)
