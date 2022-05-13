## 데이터 입출력

age <- c(28, 17, 35, 46, 23, 67, 30, 50)
age
class(age)
str(age)

min(age)
max(age)

cat('가장 젊은 나이는', min(age), '세 이고\n, 가장 고령 나이는', max(age), '세 입니다.')


# 화면에서 데이터 입력 받기
user.input <- dlgInput('수입을 입력하세요 :')$res
user.input
income <- as.numeric(user.input)
income
tax <- income * 0.05
tax

10
100
1000
10000
100000  # 1e+05

# 1e+04부터 출력을 10000로 변경하는 옵션
options(scipen = 1) 

cat('세금', tax, '원')

x <- 1
y <- 10
print(x)
cat(x)

print(iris[1:6,])
head(iris)

cat(iris[1:6,]) #Error


 # LAB 체질량 지수 계산하기
height <- dlgInput('키를 입력하세요(cm) : ')$res
weight <- dlgInput('몸무게를 입력하세요(kg)')$res

height <- as.numeric(height)
weight <- as.numeric(weight)

height.res <- height / 100
bmi <- weight / (height.res^2)

cat('키', height, 'cm, 몸무게', weight, 'kg\n')
cat('체질량 지수', bmi, '입니다.\n(25이상 과체중, 30이상 비만)')


# 숫자 천단위 콤마
install.packages('formattable')
library('formattable')

num.data <- c(1250000, 22500, 123.456, 123.444, 1789.34)
num.data
comma(num.data)


## 파일 입출력
getwd() # 현재 작업 폴더 알아내기
setwd('C:/STUDY/StudyR') # 작업 폴더 변경
getwd()

# csv 파일 읽기
air <- read.csv('./Day3/airquality.csv') # 기본값 header = T
air.quality
head(air.quality)
tail(air.quality)
str(air.quality)

setosa.iris <- subest(iris, Species=='setosa')
str(setosa.iris)
setosa.iris   # row.names = F 행번호가 같이 저장X
write.csv(setosa.iris,'./Day3/airquality.csv',row.names = F)


## 엑셀 읽고 쓰기
library(xlsx)
airquality.xlsx <- read.xlsx('./Day3/airquality.xlsx', header=T, sheetIndex=1)


## LAB 다이아몬드 정보 제공하기
library(ggplot2)
diamonds
str(diamonds)

levels(diamonds$cut)
levels(diamonds$color)
levels(diamonds$clarity)
diamonds.new <- subset(diamonds, cut=='Premium' & carat>=2)

str(diamonds.new)


write.csv(diamonds.new, './Day3/shiny_diamonds.csv', row.names = F)


## color가 D나 H가 아닌 나머지
diamonds.new.without.D <- subset(diamonds.new, color != 'D'& color !='H')
str(diamonds.new.without.D)


write.csv(diamonds.new.without.DH,'./Day3/shiny_diamonds_without_DH.csv'
          ,row.names = F)


View(diamonds.new.without.DH)

          
