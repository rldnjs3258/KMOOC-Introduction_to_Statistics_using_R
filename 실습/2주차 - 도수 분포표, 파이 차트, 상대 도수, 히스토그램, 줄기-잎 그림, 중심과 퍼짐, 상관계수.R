이 강의노트는 KMOOC강좌 - "R을 이용한 통계학 개론" - 에 사용되는 R code를 
목차별로 정리한 것입니다.  이 노트는 본 강좌를 수강하는 학생들의 효율적 학습을 
위한 용도로 개발되었으며 무료입니다.  본 강좌 이외의 상업적 용도로 사용하실 수 
없읍니다. 2017년 부산대학교 통계학과 교수 김충락

# 오늘의 팁!
# 1. R에서는 [행,열]로 행열을 구분한다.

2.2 표와 그래프
(1) 질적자료
1) 도수 분포표 (frequency table)
a <- rep('A', 1520) # 변수 a에 'A' 1520개를 담는다.
b <- rep('B', 770) # 변수 b에 'B' 770개를 담는다.
c <- rep('C', 510) # 변수 c에 'C' 510개를 담는다.
x <- c(a,b,c) # 변수 x에 a, b, c를 담는다.

# table() : 도수 분포표 만들기
table(x)
# A   B   C
#1520 770 510

# as.matrix() : 형태를 행렬 형태로 바꾼다.
y <- as.matrix(table(x)) # table(x)를 행렬 형태로 바꾸어 y에 저장한다.
y
# A 1520
# B 770
# C 510

# y의 1열을 freq에 저장하기
freq <- y[,1]
freq
# A   B   C
#1520 770 510

# 상대도수 (비율) : 도수 / 전체 도수의 합
relative_freq <- freq/sum(y) # 상대도수
# A     B     C
#0.542  0.275 0.182

# cbind() : column별로 bind를 하게 한다.
# 도수와 상대도수를 하나의 표로 만들기
z <- cbind(freq, relative_freq)
z
#   freq  relative_freq
# A 1520  0.542
# B 770   0.275
# C 510   0.182


2) 파이 차트 (pie chart)
x <- c(1520, 770, 510)
lab <- c('A', 'B', 'C')

# round(, digits=1) : 소숫점 1자리에서 반올림한다.
# 상대도수 (퍼센트) : 도수 / 전체 도수의 합 * 100
y <- round(x/sum(x)*100, digits=1)
y
# 54.3  27.5  18.2

# paste() : 붙인다.
w <- paste(lab, '(', y, '%', ')')
w
# "A ( 54.3 % )" "B ( 27.5 % )" "C ( 18.2 % )"

# pie(값, labels=라벨, main='제목') : 파이차트 생성 
pie(x, labels=w, main='파이차트')


3) 상대도수 예제
x <- c(1,1,1,3,0,0,1,1,1,0,2,2,0,0,0,1,2,1,2,0,0,1,6,4,3,3,1,2,4,0)

# table(x)로 도수분포표를 만들고, 세로형의 표로 만든다.
y <- as.matrix(table(x))
y
# [,1]
# 0    9
# 1   10
# 2    5
# 3    3
# 4    2
# 6    1

# 도수분포표를 가로형의 표로 만든다.
freq <- y[,1]
freq
# 0  1  2  3  4  6 
# 9 10  5  3  2  1 

# 상대도수 (비율) : 도수 / 전체 도수의 합
rel_freq <- freq/sum(freq)
rel_freq

# cumsum : 누적합
# 누적 도수 : 도수의 누적합
csum <- cumsum(freq)
csum
# 0  1  2  3  4  6 
# 9 19 24 27 29 30

# 누적 상대도수 (비율) : 누적합 / 전체 도수의 합
c_rel_freq <- csum/sum(freq)

# 도수, 상대도수, 누적 도수, 누적 상대도수를 표로 만든다.
z <- cbind(freq, rel_freq, csum, c_rel_freq)
z
#   freq   rel_freq csum c_rel_freq
# 0    9 0.30000000    9  0.3000000
# 1   10 0.33333333   19  0.6333333
# 2    5 0.16666667   24  0.8000000
# 3    3 0.10000000   27  0.9000000
# 4    2 0.06666667   29  0.9666667
# 6    1 0.03333333   30  1.0000000


4) 히스토그램 (histogram)
# hist() : 히스토그램 그리기
hist(faithful$waiting) # faithful 중 waiting 열을 히스토그램으로 그려라.


5) 줄기-잎 그림 (stem-and-leaf plot)
# stem() : 줄기-잎 그림 그리기
stem(faithful$waiting) # faithful 중 waiting 열을 줄기-잎 그림으로 그려라.


2.3 중심과 퍼짐 측도
x <- stackloss$stack.loss # R의 내장 데이터를 x에 저장한다.
x
# 42 37 37 28 18 18 19 20 15 14 14 13 11 12  8  7  8  8  9 15 15

# mean() : 평균
mean(x) # 17.52

# var() : 분산
var(x) # 103.46

# sd() : Standard deviation
sd(x) # 10.17

# sort() : 오름차순 정렬
s <- sort(x)
s # 7  8  8  8  9 11 12 13 14 14 15 15 15 18 18 19 20 28 37 37 42

# length() : 길이를 확인한다.
length(x)

# quantile() : 백분위수 계산
quantile(x, c(0.1,0.25,0.5,0.95))
# 10% 25% 50% 95% 
#   8  11  15  37
# np = 21 * 0.10 = 2.1 => 3번째 값 => 8
# np = 21 * 0.25 = 5.25 => 6번째 값 => 11 ...

# fivenum() : '최소값, 제 1사분위수, 제 2사분위수, 제 3사분위수, 최대값'을 보여준다.
fivenum(x)
# 7 11 15 19 42

# summary() : '최소값, 제 1사분위수, 중앙값, 평균값, 제 3사분위수, 최대값'을 보여준다.
summary(x)

# boxplot() : boxplot을 보여준다.
boxplot(x)


2.4 이변량 자료와 상관계수
x <- faithful$eruptions
y <- faithful$waiting

# plot() : x축 값, y축 값을 지정하여 플롯을 그린다.
plot(x,y)

# cor() : 표본 상관계수를 구한다.
cor(x,y) # 0.90