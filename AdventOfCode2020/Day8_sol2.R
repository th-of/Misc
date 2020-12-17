dat <- readLines("Day8_1_data.txt")

steps <- matrix(nrow = length(dat), ncol = 2)

for (i in 1:length(dat)){
  steps[i,1] <- strsplit(dat[i], " ")[[1]][1]
  steps[i,2] <- as.numeric(paste(tail(strsplit(dat[i], " ")[[1]], n = -1), collapse = '', sep = ''))
}



game <- function(x){
    counter <- 1
    acc <- 0
    data <- c()
    seek <- TRUE
    while (seek){
      todo <- x[counter]
      if (todo == "acc"){
        acc <- acc + as.numeric(x[counter,2])
        counter <- counter+1
      }
      if (todo == "jmp"){
        counter <- counter + as.numeric(x[counter,2])
      }
      if (todo == "nop"){
        counter <- counter+1
      }
      if (is.element(counter, data)){
        # print(acc)
        seek <- FALSE
      }
      data <- append(data, counter)
    }
return(c(counter, acc))
}

nops <- grep("nop", steps)
jmps <- grep("jmp", steps)

## checking jmp -> nop only
i <- 1
while (i <= 227){
  steps[jmps[i]] <- "nop"
  test <- game(steps)[1]
  if (test >= 642){
    # print(test)
    print(game(steps)[2])
  }
  steps[jmps[i]] <- "jmp"
  i <- i+1
}
















