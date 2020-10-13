# Doosan Bears 커뮤니티 & 쇼핑몰 Site

<br>
<p align="center"> <img src="https://user-images.githubusercontent.com/62025746/95829103-c787dc00-0d70-11eb-9dd9-cc9c21e7d3aa.png" width="600px"> </p>
<br><br><br>

## 프로젝트 설명

* **웹 페이지 제작 시 기본적인 기능들을 구현** <br><br>
* **재고관리 프로그램 (재고변경, 가격변경) 제작** <br><br>
* **포인트 충전, 구매, 구매리스트 관리 등 부가기능 제작** 
<br>
## 개발환경

* 개발도구
  * Eclipse
  * MySQL WorkBench
  <br>
* 언어
  * JAVA SE1.8 `JDK 8`
  * JSP `model 1`
  * HTML5/CSS3
  * JavaScript
  <br>
* 커뮤니티/서버(WAS)
  * Github
  * Apache Tomcat `v8.0`
  <br>
* FrameWork
  * Jquery
  
## Database
<br>
<p align="center"> <img src="https://user-images.githubusercontent.com/62025746/95739084-39a2e700-0cc5-11eb-9577-6fb907f23a17.png" width="600px"> </p>
<br><br>


## 기능구현 


* [로그인](#로그인)
* [회원정보 수정](#회원정보-수정)
* [회원가입](#회원가입)
* [주소검색 API 사용](#주소검색-API-사용)
* [댓글 작성](#댓글-작성)
* [갤러리 게시판](#갤러리-게시판)
* [온라인 쇼핑몰](#온라인-쇼핑몰)
* [재고관리 프로그램](#재고관리-프로그램)
* [게시판](#게시판)
* [자료실](#자료실)

<br><br>

### 로그인

<br>

* **공공데이터 에서 약 `53000개`의 약 정보를 파싱하여 DB에 저장함.** <br><br>
* **공공데이터 에서 약 `100개`의 약 부작용 정보를 파싱하여 DB에 저장함.** <br><br>
* **Jquery의 AutoComplete 기능을 이용하여 검색 시 `자동완성` 기능을 추가함.**

<br><br><br>
<p align="center">< 로그인 화면 ></p>
<p align="center"> <img src="https://user-images.githubusercontent.com/62025746/95829101-c6ef4580-0d70-11eb-9620-d04400366c7f.png"> </p>
<br><br>
<p align="center">< 로그인 성공시 ></p><br>
<p align="center"> <img src="https://user-images.githubusercontent.com/62025746/95829099-c5be1880-0d70-11eb-965c-dbf7a1c6709b.png" width="600px"> </p>

<hr><br>

### 회원정보 수정

<br>

* **원하는 약을 선택한 후, 처방받은 `복용주기를 입력함.`** <br><br>
* **입력한 약의 이름을 `정보 테이블 , 부작용 테이블에 접근`하여 부합하는 정보를 가져와서 리스트로 나타냄.**

<br><br><br><br>
<p align="center">< 주기 입력 창 ></p><br>
<p align="center"> <img src="https://user-images.githubusercontent.com/62025746/95734698-c6967200-0cbe-11eb-8860-1502c735bc64.png" width="600px"> </p>
<br><br>
<p align="center">< 복용 리스트 출력 ></p><br>
<p align="center"> <img src="https://user-images.githubusercontent.com/62025746/95734722-cbf3bc80-0cbe-11eb-9557-fc9114361a22.png" width="600px"> </p>
<br><br>
<hr><br>

### 회원가입

<br>

* **복용이 완료된 약들은 복용 리스트에서 지워지고, `History 페이지에 자동으로 이동하여 저장`됨.**

<br><br>
<p align="center">< History ></p>
<p align="center"> <img src="https://user-images.githubusercontent.com/62025746/95734717-ca29f900-0cbe-11eb-81a3-e14d9739f9bb.png" width="600px"> </p>
<br><br>
<hr><br>

### 주소검색 API 사용

<br>

* **임의로 만든 약 동력 그래프를 시간에 따라 그리게 되고, 복용주기가 끝나면 그래프는 멈추도록 설계함.** <br><br>
* **약의 효과가 발현하는 55% 지점부터 (임의로 지정) 약 효과가 발현하고 있다는 신호를 주기위해 `gif 이미지를 띄워 표시함.`** <br><br>
* **입력한 재복용 주기만큼 시간이 지나면 사용자의 휴대전화로 `재복용 알람 문자 메세지를 전송함.`**

<br><br><br><br>
<p align="center"> <img src="https://user-images.githubusercontent.com/62025746/95734719-cb5b2600-0cbe-11eb-9382-84f5afa0208d.png" width="600px"> </p>
<br><br>
<p align="center"> <img src="https://user-images.githubusercontent.com/62025746/95734719-cb5b2600-0cbe-11eb-9382-84f5afa0208d.png" width="600px"> </p>
<br><br> 
<p align="center"> <img src="https://user-images.githubusercontent.com/62025746/95734742-d2823400-0cbe-11eb-9437-dc2633fc547e.png" width="600px"> </p>
<br><br>
<hr><br>

### 댓글 작성

<br>

* **공공데이터에서 약 `22000개`의 전국 약국정보를 파싱하여 DB에 저장함.** <br><br>
* **해당 약국의 위치를 표시하기 위해서` Marker` 기능을 사용하였고, 해당 마커의 정보를 표기하기 위해 `InfoWindow` 기능을 사용함.** <br><br>
* **Marker가 한 곳에 밀집되어 있을 때, 밀집된 Marker의 수를 표시하기 위해서 `Clusterer` 기능을 구현함.** <br><br>
* **광역시 시청을 기준으로 버튼 클릭 시 , `해당 좌표로 바로 이동`할 수 있도록 구현함.**

<br><br><br><br>
<p align="center"> <img src="https://user-images.githubusercontent.com/62025746/95738785-c00af900-0cc4-11eb-9c86-5a2b74e67851.png" width="600px"> </p>
<br><br>
<p align="center"> <img src="https://user-images.githubusercontent.com/62025746/95738771-ba151800-0cc4-11eb-8096-8fca86454a9c.png" width="600px"> </p>
<br><br>
<p align="center"> <img src="https://user-images.githubusercontent.com/62025746/95734753-d57d2480-0cbe-11eb-8e79-d81428cd699b.png" width="600px"> </p>
<br><br>
<p align="center"> <img src="https://user-images.githubusercontent.com/62025746/95738780-be413580-0cc4-11eb-9d40-2c987a2aa8cd.png" width="600px"> </p>
<br><br>
<hr><br>

### 갤러리 게시판

<br>

* **Admin으로 접속 했을 때에는 관리자 채팅 표시가 나타나게 하고, 일반 유저일 경우 실시간 상담 로고만 나타나도록 설정함.** <br><br>
* **관리자 채팅으로 접속 시, 일반 유저들이 작성 한 채팅창이 뜨게 작성하였고 `실시간 채팅`이 가능하도록 구현함.** <br><br>
* **일반 유저가 실시간 상담을 종료하면 관리자 채팅에서의 `채팅방도 사라지게 구현함.`**

<br><br><br><br>
<p align="center"> <img src="https://user-images.githubusercontent.com/62025746/95734757-d615bb00-0cbe-11eb-85e5-083338798c82.png" width="600px"> </p>
<br><br>
<p align="center"> <img src="https://user-images.githubusercontent.com/62025746/95734763-d7df7e80-0cbe-11eb-858b-cd1bae9a5081.png" width="600px"> </p>
<br><br>

### 온라인 쇼핑몰

<br>

* **Admin으로 접속 했을 때에는 관리자 채팅 표시가 나타나게 하고, 일반 유저일 경우 실시간 상담 로고만 나타나도록 설정함.** <br><br>
* **관리자 채팅으로 접속 시, 일반 유저들이 작성 한 채팅창이 뜨게 작성하였고 `실시간 채팅`이 가능하도록 구현함.** <br><br>
* **일반 유저가 실시간 상담을 종료하면 관리자 채팅에서의 `채팅방도 사라지게 구현함.`**

<br><br><br><br>
<p align="center"> <img src="https://user-images.githubusercontent.com/62025746/95734757-d615bb00-0cbe-11eb-85e5-083338798c82.png" width="600px"> </p>
<br><br>
<p align="center"> <img src="https://user-images.githubusercontent.com/62025746/95734763-d7df7e80-0cbe-11eb-858b-cd1bae9a5081.png" width="600px"> </p>
<br><br>

### 재고관리 프로그램

<br>

* **Admin으로 접속 했을 때에는 관리자 채팅 표시가 나타나게 하고, 일반 유저일 경우 실시간 상담 로고만 나타나도록 설정함.** <br><br>
* **관리자 채팅으로 접속 시, 일반 유저들이 작성 한 채팅창이 뜨게 작성하였고 `실시간 채팅`이 가능하도록 구현함.** <br><br>
* **일반 유저가 실시간 상담을 종료하면 관리자 채팅에서의 `채팅방도 사라지게 구현함.`**

<br><br><br><br>
<p align="center"> <img src="https://user-images.githubusercontent.com/62025746/95734757-d615bb00-0cbe-11eb-85e5-083338798c82.png" width="600px"> </p>
<br><br>
<p align="center"> <img src="https://user-images.githubusercontent.com/62025746/95734763-d7df7e80-0cbe-11eb-858b-cd1bae9a5081.png" width="600px"> </p>
<br><br>


### 게시판

<br>

* **Admin으로 접속 했을 때에는 관리자 채팅 표시가 나타나게 하고, 일반 유저일 경우 실시간 상담 로고만 나타나도록 설정함.** <br><br>
* **관리자 채팅으로 접속 시, 일반 유저들이 작성 한 채팅창이 뜨게 작성하였고 `실시간 채팅`이 가능하도록 구현함.** <br><br>
* **일반 유저가 실시간 상담을 종료하면 관리자 채팅에서의 `채팅방도 사라지게 구현함.`**

<br><br><br><br>
<p align="center"> <img src="https://user-images.githubusercontent.com/62025746/95734757-d615bb00-0cbe-11eb-85e5-083338798c82.png" width="600px"> </p>
<br><br>
<p align="center"> <img src="https://user-images.githubusercontent.com/62025746/95734763-d7df7e80-0cbe-11eb-858b-cd1bae9a5081.png" width="600px"> </p>
<br><br>

### 자료실

<br>

* **Admin으로 접속 했을 때에는 관리자 채팅 표시가 나타나게 하고, 일반 유저일 경우 실시간 상담 로고만 나타나도록 설정함.** <br><br>
* **관리자 채팅으로 접속 시, 일반 유저들이 작성 한 채팅창이 뜨게 작성하였고 `실시간 채팅`이 가능하도록 구현함.** <br><br>
* **일반 유저가 실시간 상담을 종료하면 관리자 채팅에서의 `채팅방도 사라지게 구현함.`**

<br><br><br><br>
<p align="center"> <img src="https://user-images.githubusercontent.com/62025746/95734757-d615bb00-0cbe-11eb-85e5-083338798c82.png" width="600px"> </p>
<br><br>
<p align="center"> <img src="https://user-images.githubusercontent.com/62025746/95734763-d7df7e80-0cbe-11eb-858b-cd1bae9a5081.png" width="600px"> </p>
<br><br>





