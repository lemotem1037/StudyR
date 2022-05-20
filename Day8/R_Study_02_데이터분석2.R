## 데이터 분석
# 대기오염
setwd('c:/STUDY/StudyR/Day8')  
files <- c('ds.2015.csv','ds.2016.csv','ds.2017.csv','ds.2018.csv','ds.2019.csv') # 파일을 벡터화

ds <- NULL
for (f in files) {
  tmp <- read.csv(f, header = T)
  ds <- rbind(ds,tmp)
  print(f)
}

# 데이터 확인
str(ds)
head(ds)
unique(ds$loc)   # 유일값 함수 불러오기(중복제외) 관측 장소 
range(ds$mdate)  # 측정 기관

# 열별 결측값 확인
for (i in 3:8) {
  cat(names(ds)[i], sum(is.na(ds[,i])),  # i열에 있는 ~
      sum(is.na(ds[,i]))/nrow(ds), '\n')
}

ds <- ds[,-8]                    # PM5 열 제거
ds <- ds[complete.cases(ds),]    # 결측값 포함 행 제거

# 그룹 정보 추가
mdate <- as.character(ds$mdate)  # 인수형ㅇ안 mdate를 문자열로 변환하여 mdata에 선언
head(mdate)

# substr를 사용하여, mdata를 연도, 월, 시간으로 나눠줌
ds$year <- as.numeric(substr(mdate, 1,4))   # 연도 (2014라 1에서4자리)   
ds$month <- as.numeric(substr(mdate, 5,6))  # 월 (5,6 자리)
ds$hour <- as.numeric(substr(mdate, 9,10))  # 시간 (9,10번째 자리)
ds$locname <- NA                            # locname 열 추가
ds$locname[ds$loc==111123] <- '서울'        # loc에서 코드에 맞게끔 locname을 한글로 저장
ds$locname[ds$loc==336111] <- '목포' 
ds$locname[ds$loc==632132] <- '강릉'

head(ds)
View(ds)

# 지역별 PM10 농도 분포
boxplot(PM10~locname, data = ds,
        main='미세먼지 농도 분포')
boxplot(PM10~locname, data = ds,
        main='미세먼지 농도 분포',
        ylim=c(1,100), las =1)

# 연도별, 지역별 PM10 농도 추이
library(ggplot2)

tmp.year <- aggregate(ds[,7],
                      by=list(year=ds$year,loc=ds$locname), FUN='mean')
tmp.year$loc = as.factor(tmp.year$loc)
head(tmp.year)

ggplot(tmp.year, aes(x=year, y=x, colour=loc, group=loc)) +
  geom_line() + geom_point(size=6, shape=19, alpha=0.5)+
  ggtitle('연도별 PM10 농도 변화' ) + ylab('농도')


# 월별
tmp.month <- aggregate(ds[,7],
                      by=list(month=ds$month,loc=ds$locname), FUN='mean')
tmp.month$loc = as.factor(tmp.month$loc)
head(tmp.month)


ggplot(tmp.month, aes(x=month, y=x, color=loc, group=loc)) +
  geom_line() + geom_point(size=6, shape=19, alpha=0.5)+
  ggtitle('월별 PM10 농도 변화') + ylab('농도')


# 시간대별 (혼자 해보기)
tmp.hour <- aggregate(ds[,7],
                       by=list(hour=ds$hour,loc=ds$locname), FUN='mean')
tmp.hour$loc = as.factor(tmp.hour$loc)
head(tmp.hour)


ggplot(tmp.hour, aes(x=hour, y=x, color=loc, group=loc)) +
  geom_line() + geom_point(size=6, shape=19, alpha=0.5)+
  ggtitle('시간별 PM10 농도 변화') + ylab('농도')



# 오염 물질 농도 간의 상관관계
set.seed(1234)
plot(ds[sample(nrow(ds),5000),3:7], lower.panel=NULL)
cor(ds[,3:7])    # 산점도


# 미세먼지 최고점과 최저점 확인
tmp.yml <- aggregate(ds[,7], by=list(year=ds$year, month=ds$month, loc=de$locname), FUN='mean')
head(tmp.yml)

# 가장 미세먼지가 많았던 달
idx <- which(tmp.yml$x==max(tmp.yml$x))
tmp.yml[idx,]

idx <- which(tmp.yml$x==max(tmp.yml$x))
tmp.yml[idx,]

