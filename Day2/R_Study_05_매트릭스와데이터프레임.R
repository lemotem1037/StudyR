## 매트릭스와 데이터프레임
z <- matrix(1:20, nrow=4, ncol=5) #nrow==행, ncol==열
z

z2 <- matrix(1:20, nrow=4, ncol=5, byrow = T)
z2

z[1,3]
z[3,4] # 3행의 4열
z[4,5]

z2[3,1]

x <- 1:4
y <- 5:8
x
y
z <- matrix(1:20, nrow=4, ncol=5, byrow = T)
z

m1 <- cbind(x,y) # 열 방향으로 결합
m1
m2 <- rbind(x,y) # 행 방향으로 결합
m2

m3 <- rbind(m2,x)
m3
z
m4 <- cbind(z, x)
m4
x
z
z[2,]
z[,3]








