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

# for (n in 1:5){
#   d <- rbind(d, d)
# }


sidesum <- 0
columns <- 1
rows <- 1
while (rows < 323){
  #sidesum <- sidesum+sum(d[rows,(rows:columns)])
  if (columns > 28){
    columns <- ((columns+3) %% 31)
  } else {
      columns <- columns+3
    }
  rows <- rows+1
  sidesum <- sidesum+d[rows,columns]
  print(rows)
  print(columns)
}


print(sidesum)










