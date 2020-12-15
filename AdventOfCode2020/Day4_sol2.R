dat <- readLines("Day4_1_data.txt")

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

#Cleanup
passports <- gsub("NA  ", "", passports)
passports <- trimws(passports, "both", whitespace = "[ \t\r\n]")

fields <- c("byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid")

test1 <- grepl(c("byr"), passports)
test2 <- grepl(c("iyr"), passports)
test3 <- grepl(c("eyr"), passports)
test4 <- grepl(c("hgt"), passports)
test5 <- grepl(c("hcl"), passports)
test6 <- grepl(c("ecl"), passports)
test7 <- grepl(c("pid"), passports)

tests <- test1+test2+test3+test4+test5+test6+test7

results <- which(tests == 7)
counter <- 0
counter2 <- 0

for (k in results){
  counter <- 0
  # exract byr
  a <- strsplit(passports[k], "byr")[[1]][2]
  b <- strsplit(a, " ")[[1]][1]
  c <- as.numeric(gsub(":", "", b))
  if (c >= 1920 && c <= 2002){
    counter <- counter+1
  }
  
  #iyr
  a <- strsplit(passports[k], "iyr")[[1]][2]
  b <- strsplit(a, " ")[[1]][1]
  c <- as.numeric(gsub(":", "", b))
  if (c >= 2010 && c <= 2020){
    counter <- counter+1
  }
  
  #eyr
  a <- strsplit(passports[k], "eyr")[[1]][2]
  b <- strsplit(a, " ")[[1]][1]
  c <- as.numeric(gsub(":", "", b))
  if (c >= 2020 && c <= 2030){
    counter <- counter+1
  }
  
  #hgt
  a <- strsplit(passports[k], "hgt")[[1]][2]
  b <- strsplit(a, " ")[[1]][1]
  #c <- as.numeric(gsub(":", "", b))
  
  if (grepl("cm", b)){
    c <- as.numeric(gsub(":|cm", "", b))
    if (c >= 150 && c <= 193)
      counter <- counter+1
  }
  if (grepl("in", b)) {
    c <- as.numeric(gsub(":|in", "", b))
    if (c >= 59 && c <= 76){
      counter <- counter+1
    }
  }
  
  #hcl
  a <- strsplit(passports[k], "hcl")[[1]][2]
  b <- strsplit(a, " ")[[1]][1]
  c <- gsub(":", "", b)
  if ((grepl("[#][a-f0-9]{6}", c)) & (nchar(c) == 7)){
    counter <- counter+1
  }
  
  # ecl
  a <- strsplit(passports[k], "ecl")[[1]][2]
  b <- strsplit(a, " ")[[1]][1]
  c <- gsub(":", "", b)
  if (grepl("amb|blu|brn|gry|grn|hzl|oth", c)){
    counter <- counter+1
  }
  
  # pid
  a <- strsplit(passports[k], "pid")[[1]][2]
  b <- strsplit(a, " ")[[1]][1]
  c <- gsub(":", "", b)
  if (grepl("[0-9]{9}", c) & nchar(c) == 9){
    counter <- counter+1
  }
  if (counter == 7){
    counter2 <- counter2+1
  }
}
print(counter2)













