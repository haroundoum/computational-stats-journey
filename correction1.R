yield_kg<-c(2.5,3.8,1.9,4.2)

mean(yield_kg)
median(yield_kg)
sd(yield_kg)



quad_roots <- function(a,b,c){
  
  del <- b^2-4*a*c
  
  if(del>0){
    x1 <- (-b-sqrt(del))/2*a
    x2 <- (-b+sqrt(del))/2*a
    
    return (paste(x1, "and", x2))
  
  } else {
    return ("NA, the discriminant is negative")
  }
  
}

quad_roots(1,-3,-6)
quad_roots(1,-1,-6)
quad_roots(1,0,6)


sum1<-0
for(i in 1:100){
  if(i%%3==0|i%%5==0){
    sum1 <- sum1 + i
    print(sum1)
  }
}
sum1


x<-1:100
sum2 <- sum(x[x %% 3 == 0 | x %% 5 == 0])
sum2


# Build a data frame of 6 farms: farm_id, district, area_ha, yield_kg, irrigated.

farms <- data.frame(farm_id = 1:6, district = c("C1","C2","C3","C4","C5","C6"),
                    area_ha = c(11,13,15,17,18,19), yield_kg = c(100,201,132,122,44,11), 
                    irrigated=c(TRUE,FALSE,FALSE,TRUE,TRUE,TRUE))
farms

# Then: (a) mean yield per irrigated TRUE/FALSE using tapply() or aggregate(),
farms$irrigated <- as.logical(farms$irrigated)
farms$irrigated


#mean(farms$irrigated)

aggregate(yield_kg~irrigated,farms,mean)

tapply(farms$yield_kg,farms$irrigated,mean)

#       (b) add a column yield_per_ha = yield_kg / area_ha,

farms <- cbind(farms, yield_per_ha = farms$yield_kg/farms$area_ha)
farms

#       (c) sort the farms from best to worst yield_per_ha.

farms[order(-farms$yield_per_ha),]

# ---- Task 5: first simulation (preview of Phase 1) -----------------------
#1
x1 <- sample(1:6, 10000, replace = TRUE)
x1

x2 <- sample(1:6, 100, replace = TRUE)
x2

x3 <- sample(1:6, 1000, replace = TRUE)
x3

#2 
#10000
P1 <- length(x1[x1==6])/10000
P1

#100
P2 <- length(x2[x2==6])/100
P2

#1000
P3 <- length(x3[x3==6])/1000
P3

#the error is continuouly increasing or decreasing, it is interchanging between this 2 

#the exercise that has taken a lot of time was definitely the for loop one, i was making my sum outside of the if and the sum was wrong. 
#I fix it by trying again and again...

set.seed(2026)
p_true <- 1/6
for (n in c(100, 1000, 10000, 100000)) {
  errors <- replicate(200, abs(mean(sample(1:6, n, replace = TRUE) == 6) - p_true))
  cat("n =", n, " mean absolute error =", round(mean(errors), 5), "\n")
}

quad_roots <- function(a, b, c0) {
  disc <- b^2 - 4*a*c0
  if (disc < 0) {
    message("Discriminant is negative: no real roots")
    return(NA)
  }
  c((-b - sqrt(disc)) / (2*a), (-b + sqrt(disc)) / (2*a))
}
quad_roots(2, -4, -6)   # should give -1 and 3

