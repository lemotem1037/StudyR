## 그래프2
# 원그래프(Pie chart) 
favorite.season <- c('WINTER', 'SUMMER', 'SPRING', 'SUMMER', 'SUMMER',
              'FALL', 'FALL', 'SUMMER', 'SPRING', 'SPRING')
ds <- table(favorite.season) # 도수분포 계산
ds
pie(ds, main='선호계절', radius = 1, col=rainbow(4)) # 원그래프 생성


# 원그래프2
install.packages('plotrix')
library('plotrix')

pie3D(ds, main = '선호계절', labels = names(ds), labelcol = 'red', labelcex = 1.0, explode = 0.1,
      radius = 1.5, col = c('brown','lightgreen','skyblue','white'))


# 선그래프
month = 1:12
late = c(5,8,7,9,4,6,12,13,8,6,6,4) # 지각자 수
plot(month, late, main = '지각생 통계', type = 'l', lty=1, lwd=2, 
     xlab = '월', ylab = '지각생 수') # lty= 선의 종류 1=실선, 2점선 / lwd= 선의 굵기

# 선그래프2개 이상
late1 = c(5,8,7,9,4,6,12,13,8,6,6,4) 
late2 = c(4,6,5,8,7,8,10,11,6,5,7,3)
plot(month, late1, main = '지각생 통계2', type = 'o', lty=1, lwd=2, 
     xlab = '월', ylab = '지각생 수', col='red', ylim = c(1,15)) 
lines(month, late2, tpye='b', col='bule', lwd=2)

## LAB 
install.packages('DAAG')
library(DAAG)

ds <- table(science$like)
length(ds)

pie(ds, radius = 1, main = '선호 점수별 비율', col= rainbow(length(ds)))

pie3D(ds, main = '선호 점수별 비율', explode = 0.1, labels = names(ds), labelcex = 1.0,
      radius = 1.5, labelcol = 'white')


## 산점도
wt <- mtcars$wt
mpg <- mtcars$mpg

plot(wt, mpg, main = '중량-연비 산점도', xlab= '중량', ylab='연비', col='red', pch=19)

str(mtcars)
#아래의 3가지 산점도 다 동일
plot(mtcars$wt, mtcars$mpg)
plot(wt~mpg, data=mtcars)
plot(mpg~wt, data=mtcars)

vars <- c('mpg','disp','drat','wt')
target <- mtcars[vars]
plot(target, main='다중 산점도')


## IRIS
iris.2 <- iris[,3:4]
levels(iris$Species)
group <- as.numeric(iris$Species)
group

color.3 <- c('red','green','blue')
plot(iris.2, main='붓꽃 꽃잎길이-넓이 산점도', pch=group, col=color.3[group],
     xlab = '꽃잎길이', ylab = '꽃잎 넓이', las = 1)
legend(x='bottomright', legend = levels(iris$Species), pch=(1:3), color = color.3)


## LAB 자동차 선팅 분석
library(DAAG)
str(tinting)

plot(tinting$it,tinting$csoa)

group <- tinting$tint
levels(group)
color <- c('red','blue','green')

plot(tinting$it, tinting$csoa, col=color[group])


## LAB 호주의 사회 복지 서비스와 만족도 분석
library(DAAG)
str(socsupport) # 데이터 구조 확인
help(socsupport) 

library(plotrix)
ds <- table(socsupport$age)
pie3D(ds, main='연령분포', labels=names(ds),labelcex = 1.0, radius = 1.5,
      explode = 0.1, col=rainbow(length(ds)))


group <- as.numeric(socsupport$gender)
color <- c('blue','red')
plot(socsupport[,c('emotionalsat','tangiblesat','age')],pch=group, col=color[group])










