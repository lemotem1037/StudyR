## Oracle 연결
# 한글 접속 오류 - 'euc-kr' / not utf-8

# 1. RODBC 패키지 설치
install.packages('RODBC') # ROracle Open DataBase Connectity
# JAVA DB Connrctity
## 2. library 연결
library(RODBC)

## 3. ODBC 데이터 원본 (64비트) 설정
conn1 = odbcConnect('SCOTT_DSN', uid = 'scott', pwd = 'tiger', 
                    DBMSencoding = 'euc-kr', believeNRows = F)

## 4. 연결확인
summary(conn1)

## 5. 쿼리 실행
sqlQuery(conn1,'SELECT * FROM emp')
str(res)

## 6. 접속
odbcClose(conn1)
conn1
