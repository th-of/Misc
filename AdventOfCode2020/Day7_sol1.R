dat <- readLines("Day7_1_data.txt")

bags <- matrix(nrow = 594, ncol = 2)

for (i in 1:length(dat)){
  bags[i,1] <- strsplit(dat[i], " bags")[[1]][1]
  bags[i,2] <- paste(tail(strsplit(dat[i], " bags")[[1]], n = -1), collapse = '', sep = '')
}

lvl1 <- which(grepl("shiny gold", dat) == TRUE)
lvl1 <- lvl1[-c(4)]

## plaid crimson bags can contain shiny gold bags, faded yellow can contain plaid crimson, shiny fuchsia can contain
# faded yellow, dark maroon can contain shiny fuchsia, dim indigo can contain dark maroon, bright white
# can contain dim indigo, striped blue can contain bright white, shiny turquoise can contain striped blue, 

# bags that can hold shiny gold bags directly:
bags[lvl1]
# "plaid crimson"  "muted olive"    "shiny salmon"   "dark gray"      "pale olive"     "posh cyan"      "vibrant indigo" "wavy fuchsia"


