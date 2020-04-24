x <- readLines("test.pdb")

waters <- x[grepl("O   WAT", x) == TRUE]

watcord <- regmatches(waters, gregexpr("(+|-)\\d+\\.\\d{3}", waters))

watcord <- lapply(watcord, as.numeric)

watcord <- as.data.frame(watcord, stringsAsFactors = FALSE)

watcord <- as.data.frame(t(watcord))

distance <- function(x1,x2,y1,y2,z1,z2){
  return(sqrt((x2-x1)**2 + (y2-y1)**2 + (z2-z1)**2))
}

row.names(watcord) <- NULL

distances <- c()

for (i in 1:length(watcord$V1)){
  distances2 <- distance(watcord$V1[i],watcord$V1,watcord$V2[i],watcord$V2,watcord$V3[i],watcord$V3)
  distances[i] <- min(distances2[which(distances2!=0)])
}

## should be ~2.8 Å
paste(mean(distances), "Å")
