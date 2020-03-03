이 강의노트는 KMOOC강좌 - "R을 이용한 통계학 개론" - 에 사용되는 R code를 
목차별로 정리한 것입니다.  이 노트는 본 강좌를 수강하는 학생들의 효율적 학습을 
위한 용도로 개발되었으며 무료입니다.  본 강좌 이외의 상업적 용도로 사용하실 수 
없읍니다. 

2017년 부산대학교 통계학과 교수 김충락


1. R 사용법
A. 주의할 점
(1) 대소문자에 민감한 언어이다.
(2) 코맨드는 ';' 혹은 새로운 라인으로 구분한다.
(3) 주석을 '#'으로 지정한다.
(4) 라인의 제일 마지막에 '+'를 사용해서 다음 라인으로 넘어갈 수 있다.


B. 내장 기능 (Inbuilt facilities)
(1) help, example, demo
# help() : solve 명령어 사용법에 대해 설명해 줌
help(solve)

# example() : solve 명령어의 예제를 보여 줌
example(solve)

# demo() : persp 명령어에 대한 예시를 보여 줌
demo(persp)

(2) data
# data() : R에 내장되어 있는 자료파일을 불러올 수 있음
# women, stackloss, faithful, sleep 등의 변수를 통해 해당 데이터 이용 가능
data()

- women (height, weight, n=15)
- stackloss (Air.Flow, Water.Temp, Acid.Conc., stack.loss, n=21)
- faithful (eruptions, waiting, n=272)
- sleep (extra, group, n=20)


(3) libraries
- R에는 유용한 라이브러리들이 많다.
- lattice : lattice graphics
- MASS : Modern Applied Statistics using S-Plus
- mgcv : generalized additive models
- nlme : mixed effects models
- nnet : neural networks and multinomial log-linear models
- spatial : spatial statistics
- survival : survival analysis

ex) survival 라이브러리 이용해보기.
#library() : 라이브러리 이용
#library(help=) : 라이브러리 이용법 확인
library(help=survival)

(4) packages
패키지 속에 라이브러리가 들어 있는 경우, 패키지를 인스톨 한 후 라이브러리를 사용하자.

(5) R 내장 데이터 이용
MASS 라이브러리 속의 bacteria 데이터 셋을 이용해 보자.
library(MASS); attach(bacteria); bacteria


2.1 벡터 연산
x <- c(10.4, 5.6, 3.1, 6.4, 21.7) # 변수 x에 지정 컬럼을 넣는다.
assign("x", c(10.4, 5.6, 3.1, 6.4, 21.7)) # 위와 같은 표현
c(10.4, 5.6, 3.1, 6.4, 21.7) -> x # 위와 같은 표현
x # x 값 확인. 10.4, 5.6, 3.1, 6.4, 21.7

1/x # x 변수 속의 각 값의 역수를 구한다. 0.096, 0.178, 0.322, 0.156, 0.046

y <- c(x, 0, x) # y에 x의 값, 0, x의 값 순서로 칼럼을 구성하여 넣는다.
y # y 값 확인. 10.4, 5.6, 3.1, 6.4, 21.7, 0, 10.4, 5.6, 3.1, 6.4, 21.7


2.2 Vector arithmetic
15/7 # 실수 연산. 2.142857
15%/%7 # 실수 연산 후 몫만 확인. 2
15%%7 # 실수 연산 후 나머지만 확인. 1

# var() : 표본분산
sum((x-mean(x))^2)/(length(x)-1) # x 표본분산 방법1
var(x) # x 표본분산 방법2

# sqrt() : 제곱근
sqrt(4) # 제곱근. 2


2.3 숫자 생성
1:30 # 1~30 정수 나열
c(1:30) # 1~30을 컬럼으로 만들어라
t <-c(1:30)

# seq() : 수열 생성
s3 <- seq(-5, 5, by=.2) # -5 ~ 5를 0.2부터 증가시키며 수열을 만들어라
s3 # -5.0, -4.8, -4.6 ... 4.8, 5.0

s4 <- seq(length=51, from=-5, by=.2) # -5부터 0.2부터 증가시키며 51개의 수열을 만들어라
s4 # -5.0, -4.8, -4.6 ... 4.8, 5.0

# rep() : 반복 생성
s5 <- rep(x, times=5) # 변수 x를 5번 반복하여 s5에 넣어라
s5 # 10.4, 5.6, 33.1, 6.4, 21.7, 10.4 ...

s6 <- rep(x, each=5) # 변수 x의 각 값을 5번씩 반복하여 s6에 넣어라
s6 # 10.4, 10.4, 10.4, 10.4, 10.4, 5.6 ...