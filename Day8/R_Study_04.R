## 통계 분석 기법을 이용한 가설 검정
library(ggplot2)

mpg <- as.data.frame(ggplot2::mpg)

library(dplyr)

mpg_diff <- mpg %>%         # mpg_diff라는 변수에 삽입 / 단축기cntl+shift+m == %>% 
  select(class, cty) %>%
  filter(class %in% c('compact', 'suv'))

unique(mpg_diff$class)
head(mpg_diff)
table(mpg_diff$class)

t.test(data = mpg_diff, cty~class, var.equla = T) # cty~class 두개의 변수 / var.equla = T 는 두 변수(cty~class)가 분산이 같다는 전제하에 실행


## 일반 휘발유와 고급 휘발유의 도시 연비 t 검증

mpg_diff2 <- mpg %>% 
  select(fl, cty) %>% 
  filter(fl %in% c('r','p'))

table(mpg_diff2$fl)

t.test(data = mpg_diff2, cty ~ fl, var.equal = T)



## 실업자 수와 개입 소비 지출의 상관관계
economics <- as.data.frame(ggplot2::economics)

cor.test(economics$unemploy, economics$pce)

# 히트맵 생성
head(mtcars)
car_cor <- cor(mtcars)     
round(car_cor, 2)

install.packages("corrplot")
library(corrplot)

# 숫자로 표기
corrplot(car_cor, method = 'number')

col <- colorRampPalette(c('#BB4444', '#EE9988', '#FFFFFF', '#77AADD', '#4477AA'))

corrplot(car_cor,
         method = "color",      # 색깔로 표현
        col = col(200),         # 색상 200 개 선정
         type = "lower",        # 왼쪽 아래 행렬만 표시
         order = "hclust",      # 유사한 상관계수끼리 군집화
         addCoef.col = "black", # 상관계수 색깔
         tl.col = "black",      # 변수명 색깔
         tl.srt = 45,           # 변수명 45 도 기울임
         diag = F)              # 대각 행렬 제외 )







