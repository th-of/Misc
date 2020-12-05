#Bacteriocin mining
library(microseq)
library(Peptides)
library(readr)
library(data.table)
library(stringi)

#setwd("/mnt/c/Users/thoma/Desktop/BacMining")

fileConn <- file("BacMiningHits.txt")

files <- list.files(path = "./Plasmids", pattern="*.fasta", full.names=TRUE, recursive=FALSE)

for (x in files){
  ## Appending and prepending 2000 alanines to the sequence (so ORFfinder won't go out of range)
  fasta <- readFasta(x)
  fasta$Sequence[1] <- paste0(stri_rand_strings(1, 3000, pattern = "[a]"), fasta$Sequence[1], stri_rand_strings(1, 3000, pattern = "[a]"))
  writeFasta(fasta, "orf.fasta", width = 80)
  
  ## Run BLAST
  system(paste("blastn -db abc -evalue 1e-1 -sorthits 3 -query orf.fasta -out hits"))
  
  ## Read hits from BLAST output
  hits <- readLines("hits")

  ## Check if there are any hits, process only if yes
  if ((length(grep("Strand=", hits))) > 0){
    new <- append(grep("Strand=", hits), tail(grep("Sbjct", hits), n = 1))
    for (i in 1:(length(new)-1)){
      message("Second loop")
      hits_ <- hits[new[i]:new[i+1]]
      start <- parse_number(hits_[head(grep("Query", hits_), n = 1)])
          
      firstnum <- parse_number(hits_[tail(grep("Query", hits_), n = 1)])
      hits_ <- gsub(firstnum, "", hits_)
          
      stop <- parse_number(hits_[tail(grep("Query", hits_), n = 1)])
      midpoint <- round(mean(c(start, stop)))
          
      ## Run ORFfinder
      system(paste("ORFfinder -in orf.fasta -g 11 -s 0 -ml 30 -n true -b", midpoint-3000, "-e", midpoint+3000, "-out orfs"))
          
      ## Read ORFs and calculate peptide properties
      orfs <- readFasta("orfs")
          
      orfs <- cbind(orfs, "Charge" = charge(orfs$Sequence, pH = 7, pKscale = "Lehninger"))
      orfs <- cbind(orfs, "CAH" = hydrophobicity(gsub("[KR]", "", orfs$Sequence), scale = "KyteDoolittle"))
      orfs <- cbind(orfs, "Length" = nchar(orfs$Sequence))
          
      ## Append the amino acid sequence matching the criteria to a new file
      for (peptide in 1:length(orfs$Header)){
        if ((orfs$Charge[peptide] > 1.95) & (orfs$CAH[peptide] > 0) & (orfs$Length[peptide] %between% c(35, 60))){
          cat(paste(">", orfs$Header[peptide]), file="BacMiningHits.txt", append=TRUE, sep = "\n")
          cat(orfs$Sequence[peptide], file="BacMiningHits.txt", append=TRUE, sep = "\n")
          message(orfs$Header[peptide])
        }
      }
    }
  }
}

close(fileConn)

## Remove duplicates
results <- readFasta("BacMiningHits.txt")
results <- unique(results)
writeFasta(results, "BacMiningHits.fasta", width = 80)