a <- readLines("bilayer.pdb")
aa <- c("ALA", "ARG", "ASN", "ASP", "CYS", "GLU", "GLN", "GLY", "HIS", "ILE", "LEU", "LYS", "MET", "PHE", "PRO", "SER", "THR", "TRP", "TYR", "VAL")

distance <- function(x1,x2,y1,y2,z1,z2){
  return(sqrt((x2-x1)**2 + (y2-y1)**2 + (z2-z1)**2))
}

coordinates <- function(input){
  return(as.numeric(regmatches(input[1], gregexpr("(+|-)\\d+\\.\\d{3}", input[1]))[[1]][1:3]))
}

peptide <- grep(paste(aa, collapse="|"), a)

solvent <- grep("WAT", a)

# salt <- a[grep("K+", a)]


watcord <- as.data.frame(t(sapply(a[solvent], coordinates, USE.NAMES = FALSE)))
pepcord <- as.data.frame(t(sapply(a[peptide], coordinates, USE.NAMES = FALSE)))

test <- c()
for (i in 1:length(pepcord$V1)){
  distances2 <- distance(pepcord$V1[i],watcord$V1,pepcord$V2[i],watcord$V2,pepcord$V3[i],watcord$V3)
  test <- append(test, solvent[1]+(which(distances2 < 3.0)))
}

test <- unique(test)

comp <- grep("K+", a)

for (i in test){
  comp <- append(comp, (i-11)+grep(strsplit(strsplit(a[i], "WAT ")[[1]][2], "  ")[[1]][1], a[(i-10):(i+10)]))
}

newfile <- a[-c(comp)]

writeLines(newfile, "newFile.pdb")

#strsplit(strsplit(a[solvent[1]+1070], "WAT ")[[1]][2], "  ")[[1]][1]

#coordinates <- function(x){
#  return(regmatches(x, gregexpr("(+|-)\\d+\\.\\d{3}", x))[[1]][1:3])
#}



#distance <- function(a,b){
#  return(sqrt((b[1]-a[1])**2 + (b[2]-a[2])**2 + (b[3]-a[3])**2))
#}

## Works but very slow and splits waters. 
# close <- c()
# for (i in peptide){
#   for (j in solvent){
#     if (distance(coordinates(a[i]), coordinates(a[j])) < 3.0){
#       close <- append(close, j)
#     }
#   }
#   print(i)
# }
# 
# 
# 
# newfile <- a[-c(test)]
# 
# writeLines(newfile, "newFile.pdb")
# 
# b <- readLines("newFile.pdb")
# b_ <- b[grep("WAT", b)]
# fixfile <- grep("WAT", b)
# 
# stringsplit <- function(x){
#   strsplit(x, " ")[[1]][5]
# }
# 
# test <- sapply(b_, stringsplit, USE.NAMES = FALSE)
# 
# water <- c("O", "H1", "H2")
# correct <- c()
# for (i in 1:length(test)){
#   if (test[i] == "O"){
#     if (sum(test[i:(i+2)] == water) == 3){
#       correct <- append(correct, i:(i+2))
#     }
#   }
# }
# indices <- append(1:fixfile[1], correct+57476)
# 
# writeLines(b[indices], "_newFile.pdb")

## tester
# trues <- c()
# for (i in seq(1, 79800, 3)){
#   trues <- append(trues, test[i:(i+2)] == water)
# }
# > length(trues[trues == TRUE])
# [1] 52962
# > length(trues[trues == FALSE])
# [1] 26838

