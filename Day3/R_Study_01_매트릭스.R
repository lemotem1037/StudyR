## 매트릭스 계속

z <- matrix(1:20, nrow=4, ncol=5, byrow = T)
z

x <- c(20, 25, 30, 35)
x
m1 <- cbind(z, x) # 열기준 결합 방식
m1

y <- 36:41
y

m2 <- rbind(m1, y) # 행기준 결합 방식
m2

# 값추출
z   
#     [,1] [,2] [,3] [,4] [,5]
#[1,]    1    2    3    4    5
#[2,]    6    7    8    9   10
#[3,]   11   12   13   14   15
#[4,]   16   17   18   19   20

m2[1,3]  #1행+3열의 값

z[1,5] #1행+5열의 값

z[,5] 

z[2,1:3] # 2행의 1-3까지 열

# 매트릭스 이름붙이기
score <- matrix(c(90, 85, 69, 78, 85, 96, 49, 95, 90, 80, 70, 60),nrow = 4)
score
rownames(score) <- c('johan', 'fram', 'rin', 'ruin')
colnames(score) <- c('English','Math','Science')
score

score['johan', 'Math'] # johan의 수학점수 추출
score['Math','johan'] # ERROR - 무조건 행 기준 

score['fram',] # 프람의 성적 추출
score[,'Science']

## LAB 햄버거 영양성분 정보

burger <- matrix(c (514, 917, 11, 533, 853, 13, 566, 888, 10),
                 nrow = 3)

burger
rownames(burger) <- c('MD','RR','BK')
colnames(burger) <-c('kcal','nat','fat')
burger

burger['MD','nat']
burger['MD',]
burger[,'kcal']

# 데이터프레임(data frame)
physical <- matrix(c(168.4, 169.5, 62.4, 65.5, 'M','F'),nrow =2)
physical

# 숫자값 연속적 / 문자값 범주형

city <- c('Seoul', 'Tokyo', 'Washington') # 문자벡터
rank <- c(1,3,2)        # 숫자벡터
city.info <- data.frame(city, rank) # 데이터프레임 생성
city.info 

## iris 데이터셋
iris
head(iris)
tail(iris)
str(iris)
z
str(z)        # type과 유사
str(burger)
str(x)
str(c('johan', 'fram', 'rin', 'ruin'))

iris[140,]
iris[,5]
levels(iris[,5])
iris[,c(1,2)]
iris[,c('Sepal.Length','Petal.Length','Species')]
head(iris)

head(iris[,c('Sepal.Length','Petal.Length','Species')])[1,]
head(iris[,c('Sepal.Length','Petal.Length','Species')])[1,3]


## LAB 햄버거 영양정보 추가2 - 데이터프레임 사용
kcal <- c(514, 533, 566)
nat <- c(917, 853, 888)
fat <- c(11, 13, 10)
menu <- c('새우버거', '불고기버거','치킨버거')
burger.2 <- data.frame(kcal, nat, fat, menu)
burger.2
rownames(burger.2) <- c('믹도날드', '롯리아', '왕버거')
burger.2

burger.sum <- burger.2[,'nat'] * burger.2[,'fat']
burger.sum

burger.2['믹도날드',]

## dinm()
dim(iris)
dim(burger.2) 

nrow(iris)
ncol(iris)
colnames(iris)
colnames(burger.2)
rownames(burger.2)
rownames(iris)

head(iris, n = 2)
tail(iris)
head(x = iris, n = 10)
str(iris)

iris$Sepal.Length

# 범주형 값의 levels   
levels(iris$Species)   
levels(iris[,'Species'])   # 위와 같은 값을 출력

# 행별, 열별 합계, 평균 산술 계산
colSums(iris[-5])
colSums(iris[,'-Species']) # Error 

colSums(iris[,c(1,2)]) # 최소 2개 이상의 열이 선택되어야 함
colMeans(iris[,-5])
head(iris)
rowSums(iris[,-5])
rowSums(iris[,-5])


z <- matrix(1:20, nrow=4)
z
t(z)
str(burger.2)
str(t(burger.2))


iris.subset.1 <- subset(iris, Species=='setosa')
iris.subset.1

iris.subset.2 <- subset(iris, Sepal.Length>=5.0 & Sepal.Width>3.0)
iris.subset.2
str(iris.subset.2)

iris.subset.2$Sepal.Length

iris.subset.2[,c(1,2,5)]

a <- matrix(1:20, 4, 5)
b <- matrix(21:40, 4, 5)
a + b
a * b

a.2 <- a * 2
a
a.2

iris

class(iris)
str(iris)
class(z)
str(z)
is.matrix(iris) #FALSE_ 질문is.matrix
is.matrix(z) #TRUE
is.data.frame(iris)


## LAB 벚나무 판매
# 조건: 직경(Girth)>=mean, 높이(Height)>=80, 부피(Volume)>=50
trees
class(trees)
str(trees)

# 화원 나무 직경 평균
girth.mean <- mean(trees[,1])
girth.mean
girth.mean.2 <- mean(trees$Girth)
girth.mean.2

candidata <- subset(trees, Girth >= girth.mean & Height >= 80 & Volume >= 50)
candidata
nrow(candidata)


# 종업원 팁계산하기
install.packages('reshape2')
library(reshape2)
tips

is.matrix(tips) # FALSE
is.array(tips)  # FALSE
is.data.frame(tips) # TRUE
class(tips)
str(tips)
levels(tips$day)

head(tips)
tail(tips)

table(tips$day)
class(table(tips$day))  # "table"

dinner <- subset(tips, time=='Dinner')
dinner
lunch <- subset(tips, time=='Lunch')
lunch
table(dinner$day)
table(lunch$day)

head(dinner)
dinner.data <- dinner[c('total_bill','tip','size')]
lunch.data <- lunch[c('total_bill','tip','size')]
str(dinner)
str(lunch)

colSums(dinner.data)
colMeans(dinner.data)
colSums(lunch.data)
colMeans(lunch.data)


tips.rate <- tips$tip/tips$total_bill
tips.rate
mean(tips.rate) * 100
