## 제어문
# if문
job.type <- 'A'

if (job.type == 'B') {
  bonus <- 200  
} else {
  bonus <- 100  
}

print(bonus)


# 제어문 and,  or
a <- 10
b <- 20

if (a>5 & b>5) { # and
  print(a + b)
}

 if (a>5 | b>30) { # or
  print(a * b)
}
  

# ifelse문
a <- 10
b <- 20
if (a > b) {
  c <- a
} else {
  c <- b
}
c

c <- ifelse(a>b, a, b) # 한줄정리 가능
c

# LAB 회원등급 분류 후 혜택 정리 (숙제)


## for문
for (i in 1:5) {
  print(i)
}

# 가로로 출력
for (i in 1:5) {
  cat(i, ' ')
}

# 2단
for (y in 1:9) {
  cat('2x',y,'=',2*y, '\n')
}

# 구구단 파이썬과 비교
for (x in 2:9){
  for (y in 1:9){
    cat(x,'x'y,'=',x*y, '')
  }
  cat('\n')
}

# 짝수 
for (i in 1:20){
  if (i %% 2 == 0) {
    cat(i,'')
  }
}

# iris 꽃잎 크기 분류
norow <- nrow(iris) # iris의 행의 수
norow
mylabel <- c()#   빈벡터 생성


for(i in 1:norow) {
  if (iris$Petal.Length[i] <= 1.6) {
    mylable[i] <- 'L'
  } else if (iris$Petal.Length[i] >= 5.1 {
    mylabel[i] <- 'H'
  } else {
    mylabel[i] <- 'M'
  }
}

print(mylabel)
str(mylabel)
newds <- data.frame(iris$Petal.Length, mylabel, iris$Species)
newds

write.csv(newds, '/Day4/iris_petal.csv', row.names = F)



## while문
sum <- 0
i <- 1
while (i <= 100) {
  sum <- sum + i
  i <- i + 1
}
print(sum)

## 사용자 정의 함수
mymax <- function(x, y) {
  num.max <- x
  if (y > x) {
    num.max <-y
  }
  return(num.max)
}

max(1,2)
mymax(1,3)

mydiv <- function(x, y=2) {
  result <-x/y
  return(result)
}

mydiv(10, 3)
mydiv(10)

myfunc <- function(x, y){
  val.sum <- x+y
  val.sum <- x*y
  
  return(list(sum=val.sum, mul=val.mul))
}
result <- myfunc(14, 7)

result$sum
result$mul


## 내장 함수 apply()
apply(iris[, 1:4], 2, mean)

apply(iris[, 1:4], 2, sum)











