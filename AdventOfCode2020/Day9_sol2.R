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
# Find a contiguous set of at least two numbers that add to 731031916
result <- c()
a <- 2
while (TRUE){
  a <- a+1
  test <- seq(1, 1000, 1)
  test2 <- seq(a, 1000+a, 1)
  for (i in 1:(length(test)-a)){
    onesum <- sum(nums[test[i]:test2[i]])
    if (onesum == 731031916){
      result <- c(nums[test[i]:test2[i]])
      print( min(result) + max(result) )
      break
      FALSE
    }
  }
}

