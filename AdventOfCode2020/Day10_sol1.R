dat <- readLines("Day10_1_data.txt")

nums <- c()

for (i in dat){
  nums <- append(nums, as.numeric(i))
}
nums <- sort(nums)
for (i in 1:(length(nums))){
  nums[i] <- nums[i+1]-nums[i]
}
nums[length(nums)] <- 1
nums[length(nums)+1] <- 3

print(sum(length(which(nums == "1"))) * sum(length(which(nums == "3"))))
