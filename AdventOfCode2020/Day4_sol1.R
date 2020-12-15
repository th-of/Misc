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

results <- length(which(tests == 7))

