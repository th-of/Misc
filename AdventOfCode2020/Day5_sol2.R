dat <- readLines("Day5_1_data.txt")
rows <- c()
for (i in 1:length(dat)){
  rows[i] <- strsplit(dat[i], "")
}

stringtopos <- function(code) {
  letters <- strsplit(code, "")[[1]]
  pos <- seq(0, 127, 1)
  pos1 <- seq(0, 7, 1)
  for (i in 1:7){
    if (letters[i] == "B"){
      pos <- pos[((length(pos)/2)+1):(length(pos))]
    } else {
      pos <- pos[1:(length(pos)/2)]
    }
  }
  for (n in 8:10){
    if (letters[n] == "R"){
      pos1 <- pos1[((length(pos1)/2)+1):(length(pos1))]
    } else {
      pos1 <- pos1[1:(length(pos1)/2)]
    }
  }
  return(c(pos, pos1))
}

test <- lapply(dat, stringtopos)

results <- c()
for (a in 1:length(test)){
  results[a] <- test[[a]][1]
}

myticket <- c()
for (l in 10:112){
  if (length(which(results == l)) < 8){
    myticket <- append(l, myticket)
  }
}

conv <- c()

for (o in 1:817){
  conv <- rbind(conv, test[[o]])
}

conv2 <- conv[which(conv == 82),]
conv3 <- sort(conv2)
r <- 1
for (p in 0:7){
  if (p != conv3[r]){
    print(conv3[8]*8 + p)
    break
  }
  r <- r+1
}
