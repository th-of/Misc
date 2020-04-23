x <- readLines("allframes.pdb")

nter <- x[grepl("H1  MET", x) == TRUE]

cter <- x[grepl("OXT", x) == TRUE]

ncoord <- regmatches(nter, gregexpr("(+|-)\\d+\\.\\d{3}", nter))
ccoord <- regmatches(cter, gregexpr("(+|-)\\d+\\.\\d{3}", cter))

ncoord <- lapply(ncoord, as.numeric)
ccoord <- lapply(ccoord, as.numeric)

ncoord <- as.data.frame(ncoord, stringsAsFactors = FALSE)
ccoord <- as.data.frame(ccoord, stringsAsFactors = FALSE)


ncoord <- as.data.frame(t(ncoord))
ccoord <- as.data.frame(t(ccoord))


distance <- function(x1,x2,y1,y2,z1,z2){
  return(sqrt((x2-x1)**2 + (y2-y1)**2 + (z2-z1)**2))
}

print(mean(distance(ccoord$V1,ncoord$V1,ccoord$V2,ncoord$V2,ccoord$V3,ncoord$V3)))
