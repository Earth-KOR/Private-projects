# Doosan Bears 커뮤니티 & 쇼핑몰 Site

<br>
<p align="center"> <img src="https://user-images.githubusercontent.com/62025746/95829103-c787dc00-0d70-11eb-9dd9-cc9c21e7d3aa.png" width="600px"> </p>
<br><br><br>
<hr>
<br><br>

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
* [댓글 작성](#댓글-작성)
* [갤러리 게시판](#갤러리-게시판)
* [온라인 쇼핑몰](#온라인-쇼핑몰)
* [재고관리 프로그램](#재고관리-프로그램)
* [게시판](#게시판)
* [자료실](#자료실)

<br><br>

### 로그인

<br>

* **ID 값과 PW 값을 받아서 DB에 부합하는 정보가 있는지 판단** <br><br>
* **부합하는 값이 존재하면 메인 페이지로 돌아가면서 해당 회원의 정보가 Header에 남도록 구현**

<br><br><br>
<p align="center">< 로그인 화면 ></p>
<p align="center"> <img src="https://user-images.githubusercontent.com/62025746/95829101-c6ef4580-0d70-11eb-9620-d04400366c7f.png"> </p>
<br><br>
<p align="center">< 로그인 성공시 ></p><br>
<p align="center"> <img src="https://user-images.githubusercontent.com/62025746/95829099-c5be1880-0d70-11eb-965c-dbf7a1c6709b.png" width="600px"> </p>

<hr><br>

### 회원정보 수정

<br>

* **수정 할 비밀번호와 수정 비밀번호 Check의 값이 다르면 경고창 출력** <br><br>
* **수정 할 비밀번호가 일치하면 데이터를 받아 DB에 접근하여 해당 아이디에 부합하는 비밀번호를 수정함**

<br><br><br><br>
<p align="center">< 회원 정보 수정 ></p><br>
<p align="center"> <img src="https://user-images.githubusercontent.com/62025746/95830199-492c3980-0d72-11eb-8d3b-74d6e69d6834.png" width="600px"> </p>
<br><br>
<p align="center">< 수정완료 알림 ></p><br>
<p align="center"> <img src="https://user-images.githubusercontent.com/62025746/95830202-4a5d6680-0d72-11eb-94b5-6e950156193a.png" width="600px"> </p>
<br><br>
<hr><br>

### 회원가입

<br>

* **회원가입 창에서 필요한 정보를 받아옴** <br><br>
* **다음 주소 API를 사용하여 주소목록을 받아옴** <br><br>
* **JavaScript의 AJax 기술을 이용하여 비동기 방식으로 아이디 중복 확인을 실행함**

<br><br>

<p align="center">< 회원가입 기본 창 ></p>
<p align="center"> <img src="https://user-images.githubusercontent.com/62025746/95830804-32d2ad80-0d73-11eb-931a-dbcaddb1f398.png" width="600px"> </p>

<br><br>

<p align="center">< 다음 주소 API ></p>
<p align="center"> <img src="https://user-images.githubusercontent.com/62025746/95830802-323a1700-0d73-11eb-9a83-1b9251cec4fc.png" width="600px"> </p>

<br><br>

<p align="center">< Ajax 작동 ></p>
<p align="center"> <img src="https://user-images.githubusercontent.com/62025746/95830795-3108ea00-0d73-11eb-8361-ce33d879e950.png" width="600px"> </p>
<br><br>

<hr><br>

### 댓글 작성

<br>

* **게시판 바로 밑에 새로운 테이블을 만들어서 댓글창을 구성함** <br><br>
* **자료실, 게시판 댓글을 구분하기 위해서 식별자를 DB에 저장함** <br><br>
* **댓글은 시간별로 오름차순 정렬을 실시하여 제일 최신 댓글을 위로 올라오도록 구현함.**

<br><br><br><br>

<p align="center">< 게시판 댓글 ></p>
<p align="center"> <img src="https://user-images.githubusercontent.com/62025746/95837932-24d55a80-0d7c-11eb-81c2-f58227636d21.png" width="600px"> </p>

<br><br>

<p align="center">< 자료실 댓글 ></p>
<p align="center"> <img src="https://user-images.githubusercontent.com/62025746/95837926-23a42d80-0d7c-11eb-8a31-c93a40d709d7.png" width="600px"> </p>

<br>

<hr>

<br>

### 갤러리 게시판

<br>

* **갤러리를 게시 할 때, 대분류를 미리 설정하여 특정 대분류에 따라서 뜨는 이미지를 다르게 구현함 ** <br><br>
* **이미지를 클릭 할 때, 이미지 업로드 시 작성했던 정보들이 나타나게 구현함.** <br><br>
* **이미지를 클릭 할 때, 이미지 삭제 기능을 구현함.**

<br><br><br><br>

<p align="center">< 갤러리 메인화면 ></p>
<p align="center"> <img src="https://user-images.githubusercontent.com/62025746/95838273-8ac1e200-0d7c-11eb-85b7-e03bd3a3d179.png" width="600px"> </p>

<br><br>

<p align="center">< 이미지 등록 ></p>
<p align="center"> <img src="https://user-images.githubusercontent.com/62025746/95838266-88f81e80-0d7c-11eb-8f74-99ad1f837ed7.png" width="600px"> </p>

<br><br>

<p align="center">< 이미지 상세정보 ></p>
<p align="center"> <img src="https://user-images.githubusercontent.com/62025746/95838270-8a294b80-0d7c-11eb-853e-6359227407d6.png" width="600px"> </p>

<br><br>

### 온라인 쇼핑몰

<br>

* **회원이 가진 포인트를 이용하여 원하는 상품을 구매 할 수 있도록 구현함.** <br><br>
* **구매한 물품은 구매 리스트에 최신순으로 정렬하여 리스트로 나타나도록 구현함.**

<br><br><br><br>

<p align="center">< 온라인 쇼핑몰 ></p>
<p align="center"> <img src="https://user-images.githubusercontent.com/62025746/95839694-459eaf80-0d7e-11eb-8326-988ba17e988f.png" width="600px"> </p>

<br><br>

<p align="center">< 구매 리스트 ></p>
<p align="center"> <img src="https://user-images.githubusercontent.com/62025746/95839696-459eaf80-0d7e-11eb-8f97-cd4ac35da626.png" width="600px"> </p>

<br><br>

<p align="center">< 구매 후 재고 ></p>
<p align="center"> <img src="https://user-images.githubusercontent.com/62025746/95839691-446d8280-0d7e-11eb-8fa5-afd12caf5dfc.png" width="600px"> </p>

<br>

### 재고관리 프로그램

<br>

* **Admin으로 접속하면 쇼핑몰 물픔의 재고의 수량과 가격을 변경 할 수 있도록 구현함.** <br><br>

<br><br><br><br>

<p align="center">< 재고관리 프로그램 ></p>
<p align="center"> <img src="https://user-images.githubusercontent.com/62025746/95840259-e55c3d80-0d7e-11eb-84b4-8d16bbd17e8f.png" width="600px"> </p>

<br><br>

<p align="center">< 변경된 재고 ></p>
<p align="center"> <img src="https://user-images.githubusercontent.com/62025746/95840263-e5f4d400-0d7e-11eb-9359-d8e0f8c903be.png" width="600px"> </p>

<br><br>


### 게시판

<br>

* **글 쓰기, 글 수정, 글 삭제 기능 구현함.** <br><br>
* **각 게시물 마다 댓글기능 구현함.** <br><br>
* **최신 게시물을 제일 위로 올라가게 시간대 별로 오름차순으로 정렬함.**

<br><br><br><br>

<p align="center">< 게시판 메인화면 ></p>
<p align="center"> <img src="https://user-images.githubusercontent.com/62025746/95840539-39672200-0d7f-11eb-9878-9005f41941c3.png" width="600px"> </p>

<br><br>

<p align="center">< 게시판 - 글 쓰기 ></p>
<p align="center"> <img src="https://user-images.githubusercontent.com/62025746/95840542-39672200-0d7f-11eb-9550-1510307067a0.png" width="600px"> </p>

<br><br>

<p align="center">< 게시판 - 글 작성 완료 ></p>
<p align="center"> <img src="https://user-images.githubusercontent.com/62025746/95840537-38ce8b80-0d7f-11eb-9a56-070e2e29e626.png" width="600px"> </p>

<br><br>

<p align="center">< 게시판 - 글 삭제 완료 ></p>
<p align="center"> <img src="https://user-images.githubusercontent.com/62025746/95840533-379d5e80-0d7f-11eb-9ae9-215e63a0b240.png" width="600px"> </p>

### 자료실

<br>

* **업로드 파일 클릭 시, 다운로드 기능 추가** <br><br>
* **각 게시물 마다 댓글기능 구현함.** <

<br><br><br><br>

<p align="center">< 자료실 메인화면 ></p>
<p align="center"> <img src="https://user-images.githubusercontent.com/62025746/95841216-0f622f80-0d80-11eb-9389-902e6769193f.png" width="600px"> </p>

<br><br>

<p align="center">< 자료실 다운로드 기능 ></p>
<p align="center"> <img src="https://user-images.githubusercontent.com/62025746/95841224-10935c80-0d80-11eb-8bd1-f5a7d86fa508.png" width="600px"> </p>

