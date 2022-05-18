## 고급 그래프
# treemap
install.packages('treemap')
library(treemap)

data("GNI2014")
GNI2014
head(GNI2014)

treemap(GNI2014, index = c('continent','iso3'),
        vSize = 'population', vColor = 'GNI', title = '대륙간 인구수',
        type = 'value', na.rm = T
        #bg.labels = 'yellow' 사용불가
        )


## LAB 미국 주요 도시 통계 데이터
library(carData)
head(Ericksen)
str(Ericksen)

ds <- subset(Ericksen, city=='state')
ds
ds$stname <- rownames(ds)

treemap <- rownames(ds)
treemap(ds, index=c('stname'),  # 타일에 주 이름 표기
        vSize='poverty',        # 타일의 크기
        vColor= 'crime',        # 타일의 컬러  
        type = 'value',         # 타일 컬러링 방법
        title='미국 범죄 도시 찾기')  # 제목


## 방사형 차트(radar chart)
install.packages('fmsb')
library(fmsb)

score <- c(80,60,95,85,40,65)
max.score <- rep(100,6)    # 100을 5회 반복
min.score <- rep(0,6)      # 0을 5회 반복
ds <- rbind(max.score,min.score, score)
ds
class(ds)
ds <- data.frame(ds)      # 매트릭스를 데이터프레임으로
class(ds)
ds
colnames(ds) <- c('국어','영어','수학','물리','음악','체육')
ds

radarchart(ds)

## 매개변수(옵션)
radarchart(ds,
           pcol = 'darkgreen',           # 다각형 선의 색
           pfcol = '#337F7F7F', # 다각형 내부 색rgb(0.2,0.5,0.5,0.5)('r'ed,'g'reen,'b'lue,'투명도')
           plwd = 3,                     # 선의 두께
           cglcol = 'grey',              # 거미줄 색
           cglty = 1,                    #   "    타입    
           cglwd = 0.8,                  #   "    두께
           axistype=1,                   # 축 레이블 타입 
           seg = 4,                      # 축 눈금 분할
           axislabcol = 'grey',          # 축 레이블 색
           caxislabels = seq(0,100,25)   # 축 레이블 값
           )


## LAB 종교 유무 조사 데이터 분석
library(carData)
str(WVS)
head(WVS)

pop <- table(WVS$country)     # 국가별 응답자 수
tmp <- subset(WVS, religion=='yes')
rel <- table(tmp$country)     # 국가별 종교가 있는 응답자 수
stat <- rel/pop               # 국가별 종교가 있는 응답자 수 비율
stat

# 데이터 프레임 생성
max.score <- rep(1,4)         # 최댓값
min.score <- rep(0,4)         # 최솟값
ds <- rbind(max.score,min.score, stat)
ds <- date.frame(ds)
ds
#방사형 차트 작성
radarchart(ds, pcol='red4', 
        fcol = '#7F3337F', plwd =2,
        cglcol='red', cglty = 1, cglwd = 0.8,
        axistype = 1, axislabcol = 'black',
        caxislabels = seq(0.1,0.3),
        title = '국가별 종교인 비율')


## ggplot
install.packages('ggplot')
library(ggplot2)

month <- c(1,2,3,4,5,6)
rain <- c(55,50,45,50,60,70)
df <- data.frame(month,rain)
df

# ggplot(data=xx, aes(z=z1,y=x2)) + geom_xx( ) + geom_yy( ) +
ggplot(df, aes(x=month, y=rain)) + 
  geom_bar(stat = 'identity',     # 막대그래프 형태 지정
           width = 0.8,           # 막대 폭 지정
           fill = 'skyblue')      # 막대 색 지정


# 가로 막대그래프
ggplot(df, aes(x=month, y=rain)) + 
  geom_bar(stat = 'identity',     
           width = 0.7,           
           fill = 'skyblue') +
  ggtitle('월별 강수량(1~6월)') + 
  labs(x = '월', y = '강수량') +
  coord_flip() + 
  theme(plot.title = element_text(size = 20, 
                                  face = 'italic', 
                                  color = 'darkblue',
                                  hjust = 0.5))      # 중앙 정렬

## 히스토그램
library(ggplot2)
# 교재용
ggplot(iris, aes(x=Sepal.Width, fill=Species, color=Species)) +
  geom_histogram(binwidth = 0.5, position='dodge') +
  theme(legend.position='top') # 범례의 위치


ggplot(data = iris, aes(x=Sepal.Width, fill=Species)) +
  geom_histogram() + geom_histogram(position = 'dodge') + 
  ggtitle('붓꽃 품종별 꽃받침 넓이 히스토그램')
  theme(legend.position = 'bottom')

  
  
## 산점도
ggplot(data = iris, aes(x=Petal.Length, y=Petal.Width, color=Species)) +
  geom_point(size=3) + ggtitle('붓꽃 품종별 꽃잎 산점도') +
  theme(plot.title = element_text(size=16, face = 'bold', color = 'darkblue', hjust = 0.5))
  

## 선그래프
year <- 1937:1960
cnt <- as.vector(airmiles)
df <- data.frame(year, cnt)  
df
ggplot(data=df, aes(x=year, y=cnt)) + geom_line(col='red',stat = 'identity')


## LAB Ariquality
library(ggplot2)
df <- aggregate(airquality[,'Temp'],
                by=list(month=airquality$Month),FUN=mean)

class(df)   # "data.frame"

colnames(df) <- c('month','temp')
# 막대그래프
ggplot(df, aes(x=month,y=temp)) +
  geom_bar(stat = 'identity', 
           width = 0.7,         # 미지정시 width = 0.9와 같음
           fill='darkgreen') +
  ggtitle('5개월 평균기온(화씨)')

# 산점도
df <- airquality[complete.cases(airquality),]   # 결측값 제거
str(df)
ggplot(data = df, aes(x=Temp, y=Ozone, color='orange')) +
  gemo_point(size=2)

cor(df$Temp, df$Ozone)     # 상관관계



## 실전분석
library(carData)
str(UN98)
help("UN98")

df <- UN98[, c('region', 'tfr')]
df <- df[complete.cases(df),]
df <- aggregate(df[,'tfr'], by=list(region=df$region), FUN='mean')

ggplot(df, aes(x=region,y=x)) + # 그래프를 그릴 데이터 지정
 geom_bar(stat='identity',  # 막대그래프의 형태 지정
                width=0.7, fill=rainbow(5)) # 막대의 폭과 색 지정


## treemap
df.tm <- UN98[,c('region','lifeFemale','illiteracyFemale')]
df.tm <- df.tm[complete.cases(df.tm),]             # 결측값 제거
df.tm$country <- rownames(df.tm)                   # 국가명을 열로 추가

treemap(df.tm, index=c('region','country'), vSize='lifeFemal', vColor='illiteracyFemale',
        type='value', bg.labels='yellow', title='여성의 수명과 문맹율')


## 산점도
df.edu <- UN98[,c('region','educationMale','educationFemale')]
df.edu <- df[complete.cases(df.edu),] 

ggplot(data=df.edu, aes(x=educationMale, y=educationFemale, color=region)) +
  geom_point(size=3) + ggtitle('남성, 여성의 교육수준') + 
  theme(plot.title = element_text(size=25, face='bold', colour='steelblue')) 






