## 샘플링
x <- 1:100
x
y <- sample(x, size = 5, replace = T) # replace=FALSE는 비복원 추출
y

idx <- sample(1:nrow(iris), size = 15, replace = F)
idx
iris.15 <- iris[idx,]
iris.15


## set.seed() 함수
sample(1:20, size=5)
sample(1:20, size=5)
sample(1:20, size=5)
set.seed(100)
sample(1:20, size=5)
set.seed(100)
sample(1:20, size=5)
sample(1:20, size=5)


## 조합 - 짝을 지어 추출
combn(1:5,3) # # 1~5에서 3개를 뽑는 조합

x <- c('red','green','blue','black','white')
com <- combn(x,4)
com

for(i in 1:ncol(com)) {
  cat(com[,i],'\n')
}


##  LAB 편두통 치료 데이터 분석
library(carData)
str(KosteckiDillon)

tot.mean <- mean(KosteckiDillon$dos)     # 치료일수(dos)
tot.mean
summary(KosteckiDillon$dos)

set.seed(100)
sample(nrow(KosteckiDillon), nrow(KosteckiDillon)*0.3)



for (rt in (1:5)*0.1) {
  set.seed(100)
  idx <- sample(nrow(KosteckiDillon), nrow(KosteckiDillon)*rt)
  sam.data <- KosteckiDillon[idx,'dos']     # 샘플링 데이터 추출
  tem.mean <- mean(sam.data)
  cat('비교:', rt*100 , '% 샘플링 평균치료일수=', tmp.mean, ':', tot.mean-tmp.mean,'\n')
  
}

# 평균 치료일수 646.7059

#for (rate in (1:5)*0.1) {
 # set.seed(100)
  #idx <- sample(nrow(KosteckiDillon), nrow(KosteckiDillon)*rate)
  #sam.data <- KosteckiDillon[idx,'dos'] # 샘플링 데이터 추출
 #tmp.mean <- mean(sam.data) # 샘플링 데이터 평균
# cat('Diff:', rate, tot.mean-tmp.mean, '\n')
#}

##
agg.result <- aggregate(iris[,-5], by=list(iris$Species), FUN=mean)
agg.result

summary(iris)

aggregate(iris[,-5], by=list(iris$Species), FUN=sum)


## LAB 2011 캐나다 전국 선거 통계
str(CES11)

table(CES11$abortion) # 반대, 찬성 인원수
table(CES11$abortion)/nrow(CES11)

agg <- aggregate(CES11[,'abortion'], by=list(성별=CES11$gender),FUN=table)
agg
agg.2 <- agg[,1]

agg.2[1,] <- agg.2[1,]/sum(agg.2[1,])
agg.2[2,] <- agg.2[2,]/sum(agg.2[2,])

rownames(agg.2) <- agg[,1]

names(agg) <- c('낙태찬성','낙태반대')



##  실전 분석 칠레 대통령 선거 여론 조사
help(Chile)
str(Chile)

nrow(Chile) - sum(is.na(Chile)) # 결측값 개수 확인
ch <- Chile[complete.cases(Chile),]
nrow(ch)

set.seed(100)
idx <- sample(nrow(ch), nrow(ch)*0.6)
ch60 <- ch[idx,]
dim(ch60)

agg <- aggregate(ch60[,'population'], by=list(지역=ch60$region), sum)
agg

table(ch60$vote)

no.people <- table(ch60$sex)
no.people
tmp <- subset(ch60, vote=='Y')
tmp
agg <- aggregate(tmp[,'vote'], by=list(성별=tmp$sex), length)
agg
yes.ratio <- agg$x / no.people  # 찬성비율 계산
yes.ratio

229/703
287/775

no.region <- table(ch60$region)
tmp <- subset(ch60, vote== 'Y')
agg <- aggregate(tmp[,'vote'], by=list(지역=tmp$sex), length)
agg
yes.ratio <- agg$x / no.region
yes.ratio










