## 데이터 입출력
setwd('C:/STUDY/StudyR/Day4')   # woking 디렉토리 지정
print('hellow R!')

#실행결과를 저장
# append -> 이전 문서 다음 뒤, 계속 붙이기 / append = F 파일 새로 생성
sink('result.txt', append = T)  
a <- 10
b <- 20
cat('a+b=', a + b, '\n')

print('HEY')
sink()  # 연 파일을 받아 줌


sink('result.txt', append = T)

iris
tail(iris)
sink()

# txt. 파일 읽기 / 구분자는 공백 or 탭탭
air.txt <- read.table('./airquality.txt', header = T, sep=' ')
air.txt

# csv파일도 read.table()로 로드 가능. 단 sep=',' 구분자가 쉼표
air.csv <- read.table('../airquality.csv', header = T, sep=',')
air.csv

## 엑셀 패키지
install.packages('readxl') # 엑셀 읽기용 패키지
library(readxl)

air.xlsx <- read.excel('../airquality.xlsx')
air.xlsx

install.packages('openxlsx')  # 엑셀 쓰기용 패키지
library(openxlsx)

write.xlsx(result, 'bmi_result.xlsx', rowNames = F)



## LAB 체질량 지수 계산하기2 
library(svDialogs)
height <- dlgInput('키 입력(cm)')$res
weight <- dlgInput('몸무게 입력(kg)')$res
height <- as.numeric(height)
weight <- as.numeric(weight)

height.unit <- height / 100
bmi <- weight / (height.unit^2)

sink('bmi.txt', append = T)
cat('height', 'weight', 'bmi')
cat(height.unit * 100, weight, bmi)
cat('\n')
sink()

result<- read.table('./bmi.txt', heard = T, sep= ' ')
result

names(result) <- c('키',' 몸무게','체질량질수')
result
write.table(result,'./bmi.txt', row.names  = F)


## LAB 자동차 정보 조회
library(svDialogs)
library(readxl)
library(openxlsx)

carprise.new <- read.csv('./carprice.csv', header = T)
#carprise.new 
View(carprise.new)

input.tpye <- dlgInput('차량타입 입력(Compact, Small, Midsize, Large, Sporty, Van)')$res
input.city <- dlgInput('최소 시내연비 입력')$res
input.city <- as.numeric(input.city)  # input.city의 값이 문자에서 숫자로 바뀜

result <- subset(carprise.new, Type == input.type & MPG.city >= input.city)
result

write.xlsx(result, './van_result.txt', rowNames = F)

## Oracl 연동
install.packages('rJava')
install.packages('RJDBC')
library(rJava)
library(RJDBC)

# DB연결 설정
jdbcDriver <- JDBC(driverClass = 'oracle.jdbc.OraclDriver',
                   classPath = './Day4/ojdbc6.jar')





