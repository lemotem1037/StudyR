## 포브스 기업  리포트 데이터 분석

install.packages('HSAUR')
library(HSAUR)
data('Forbes2000')
ds <- Forbes2000
ds[!complete.cases(ds),]   # 결측값 확인

str(ds)
head(ds)
View(ds)

table(ds$country)
tmp <- sort(table(ds$country), decreasing = T) # decreasing = T 내림차순 정렬
top.10.contry <- tmp[1:10]
top.10.contry                                  # 상위 10개국

par(mar=c(8,4,4,2))
barplot(top.10.contry,
        main='기업수 상위 10개국',
        col=rainbow(10),
        las=2)

par(mar=c(5,4,4,2))


# 업종별 기업 통계
table(ds$category)
tmp <- sort(table(ds$category), decreasing = T) # decreasing = T 내림차순 정렬
top.10.categoty <- tmp[1:10]
top.10.categoty  

par(mar=c(10,4,4,2))                           # 그래프 여백 조정
barplot(top.10.categoty,
        main='기업수 상위 10개 업종',
        col= 'pink',
        las=2)

par(mar=c(5,4,4,2))


# 업종별 기업자산 분포
tmp <- ds[ds$category %in% names(top.10.categoty),]  # A %in% B 연산 (A에 있는 값들 중 B에 속하는 값들을 찾는 역할)
levels(tmp$category)
tmp$category <- factor(tmp$category)                 # mp$category <- factor(tmp$category) :10개 업종의 그룹 정보로 재설정
levels(tmp$category)
par(mar=c(10,4,4,2))
boxplot(assets~category, data=tmp,                   # 기업자산과 카테고리
        ylim=c(0,100),
        xlab = '  ',
        las=2)

par(mar=c(5,4,4,2))


# 기업 가치 상위 10대 기업
tmp <- ds[order(ds$marketvalue, decreasing = T),]
head(tmp$marketvalue)
tmp[1:10,c('name','country','category','marketvalue')]

# 한국 기업 정보
korea <- subset(ds, country=='South Korea')
str(korea)
korea[,c('rank','name','category','marketvalue')]

# 기업 가치와 타 변수와의 상관관계
tmp <- ds[,5:8]
tmp <- tmp[complete.cases(tmp),]     # 결측값 제거
str(tmp)
plot(tmp, lower.panel=NULL)          # (널 패널 제외)산점도 
cor(tmp)                             # 상관계수
