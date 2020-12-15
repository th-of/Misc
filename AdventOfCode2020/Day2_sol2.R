a <- readLines("Day2_1_data.txt")

policy <- c()
pass <- c()

for (i in 1:1000){
  policy[i] <- strsplit(a[i], ":")[[1]][1]
  pass[i] <- strsplit(a[i], ":")[[1]][2]
}
policy <- gsub("-", " ", policy)
pass <- gsub(" ", "", pass)

a <- c()
b <- c()

for (k in 1:1000){
  a[k] <- 0
  b[k] <- 0
  letter <- strsplit(policy[k], " ")[[1]][3]
  p1 <- as.numeric(strsplit(policy[k], " ")[[1]][1])
  p2 <- as.numeric(strsplit(policy[k], " ")[[1]][2])
  if (letter == strsplit(pass[k], "")[[1]][p1]){
    a[k] <- 1
  }
  if (letter == strsplit(pass[k], "")[[1]][p2]){
    b[k] <- 1
  }
}


c <- a+b

print(sum(grepl(1, c)))