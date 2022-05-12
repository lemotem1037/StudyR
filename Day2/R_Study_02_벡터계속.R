## 함수
y <- sqrt(x = 100, y = 1)
y

y <- c(1,7,4,2,5)
y
sort(x = y)
sort(y, decreasing = T) #F:오름차순 T:내림차순
sort(y, decreasing = T, na.last = F) # 별측값은 제일 마지막

sort()

# 문자열 붙이기 함수
paste('heloo', 'world','!', 'this','is','R')
paste('heloo', 'world','!', sep = ' | ', collapse = NULL)

a <- '나의 나이는'
b <- 25
c <- '입니다.'
paste(a, b, c)

a <- 1:12
b <- '월'
c <- paste(a, b, sep='')
c

##월별 매출액 분석
sales <- c(750,740,760,680,700,710,850,890,700,720,690,730)
names(sales) <- paste(1:12, '월', 'sep=' ')
sales

sales ['7월']
sales ['1월'] + ['2월']
max.sales.month <- sort(sales, decreasing = T)
max.sales.month[1]

sum(max.sales.month) 아무것도 안 넣으면 전체 매출
sum(sales[1:6]) # 1-6월까지 상반기 매출
sum(sales[7:12]) # 7-12월까지 하반기 매출








