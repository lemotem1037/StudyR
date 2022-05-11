## 벡터 = 파이썬 리스트
# 학생 성적
score <- c(68, 95, 83, 76, 90, 80, 85, 91, 82, 70)
mean(score) # 평균값

score 

c <- 0:10

x <- c(1,2,3)  # num
x.1 <- 1:3     # int
x
x.1
y <- c('a', 'b', 'c')
y
z <- c(TRUE, FALSE, F, T)
z
y.1 <- c('Hello', 'World', '!', 'c')

w <- c(1, 2, '3', '4', 5) # 문자가 하나라도 들어가면 모두 문자로 변환
w
w.1 <- c('7', 8)

v1 <- 50:90
v2 <- c(1, 2, 3, 1:20)
v2

v3 <-seq(1, 100, 3)
v3

## 장점
v4 <- seq(0.1, 1.0, 0.1)
v4

v5 <- rep(1, times=5)
v5

v6 <- rep(1:5, times=3)
v6

v7 <- rep(c(1,3,5), times=3)
v7

v8 <-rep(seq(1, 10, 2), times=2)
v8

v9 <- rep(c('a', 'b', 3), each=4)
v9


## 벡터 이름붙이기
absent = c(8, 2, 0, 4, 1)
absent
names(absent) <- c('Mon', 'Tue', 'Wed', 'Thu', 'Fri') # 결석석
absent







