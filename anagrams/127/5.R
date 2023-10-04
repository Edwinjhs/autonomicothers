dict <- read_lines("words.txt")
# w <- sapply(pm, function)
in_vec <- (unlist(strsplit(inp, "\n")))[-1]
ans <- sapply(1:length(in_vec), function(i) {
  s <- unlist(strsplit(in_vec[i],""))
  pm <- unique(permn(s))
  pmm <- lapply(1:length(pm), function(wl){
    ww <- paste0(pm[[wl]],collapse = "")
    if(ww %in% dict){
      cat(ww,"match:",match(ww,dict),"wl:",wl,".\n")
      return(ww)
    }
  }) %>% unlist() %>% length()
  
})
cat(ans-1)
