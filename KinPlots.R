library("readxl")
# Filename of Excel document exported from Hidex Sense (Kinetic, second sheet)
filename <- "Thomas_20201204_140650_PI2.xlsx"
# Number of rows to include
rownum <- c(5)
# Number of columns to include
colnum <- c(9)
# Row labels (right)
rows <- c("EntK1", "GarKS", "Nisin", "EntK1", "GarKS")
# Row label (left), must be of the same length as rownum
strains <- c("3104", "3104", "3104", "2787", "2787")
# Concentration in the first well (same for all columns)
conc_well1 <- c(25)


## Calculate concentrations, assumes serial 2-fold dilution series
for (i in 1:colnum){
  conc_well1[i+1] <- as.numeric(format(conc_well1[i]/2.0, digits = 3))
}

# Loads the second sheet of the excel file as my_data
my_data <- read_excel(filename, sheet = 2)

# Convert data to data frame
my_data <- as.data.frame(my_data, row.names = NULL)

# Finds the first row (probably always the same?) and last
start <- grep("A1", my_data[,1])[1]
stop <- length(my_data[,1])

# Subsets relevant data only
data <- my_data[start:stop,]
# Transforms the table for convenience
data <- t(data)

# Sets the plot parameters
par(mfrow=cbind(rownum, colnum), mar = c(0.1,0.1,0.1,0.1), oma = c(5,5,5,5), ann=FALSE)


a <- 1
for (i in seq(0, (rownum*10)-10, 10)){
  for (j in 1:colnum){
    plot(data[3:(dim(data)[1]),1], data[3:(dim(data)[1]),(2*(i+j))], type="l", col="green", lwd=2, xaxt='n', yaxt='n', ylim=c(178206, 1442060), xlim=c(0, 3600))
    if ((a == 1) & (j <= colnum)){
      mtext(conc_well1[j], side=3)
    }
    if ((i+j) == (format(rownum*colnum-(0.5*rownum), digits=2))){
      mtext("Fluorescence (630/40 nm) over 1 hour", side=1, line=1, adj=-1, cex=1, las=1)
    }
  }
  mtext(rows[a], side=2, line=-0.133*colnum**2+3.385*colnum-29.5, cex=1, las=3)
  mtext(strains[a], side=2, line=54, cex=1, las=3)
  a <- a+1
}