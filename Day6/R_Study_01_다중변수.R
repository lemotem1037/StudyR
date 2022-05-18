## 다중변수 데이터
# 데이터 확인
head(cars)

plot(cars$speed, cars$dist, 
     main = '자동자 속도와 제동거리',   # 그래프 제목
     xlab = '속도',                     # X축 레이블 
     ylab = '제동거리')                # y축 레이블
     
cor(cars$speed, cars$dist)     # 속도와 제동거리의 상관관계     
     
class(state.x77)     
st <- data.frame(state.x77) # 매트릭스를 데이터프레임으로 변환
class(st)
head(st)

plot(st) # 다중 산점도

cor(st$Life.Exp, st$Murder) # 기대 수명(Life.Exp)과 살인범죄율(Murder)은 음의 상관관계
cor(st$Illiteracy, st$Murder)
cor(st$Income, st$Area) 
cor(st$Income, st$HS.Grad) # 인당 소득(Income)과 고등학교 졸업률(HS.Grad)은 양의 상관관계
cor(st$Area, st$Frost) 


## LAB 경제지표 데이터 분석
str(longley)
head(longley)

df <- longley[,c('GNP', 'Unemployed', 'Armed.Forces', 'Population','Employed')]
df

plot(df)
cor(df)

getwd()  
load('./result_sales_dt.RData')  # RData로 데이터 셋 불러오기
save(result_sales_dt, file = './result_dt.RData') # RData 저장


## LAB 실전 분석
install.packages('Ecdat')   # Ecdat 패키지 설치
library(Ecdat)              # library에서 선택
str(Hdma)

tbl <- table(Hdma$deny)
tbl2 <- tbl / sum(tbl)
tbl2

# 막대그래프 생성
names(tbl) <- c('승인', '거절')
tbl
names(tbl2) <- c('승인', '거절')
tbl2

barplot(tbl2, main = '주택담보대출 승인/거절 비율',
        col = c('green', 'red'),
        ylim = c(0.0, 1.0), las = 1,
        ylab = '비율')

barplot(tbl, main = '주택담보대출 승인/거절 건수',
        col = c('green', 'red'),
        ylim=c(0, 2500), las = 1,
        yalb='건수')

# 주택가격대비 대출금 비율(lvr)의 분포를 히스토그램으로 생성
hist(Hdma$lvr, main = 'ltv', col = rainbow(10),
     yrim =c(0,1200))

## dir 수입대비 보증금 비율, hir 수입대비 주택 유지 비용
## ccs 고객 신용 등급, mcs 대출 신용 등급
df <- Hdma[,c('dir','hir','ccs','mcs')]
df
point.color <- c('green', 'red')
plot(df, col = point.color[Hdma$deny])
cor(df)
