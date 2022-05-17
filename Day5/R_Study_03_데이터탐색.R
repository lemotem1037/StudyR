## 데이터 탐색
# 단일 범주 데이터
library(carData)
tData <- Titanic
tData2 <- TitanicSurvival
str(tData)

room.class <- TitanicSurvival$passengerClass # 선실 정보
# 보기 방식
room.class
str(room.class)
table(room.class)

tbl<- table(room.class)
sum(tbl)

barplot(tbl, main = '선실별 탑승객', xlab = '선실등급', ylab = '탑승객 수', col = c('blue','green','yellow'),
        names = c('1등실','2등실','3등실'))

tbl / sum(tbl)

pie3D(tbl, main = '선실별탑승객비율', radius = 1.5, lables = c('1등실','2등실','3등실'),
      col = c('blue','green','yellow'), labelcex = 1.0, labelcol = 'black', explode = 0.1)


##  생사여부, 성별 모두 위와 동일.
# 단일 변수 수치형
str(state.x77)
grads <- state.x77[,'HS Grad']
grads
str(grads)
 
summary(grads) # 최솟값 37.80 - 최댓값 67.30 / min, Median, Max를  한번에 정리

sd(grads)
hist(grads, main = '주별 졸업률', xlab = '졸업률', ylab = '주의 개수', col = 'orange')  # 히스토그램

boxplot(grads, main = '주별 졸업률', col = 'green')  # 상자그림

idx <- which(grads == min(grads))  # 졸업률이 가장 낮은 주
idx
grads[idx]

idx <- which(grads == max(grads))  #졸업률이 가장 높은 주
idx
grads[idx]

idx <- which(grads < mean(grads))  # 졸업률이 평균 이하인 주
idx
grads[idx]

## 72_79년까지 영국 폐질환 사망자 데이터
ds <- read.csv('C:/STUDY/StudyR/Day5/fdeaths.csv',header = T, row.names = 'year')

ds

mycol <- c('black','blue','red','green','purple','darkgray')
my.lty <- 1:6

plot(1:12,                            # x축 데이터
     ds[1,],                          # y 축 데이터
     main = '월별 사망자 추이',       # 그래프 제목
     type = 'b',                      # 포인트 타입
     lty = my.lty[1],                 # 라인 종류
     lwd = 2,                         # 라인 두께
     xlab = '월', ylab = '사망자 수', # x,y축 라벨
     ylim = c(300,1200),              # y축 범위
     las = 1,                         # y축 가로쓰기 
     col=mycol[2]                     # 선색
     )                         

# for문
for (i in 2:6) {
  lines(1:12,
    ds[i,],
    type = 'b',
    lty = my.lty[i],
    lwd = 2,
    col = mycol[i] 
    )
}


legend(x='topright', 
       lty = my.lty, 
       lwd = 2,
       col = mycol,
       legend = rownames(ds),
       inset = c(0, 0))


## LAB 미국 자동차 판매 가격 데이터
library(DAAG)
str(carprice)
carprice$Price
range(carprice$Price)

hist(carprice$Price,
     main = '자동차 가격 분포',
     xlab = '가격대(1,000$)',
     ylab = '빈도수',
     col = rainbow(8)
     )

tbl <- table(carprice$Type)
barplot(tbl,
        main = '차종별 빈도수',
        xlab = '차종',
        ylab = '빈도수',
        col = rainbow(length(tbl))
        )
summary(tbl)

idx <- which(carprice$Price == max(carprice$Price))
carprice[idx, c('Type', 'Price')]


## 다중변수 탐색(분석)
str(pressure)

plot(pressure$temperature,   # X축
     pressure$pressure,      # y축
     main = '온도와 기압', 
     xlab = '온도(섭씨)',
     ylab = '기압',
)     











