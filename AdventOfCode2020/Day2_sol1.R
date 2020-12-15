a <- readLines("Day2_1_data.txt")

policy <- c()
pass <- c()

for (i in 1:1000){
  policy[i] <- strsplit(a[i], ":")[[1]][1]
  pass[i] <- strsplit(a[i], ":")[[1]][2]
}
policy <- gsub("-", " ", policy)

a <- 0
for (i in 1:1000){
  if (as.numeric(strsplit(policy[i], " ")[[1]][1]) <=  sum(strsplit(policy[i], " ")[[1]][3] == strsplit(pass[i], "")[[1]])){
    if (as.numeric(strsplit(policy[i], " ")[[1]][2]) >=  sum(strsplit(policy[i], " ")[[1]][3] == strsplit(pass[i], "")[[1]])){
      a = a+1
      }
  }
}
