## 데이터 전처리!!
# 벡터의 결측값
z <- c(1,2,3,NA,5,NA,7,8,9,10) # 결측값이 포함된 벡터 생성
z
summary(z)
sum(z)        # NA - 결측값으로 계산x

is.na(z)       # NA - 결측값 여부 확인
sum(is.na(z))  # NA - 결측값 갯수 확인
sum(c(T,T,F))
sum(z, na.rm = T) # NA를 제외하고 합계를 계산

# 결측값 제거/치환
z1 <- c(1,2,3,NA,5,NA,7)
z2 <- c(5,8,1,NA,3,NA,7)
z1[is.na(z)] <- 0
z3 <- as.vector(na.omit(z2))
z4 <- z1
z4[is.na(z4)] <- ceiling((sum(z4, na.rm = T) / length(z4)))

summary(z4)
summary(c(1,2,3,4,5,6,7))
summary(z1)


# 2차원 결측값
iris
iris.na <- iris
iris.na[1,2] <- NA 
iris.na[1,3] <- NA 
iris.na[2,3] <- NA 
iris.na[3,4] <- NA 
head(iris.na)

# 결측값 확인 (열별)
for (i in 1:ncol(iris.na)) {
  this.na <- is.na(iris.na[,i])
  cat(colnames(iris.na)[i],'\t',sum(this.na),'\n')
  
}

## apply를 이용한 방법
col_na <- function(y) {
  return(sum(is.na(y)))
}

na_count <- apply(iris.na, 2, FUN = col_na)
na_count  


## 결측값 확인 (행별)
rowSums(is.na(iris.na))
result <- rowSums(is.na(iris.na))
sum(result > 0)
sum(is.na(iris.na))

## 매트릭스 NA 제외 전처리
head(iris.na)  
iris.na[!complete.cases(iris.na),]   ## NA가 없는 표시  
# 느낌표 대신 iris.na[complete.cases(iris.na) == F,] '== F' 사용 가능
  

iris.comp <- iris.na[complete.cases(iris.na),]



## LAB 전 세계 국가들의 통계 데이터 분석
library(carData)
str(UN)
levels(UN$region)

col_na <- function(y) {
  return(sum(is.na(y)))
}

apply(UN, 2, FUN = col_na)

mean(UN$lifeExpF, na.rm = T) #여성의 평균수명(lifeExpF)

tmp <- UN[,c('pctUrban','infantMortality')]
tmp <- tmp[complete.cases(tem),]  # 결측값 제거
length(tmp$pctUrban)
colMeans(tmp)
mean(tmp$pctUrban)

tmp.asia <- subset(UN, region=='Asia')  # 아시아 국가 추출
mean(tmp.asia$fertility)
  


## 정렬
v1 <- c(1,7,6,8,4,2,3,9)
sort(v1, decreasing = T)

name <- c('신태일','한소라','이가람','신형석')
order(name)  # 오름차순
order(name, decreasing = T)  # 내림차순

idx <- order(name)
name[idx]               # 오름차순 정렬 

## 데이터 프레임 정렬
iris
sort(iris$Sepal.Length)

sl.order <- order(iris$Sepal.Length)
iris[sl.order,]
iris.new <- iris[sl.order,]
iris.ag <- iris[order(iris$Species, iris$Sepal.Length, 
                      decreasing = T,
                      iris$Petal.Length)]
iris.ag 



## LAB 교통사고 통계 데이터 탐색
library(carData)
str(Highway1)
levels(Highway1$htype)

Highway1[order(Highway1$rate, decreasing = T),]

tmp <- Highway1[order(Highway1$len, decreasing = T),'len']
tmp
sum(tmp[1:10])

tmp.2 <- sort(Highway1$len, decreasing = T)
tmp.2
sum(tmp.2[1:10])

tmp <- Highway1[order(Highway1$adt),c('adt','rate')]
tmp
tmp[1:10,]

tmp <- Highway1[order(Highway1$slim, decreasing = T),
                      c('len','adt','rate')]
tmp
tmp[1:5,]









