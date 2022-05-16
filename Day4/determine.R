## 자격증 합격여부 판단 함수
determine <- function(score) {
  total <- apply(score, 1, sum)
  scorest <- cbind(score, total)
  result <- c()
  
  for (i in 1:nrow(scorest)) {
    if (scorest[i,1] < 20*0.4 | 
        scorest[i,2] < 20*0.4 |
        scorest[i,3] < 60*0.4) {
      result[i] <- 'Fail'
    } else if (scorest[i,4] >= 60) {
      result[i] <- 'Pass'
    } else {
      result[i] <- 'Fail'
    }
      cat(i, '번째 응시자', result[i], '\n')    # 주석처리
  }
  return(result) # 저장결과 리턴
}


## 자격증 합격 여부
sub1 <- c(14, 16, 12, 20, 8, 6, 12, 18, 16, 10)
sub2 <- c(18, 14, 14, 16, 10, 12, 10, 20, 14, 14)
sub3 <- c(44, 38, 30, 48, 42, 50, 36, 52, 54, 32)
score <- data.frame(sub1, sub2, sub3)
score

result <- determine(score)
source <- ('determin.R')
result <- determine(score)
result




## 조건에 맞는 데이터 위치 리턴 함수
score.two <- c(76, 84, 69, 50, 95, 60, 82, 71, 88, 84)
score.two

which(score.two==69) # 성적이 69인 학생은 몇 번째에 있는지
which(score.two==76)
which(score.two==85)
which(score.two>84)
max(score.two)
which.max(score.two)
which.min(score.two)

idx <- which(score.two<=60)
idx

score.two[idx]
score.two[idx] <- 61
score.two


idx <- which(score.two>=80)
idx

score.hige <- score.two[idx]
score.hige


## iris 꽃잎의 길이가 5.0 이상인 것
idx <- which(iris$Petal.Length>5.0)
idx

iris.big1 <- iris[idx,]
iris.big1

str(subset(iris, iris$Petal.Length>5.0))


## LAB 언어 발달 상황 진단 프로그램 개발하기

install.packages('Stat2Data')
library(Stat2Data)
data(ChildSpeaks)
ChildSpeaks
str(ChildSpeaks)


#말문트인 개월수로 등급환산
idx <- which(ChildSpeaks$Age < 9)
idx
ChildSpeaks[idx, ]
ChildSpeaks[idx, 'm1'] <- 5
idx <- which(ChildSpeaks$Age >= 9 & ChildSpeaks$Age < 14)
idx
ChildSpeaks[idx, 'm1'] <- 4
idx <- which(ChildSpeaks$Age >= 15 & ChildSpeaks$Age < 21)
idx
ChildSpeaks[idx, 'm1'] <- 3
idx <- which(ChildSpeaks$Age >= 21 & ChildSpeaks$Age < 27)
idx
ChildSpeaks[idx, 'm1'] <- 2
idx <- which(ChildSpeaks$Age >= 27)
idx
ChildSpeaks[idx, 'm1'] <- 1

## 언어 이해력 점수(Gesell) 등급환산
idx <- which(ChildSpeaks$Gesell < 70)
idx
ChildSpeaks[idx, 'm2'] <- 1
idx <- which(ChildSpeaks$Gesell >= 70 & ChildSpeaks$Gesell < 90)
idx
ChildSpeaks[idx, 'm2'] <- 2
idx <- which(ChildSpeaks$Gesell >= 90 & ChildSpeaks$Gesell < 110)
idx
ChildSpeaks[idx, 'm2'] <- 3
idx <- which(ChildSpeaks$Gesell >= 110 & ChildSpeaks$Gesell < 130)
idx
ChildSpeaks[idx, 'm2'] <- 4
idx <- which(ChildSpeaks$Gesell >= 130)
idx
ChildSpeaks[idx, 'm2'] <- 5


ChildSpeaks$total <- ChildSpeaks$m1 + ChildSpeaks$m2

idx <- which(ChildSpeaks$total < 3)
ChildSpeaks[idx, 'result'] <- '매우 늦음'
idx <- which(ChildSpeaks$total >= 3 & ChildSpeaks$total < 5)
ChildSpeaks[idx, 'result'] <- '늦음'
idx <- which(ChildSpeaks$total >= 5 & ChildSpeaks$total < 7)
ChildSpeaks[idx, 'result'] <- '보통'
idx <- which(ChildSpeaks$total >= 7 & ChildSpeaks$total < 9)
ChildSpeaks[idx, 'result'] <- '빠름'
idx <- which(ChildSpeaks$total >=9)
ChildSpeaks[idx, 'result'] <- '매우 빠름'


ChildSpeaks[which.min(ChildSpeaks$total), ]





## 종업원 팁 분석하기
install.packages('reshape2')
library(reshape2)
str(tips)

View(tips)

# 성별 구분
unique(tips$sex)

idx <- which(tips[, 'sex'] == 'Female')
avg.female <- mean(tips[idx, 'tip'])

idx <- which(tips[, 'sex'] == 'Male')
avg.male <- mean(tips[idx, 'tip'])

avg.female

avg.male

# 흡연 구분
unique(tips$smoker)

idx <- which(tips$smoker == 'Yes')
avg.smoker <- mean(tips[idx, 'tip'])

idx <- which(tips$smoker == 'No')
avg.nonsmoker <- mean(tips[idx, 'tip'])

avg.smoker

avg.nonsmoker 

# 코드 이용 meanbycol.tip <- function(tips, colname){ }

meanbycol.tip <- function(colname){
  value <- unique(tips[, colname])
  result <- list()
  for(i in 1:length(value)) {
    idx <- which(tips[,colname] == value[i])
    result[i] <- mean(tipe[idx,'tip'])
  }
}
names(result) <- value
return(result)


source('myfunc.R')
meanbycol.tip('sex')
meanbycol.tip('smoker')
meanbycol.tip('size')
meanbycol.tip('day')


