## 패키지 성치 및 로ㄷ,
install.packages('')
install.packages('ggplot2')
library(ggplot2)
library(g.data)

ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width)) + geom_point()

## cowsay 패키지
install.packages(cowsay)
library(cowsay)

say(what = 'Hi~', by = 'cow', by_color = 'blue', what_color = 'green')

# 시스템 함수
Sys.Date()
Sys.time()


# 생일 맞추기  - == ? ((m*4)+9)*25 + d
# 소윤  주연  민철   석준   현석
# 931   753   1029   1139   1442

(m * 4)* 25 + (9*25) + d   # (m * 100) + 225 + d

(n - 225 - 21) / 100
(1146 - 225) / 100
(1442 - 225) /100   # 현석 12월 17일
(931 - 225) / 100  # 소윤 7월 6일

val = 931
d <- (val - 225)%% 100
m <- ((val- 225) - (val - 225)%%100)/100
cat(m, '월', d, '일')



