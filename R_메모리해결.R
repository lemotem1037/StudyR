## 메모리 문제 RStudio 가 느려질 때 해결
# memory.size()
# memory.limit()

# R에 있는 파일을 모두 자움
rm(list = ls())
gc()   # garbage collection

# Tools > Global Options
# General > Restore previosly open source ~ 체크 해제
