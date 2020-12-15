dat <- readLines("Day3_1_data.txt")


a <- gsub("\\.", 0, dat[1])
b <- gsub("\\#", 1, a)
c <- as.numeric(strsplit(b, "")[[1]][1:31])
d <- c

for (k in 2:323){
  a <- gsub("\\.", 0, dat[k])
  b <- gsub("\\#", 1, a)
  c <- as.numeric(strsplit(b, "")[[1]][1:31])
  d <- rbind(d, c)
}

sidesum <- 0
columns <- 1
rows <- 1
result <- c()

rights <- c(1, 3, 5, 7, 1)
lefts <- c(1, 1, 1, 1, 2)

for (o in 1:5){
  sidesum <- 0
  columns <- 1
  rows <- 1
  while (rows < 323){
    if (columns > (31-rights[o])){
      columns <- ((columns+(rights[o])) %% 31)
    } else {
      columns <- columns+rights[o]
    }
    rows <- rows+lefts[o]
    sidesum <- sidesum+d[rows,columns]
  }
  result[o] <- sidesum
}



print(prod(result))










