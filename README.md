# 스프링 프로젝트
## 탄소 배출권 거래 시뮬레이션 웹사이트

### [프로젝트 개요] (###프로젝트-개요)
### [기능] (###기능)
### [DB 설계] (###DB-설계)
### [개발 환경] (###개발-환경)

### 프로젝트 개요
#### 프로젝트 주제
##### 기존의 탄소시장 데이터를 이용해 탄소 배출권 구매, 판매를 시뮬레이션 해볼 수 있는 웹사이트
#### 필요성 및 목적
##### 탄소 배출권과 탄소 시장에 대한 이해, 가상 환경에서 탄소 배출권 거래를 통한 탄소 배출권 거래 전략 학습, 최종적으로 탄소 시장 탄생 배경 원인인 탄소 중립 실현 의의 재확립

#### 배출권 거래제란?
##### 탄소 배출량이 증가함에 따라 탄소 중립을 실현하기 위해 일부 기업들에게 적용중인 제도
##### 환경부에서 지정한 각 기업 탄소 배출 할당량보다 실제 배출량이 적은 기업은 잉여 배출량을 탄소 배출권으로 타 기업에 판매할 수 있고, 배출량이 더 많은 기업은 탄소 시장에서 배출권을 구매해야 함
##### 기업에게 탄소 저감을 유도하고, 탄소 중립 실현에 대한 경제적 보상을 준다

### 기능
|중기능|단위기능|기능설명|권한|구현여부|
|:---:|---|---|---|:---:|
||1.1 회원가입|사용자가 회원가입을 한다.|사용자|O|
||1.2 로그인|아이디와 패스워드를 통해 로그인을 한다.|사용자|O|
|1. 계정관련|1.3 ID찾기/ PW초기화|사용자의 ID를 찾거나 PW를 초기화 한다.|사용자|O|
||1.4 비밀번호 수정|사용자의 PW를 수정한다.|사용자|O|
||1.5 회원탈퇴|사용자가 회원 탈퇴를 한다.|사용자|O|
||2.1 페이지 소개|배출권 거래 시뮬레이션에 대해 설명하는 페이지를 사용자에게 보여준다.|시스템|O|
|2. 정보 관련|2.2 탄소시장 소개|탄소시장에 대해 소개하고 설명하는 페이지를 사용자에게 보여준다.|시스템|O|
||2.3 시뮬레이션 소개|시뮬레이션의 전체적인 스토리보드에 대해 설명하는 페이지를 사용자에게 보여준다.|시스템|O|
||3.1 종목 및 기업 배정|시뮬레이션 시작시 종목과 기업을 임의로 배정한다.|시스템|O|
||3.2 배출권 구매 및 판매|해당 날짜에 해당 기업의 배출권을 구매, 판매한다.|사용자|O|
|3. 거래 시뮬레이션 관련|3.3 시뮬레이션 결과 보기|시뮬레이션이 모두 끝난 후 시뮬레이션의 결과를 보인다.|시스템|O|
||3.4 시뮬레이션 결과 로그 보기|시뮬레이션 도중 자신의 구매, 판매 기록을 본다.|사용자|X|
||3.5 시뮬레이션 결과 저장|시뮬레이션의 결과 및 로그를 저장한다.|사용자|X|
||3.6 시뮬레이션 결과 삭제|저장된 시뮬레이션 결과 및 로그를 삭제한다.|사용자|X|

### DB 설계
![ex_capstone2](./capstone2(2).png)

### 개발 환경
#### 개발 언어 : JAVA, HTML, CSS, JS
#### IDE : Spring Tools Suites
#### DBMS : MySQL

### PPT 자료
#### [스프링 프로젝트](https://docs.google.com/presentation/d/184EQ7l2QJPClm4_PyU_Zb6_BQGXaoEryLRbjxmhoxIs/edit#slide=id.p1)
