## 팩터
bt <- c('A', 'B', 'B', 'O', 'AB', 'A')
bt.new <- factor(bt)
bt.new 
bt[5] # 5번째 값을 출력
bt.new[1]
levels(bt.new) # 팩터에 저장된 값의 종류를 출력력
as.integer(bt.new) # 문자값을 숫자로 변경하여 출력
bt.new[7] <- 'B' # 팩터 bt.new의 7째에 삽입
bt.new[8] <- 'O'
bt.new[9] <- 'C' #NA가 할당
bt.new

## 리스트
h.list <- c('balling', 'tennis', 'ski') 
person <- list(name='Johan', age=25, student=TRUE, hobby=h.list)
person   # == person[] 같은 값을 출력력
person[[1]] 

person$name # 리스트에서 값의 이름이 name인 값을 출력
person$age
person$student
person$hobby[1] # 취미 중 첫번째 값만 출력력

person[[4]] [2]


# 리스트와 팩터를 이용하여 카페 매출액 분석2
cafe <- list(espresso <- c(4,5,3,6,5,4,7),
             americano <- c(63,68,64,68,72,89,94),
             latte <- c(61,70,59,71,71,92,88),
             price <- c(2000, 2500, 3000),
             menu <- c('espresso', 'americano', 'latte'))

cafe

sale.espresso <- cafe$espresso * cafe$price[1]
sale.espresso

cafe$menu <- factor(cafe$menu)
cafe$menu      

names(cafe$price) <- cafe$manu
cafe$price

sale.espresso <- cafe$espresso * cafe$price[1]
sale.espresso <- cafe$espresso * cafe$price['espresso']
sale.espresso

sale.americano <- cafe$americano * cafe$price['americano']
sale.americano

sale.latte <- cafe$americano * cafe$price['americano']
sale.latte 

sale.day <- sale.espresso + sale.americano + sale.latte
sale.day
sale.total <- sum(sale.day)
sale.total 

sale.mean.new <- mean(sale.day)

names(sale.day) <- c('Mon', 'Tue', 'Wed', 'Thu', 'Fry', 'Sat', 'Sun')
sale.day

names(sale.day[sale.day >= sale.mean.new])

# 월별 감전 사고 통계

accident <- c(31,26,42,47,50,54,70,66,43,32,32,22)
mon <- 1:12
mon.name <- paste('M', mon, spe='')
mon.name
names(accident) <- mon.name
accident

sum(accident)
max(accident)

accident - (accident * 0.1) # 사고율이 10%로 감소한 사고 수를 예측
accident*0.9

accident[accident >=50]

mean(accident)

accident[accident >= mean(accident)]



