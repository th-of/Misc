dat <- readLines("Day9_1_data.txt")

nums <- c()

for (i in dat){
  nums <- append(nums, as.numeric(i))
}

test <- matrix(nrow = 25, ncol = 25)
test <- outer(sort(nums[1:25]), sort(nums[1:25], decreasing = TRUE), "+")

# Debugging convenience
# rownames(test) <- sort(nums[1:25])
# colnames(test) <- sort(nums[1:25], decreasing = TRUE)

for (a in 26:length(nums)){
  test <- outer(sort(nums[(a-26):(a-1)]), sort(nums[(a-26):(a-1)], decreasing = TRUE), "+")
  if (is.element(nums[a], test) == FALSE){
    print(nums[a])
  }
}
