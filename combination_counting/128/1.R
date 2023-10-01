in_vec <- (unlist(strsplit(inp, "\n")))[-1]

ans <- sapply(1:length(in_vec), function(i) {
  s <- as.numeric(unlist(strsplit(in_vec[i]," ")))
  cm <- factorial(s[1])/((factorial(s[2]))* factorial(s[1]-s[2]))
})

cat(ans)
