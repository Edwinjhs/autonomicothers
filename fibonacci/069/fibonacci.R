inp <- "17
9004 8026 6677 2929 2327 8102 8550 6902 5778 6975 4275 2251 2475 9452 8327 4053 9075"

in_vec <- unlist(strsplit(inp, "\n"))[-1][1]
in_vec <- as.numeric(unlist(strsplit(in_vec, " ")))
fib <- function(m) {
  a = gmp::as.bigz(0)
  b = 1
  x = 1
  n = 2
  while (x %% m != 0) {
    x = a + b
    a = b
    b = x
    print(x)
    n = n + 1
  }
  return(n - 1)
}

ans <- sapply(1:length(in_vec), function(i) {
  fib(in_vec[i])
})

cat(ans)
