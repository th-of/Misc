dat <- readLines("Day6_1_data.txt")

#number of passports:
passnum <- sum(dat == "")+2
passports <- c()
a <- 1

for (i in 1:length(dat)){
  if (dat[i] == ""){
    a <- a+1
  }
  passports[a] <- paste(passports[a], dat[i])
}
# rm(dat) 
# rm(a)
# rm(i)
# rm(passnum)

ans <- gsub("NA  ", "", passports)
# rm(passports)

ans <- trimws(ans, "both", whitespace = "[\t\n\r\v\f]")

# 26 yes-no questions (a-z), one person's answers per line. Groups separated by new line.
ans[1] <- paste0(strsplit(ans[1], " ")[[1]][2], " ", strsplit(ans[1], " ")[[1]][3])

answers <- c()
ans2 <- 0
for (i in 1:length(ans)){
  stripped <- gsub(" ", "", ans[[i]])
  stripped <- strsplit(stripped[[1]], "")[[1]]
  stripped_uniq <- unique(stripped)
  for (a in 1:length(stripped_uniq)){
    if (length(strsplit(ans[i], " ")[[1]]) == length(which(stripped_uniq[a] == stripped))){
      ans2 <- ans2+1
    }
  }
}

print(ans2)
