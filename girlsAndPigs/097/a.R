in_vec <- inp %>% strsplit("\n") %>% unlist() %>% `[`(-1)
count_combinations <- function(total_legs, total_breasts) {
  num_combinations <- 0
  for (num_girls in 1:(total_legs/2 - 1)) {
    num_pigs <- (total_legs - (num_girls * 2))/4
    num_pig_breasts <- total_breasts - (num_girls * 2)
    if (num_pigs %% 1 == 0 && num_pigs > 0 && num_pig_breasts >= 0 && num_pig_breasts %% num_pigs == 0 && (num_pig_breasts/num_pigs) %% 2 == 0) {
      num_combinations <- num_combinations + 1
    }
  }
  return(num_combinations)
}

ans <- sapply(1:length(in_vec), function(i) {
  s <- in_vec[i] %>% strsplit(" ") %>% unlist() %>% as.numeric()
  count_combinations(s[1],s[2])
})
cat(ans)
