## 기본그래프
# 막대그래프 = Ban chart
favorite.season <- c('WINTER', 'SUMMER', 'SPRING', 'SUMMER', 'SUMMER',
                     'FALL', 'FALL', 'SUMMER', 'SPRING', 'SPRING')
favorite.season
ds<- table(favorite.season)   # 도수분포
ds

barplot(ds, main = '선호하는 계절')
barplot(ds, main = '선호하는 계절', 
        col = c('aliceblue', 'springgreen2', 'plum', 'palevioletred1'))

barplot(ds, main = '선호하는 계절', col = rainbow(4))

barplot(ds, main = '선호하는 계절', col = rainbow(4),
        xlab = '계절', ylab = '빈도수', horiz = T)  # horiz T 수평

colors() # 657개



barplot(ds, main = '선호하는 계절', col = rainbow(4),
        xlab = '계절', ylab = '빈도수', horiz = T,   # horiz F 세로
        names = c('가을','봄','여름','겨울'), las=1) # las 0-3까지 4가지














