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
rm(dat) 
rm(a)
rm(i)
rm(passnum)

ans <- gsub("NA  ", "", passports)
rm(passports)

ans <- trimws(ans, "both", whitespace = "[\t\n\r\v\f]")

# 26 yes-no questions (a-z), one person's answers per line. Groups separated by new line.

answers <- c()
for (i in 1:length(ans)){
  stripped <- gsub(" ", "", ans[[i]])
  stripped <- strsplit(stripped[[1]], "")
  answers[i] <- length(unique(stripped[[1]]))
  
}

print(sum(answers))
