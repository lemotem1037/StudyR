## 데이터 분석3
# 부동산 매매
getwd()

install.packages("data.table")
library(data.table)

install.packages("dplyr")
library(dplyr)

install.packages("ggplot2")
library(ggplot2)

install.packages("lubridate")
library(lubridate)

install.packages("stringr")
library(stringr)

install.packages("forecast")
library(forecast)

install.packages('randtests')
library(randtests)


load(file = './result_sales_dt.RData')
str(result_sales_dt)
unique(result_sales_dt$yyyyqrt)

glimpse(result_sales_dt, width=60)

# 분기별 이파트 매매건수
# 쿼터별 매매량 계산
qrt_cnts <- result_sales_dt[,.N,yyyyqrt]
str(qrt_cnts)
head(qrt_cnts)
tail(qrt_cnts)
qrt_cnts <- result_sales_dt[yyyyqrt != '2015Q2', .N,yyyyqrt]

ggplot(qrt_cnts, aes(x=yyyyqrt, y=N,group=1))+
  geom_line() + xlab('년도분기') + ylab('매매건수') +
  theme(axis.text.x = element_text(angle=90)) +
  stat_smooth(method = 'lm')

# 분기별/지역별 매매추이
region_cnts <- result_sales_dt[yyyyqrt != 'ds.2015Q2', .N,.(yyyyqrt, region)]
head(region_cnts)

ggplot(region_cnts, aes(x=yyyyqrt, y=N, group=region)) +
  geom_line() + facet_wrap(~region,scales = 'free_y',ncol = 3) +    # facet_wrap 
  stat_smooth(method = 'lm') + theme(axis.text.x = element_blank())


# 월별 지역별 매매량
region_cnts <- result_sales_dt[,.N,.(yyyymm,region)]
head(region_cnts)

# 대표지역 추출
regions <- unique(region_cnts$region)

# 각 지역별로 매매량의 랜덤성 검정 결과를 runs_p 변수에 추가
runs_p <- c()
for(reg in regions){
  runs_p <- c(runs_p, runs.test(region_cnts[region %chin% reg, N])$p.value)
}

ggplot(data.table(regions, runs_p), aes(x=regions, y=runs_p, group=1)) +
  geom_line() + geom_point() + ylab('P-value') + xlab('지역')


# 시계열 분할(서울지역)
seoul_cnts <- result_sales_dt[yyyymm != '201504' & region %chin% '서울',.N,.(yyyymm)]
tot_ts <- ts(seoul_cnts$N,star = c(2006,1), frequency = 12)
plot(stl(tot_ts,s.window = 'periodic'))


# 부산 지역 패턴 분석
busan_cnts <- result_sales_dt[yyyymm != '201504' & region %chin% '부산',.N,.(yyyymm)]
head(busan_cnts)
tot_ts <- ts(busan_cnts$N, star = c(2006,1), frequency = 12)  # 2006년 1월부터 시작, 빈도수 12개월(월별)
plot(stl(tot_ts, s.window = 'periodic'))


# 시계열 분할에 대한 모형가정
arima_mdl <- auto.arima(tot_ts)     # 계절성 데이터를 분석할 때 arima사용
tsdiag(arima_mdl)

# 서울지역 아파트 매매량 예측
plot(forecast(arima_mdl, h=8))   # h=8- 8 번까지 예측

