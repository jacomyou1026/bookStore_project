<div align="center">

###  bookStore-Spring
책을 판매하고 중고 책을 판매하는 플랫폼
</div>

 ## 프로젝트 설명  
 - 책을 판매하고 중고 책을 판매하는 플랫폼.
 - 온라인으로 책을 살 수 있으며, 동시에 사용자들이 중고 책을 거래할 수 있어 편리성을 제공해준다.


## 기술 스택
- `JAVA`
- `JDK1.8`
- jsp
- **Framework** :  Eclipse, Spring Framework
- **Database**  : Oracle DB(11xe)
- **ORM** : Mybatis

### 백엔드
![image](https://github.com/jacomyou1026/bookStore_project/assets/70208747/ce580afd-cae0-4d21-9b13-3d261ba19cc7)


### 프론트엔드
![image](https://github.com/jacomyou1026/bookStore_project/assets/70208747/0a2d330b-a93e-4ca6-94b2-a4e6406fe7ed)



## ERD 설계

<img  align="center" width="400" alt="erd" src="https://github.com/jacomyou1026/bookStore_project/assets/70208747/a7b4be1b-40d0-4d2b-9cf4-56ce91b0b876">

### 구현프로젝트 설명 
### 메인 페이지
부트스트랩의 케러셀을 이용하였고 카드를 사용해 책의 이미지와 정보 그리고 책의 상세페이지에 들어갈수 있다. 상단은 세션값을 사용해 로그인이 되어있지않으면 회원가입을 띄우고 로그인이 되어있다면 로그아웃, 마이페이지등을 띄운다.

<img  align="center" width="300" alt="로그인 후 마이페이지" src="https://github.com/jacomyou1026/bookStore_project/assets/70208747/18b14cea-0b49-4c08-b0da-145e7cd0a974">



 ###  카테고리 네비게이션
   국내도서,외국도서,신간도서,베스트셀러,중고장터 부분으로 나누었다.

|국내도서|외국도서|신간도서|베스트셀러|중고장터|
|-----|---|---|---|---|
| <img src="https://github.com/jacomyou1026/bookStore_project/assets/70208747/0f033f55-aed0-47e8-a019-7c4686e4dd30" width="230" />| <img src="https://github.com/jacomyou1026/bookStore_project/assets/70208747/f5c8e87e-c96f-4cc2-9f84-57408b581a21" width="230" />|<img src="https://github.com/jacomyou1026/bookStore_project/assets/70208747/3ea65e0f-7173-4506-888a-9bd3ea42070f" width="230" />|<img src="https://github.com/jacomyou1026/bookStore_project/assets/70208747/540cf09a-105d-488c-a9e4-90e9989ecce9" width="230" />|<img src="https://github.com/jacomyou1026/bookStore_project/assets/70208747/0a9c57c4-b7cc-41d7-9282-47510adcf83e" width="230" />|




### 상세 정보
 책의대한 상세한 정보를 볼수 이다. / 상품정보, 회원리뷰, 교환/반품/품절 메뉴를 이용할 수 있다.
1. 상단: 제목, 작가, 출판사 , 가격, 주문수량등을 확인할 수 있다. 장바구니 버튼을 눌러 책을 장바구니에 담아둘 수 있다. 2. 중단: 책의 자세한 상세정보를 확인할 수 있다. / 리뷰를 확인할 수 있다.

<img width="300" alt="책 상세정보" src="https://github.com/jacomyou1026/bookStore_project/assets/70208747/45127f2f-7179-4111-a566-dbc23dc2c60c">


 ### 리뷰 
 로그인시 책의 대한 리뷰를 달 수 있다. 리뷰의대한 댓글까지 달을 수 있고 대댓글은 달 수 없다. 로그인 후 해당 아이디의 리뷰를 삭제하거나 수정할 수 있다. 별점기능이있어 책의 별점을 부여할 수 있다.
   
|리뷰 댓글|리뷰 댓글달기|리뷰 리스트|
|-----|-----|---|
|<img width="300" alt="리뷰 댓글" src="https://github.com/jacomyou1026/bookStore_project/assets/70208747/733fc12b-4148-4ab1-bf13-7270738d37ca">|<img width="300" alt="리뷰 댓글달기" src="https://github.com/jacomyou1026/bookStore_project/assets/70208747/36eae0d3-c94b-4d39-8cbe-bcae5f3ac2e0">|<img width="300" alt="리뷰 리스트" src="https://github.com/jacomyou1026/bookStore_project/assets/70208747/50b9d078-4858-43a2-b3dd-5ce33beb4a50">|



### 장바구니
구매하기 전 자신이 구입하고 싶어하는 책들을 장바구니에 넣어 보관할 수 있으며 
수량변경이나 삭제가 가능하며, 장바구니에 있는 책 전체의 가격이나 적립포인트를
 볼 수 있다. 체크박스를 통해 장바구니에서 구매할 책들을 선택할 수 있다.

<img  align="center" width="300" alt="장바구니" src="https://github.com/jacomyou1026/bookStore_project/assets/70208747/9d5f219f-248c-42f7-b890-95fb7ecf97d0">

 ### 구매하기
장바구니에서 체크된 책들을 구매할 수 있으며 전체 내역과 적립 포인트를 볼 수 있다.배송지 변경을 통해 기본 배송지와 다른 배송지로 구매할 수 있도록 구현하였다.
|주문|카카오페이 결제|상세내역|결제완료|
|-----|---|---|---|
|<img width="230" alt="주문" src="https://github.com/jacomyou1026/bookStore_project/assets/70208747/cd2d4abb-5bfb-4ed9-a985-cb11c5d5a352">|<img width="230" alt="카카오페이 결제" src="https://github.com/jacomyou1026/bookStore_project/assets/70208747/8f97f585-fa85-4b97-9d88-a517cc8bdeeb">|<img width="230" alt="상세내역" src="https://github.com/jacomyou1026/bookStore_project/assets/70208747/00fc434b-5e2f-4c77-b7bd-6a1656a82c8d">|<img width="230" alt="결제완료" src="https://github.com/jacomyou1026/bookStore_project/assets/70208747/d3e14031-30c3-45f4-805a-41274d9bc834">|


 ### 로그인
 아이디, 비밀번호 입력란에서 아이디, 비밀번호를 입력하면 book_user db에 정보를 받아와 체크를 한후 null이 아니거나 맞다면 로그인이 가능하다. 또한 아이디, 비밀번호를 잊었을시 정보를 입력하면 찾을 수 있다.

   <img align="center" width="300" alt="로그인" src="https://github.com/jacomyou1026/bookStore_project/assets/70208747/2279fc8f-4574-4d22-a1ae-61d5dc136b9e">

 ### 회원가입
 이름과 전화번호를 입력하면 중복검사를 통해 체크를 한 후 없으면 이름과 전화번호 값을 그대로 받아와 회원가입에 데이터를 전송한다. 또한 아이디 중복체크를 통해 중복을 막았고 주소API를 이용해 선택을 하면 값을 담아온다.

   <img  align="center" width="300" alt="회원가입3" src="https://github.com/jacomyou1026/bookStore_project/assets/70208747/c687b740-81dc-4ec5-aacf-6cef060856a8">

### 마이페이지
회원 정보 수정을 할수있게 만들었고 비밀번호 변경을 할 수 있으며 회원탈퇴시 다시한번 아이디, 비밀번호를 체크해 무분별한 탈퇴를 막아놓았다
|회원탈퇴|구매내역|
|-----|---|
|<img width="230" alt="회원탈퇴" src="https://github.com/jacomyou1026/bookStore_project/assets/70208747/b11786c6-c376-4024-89cc-f5629d41dfd2">|<img width="230" alt="구매내역" src="https://github.com/jacomyou1026/bookStore_project/assets/70208747/b4471417-55c9-4ca5-abc6-8b93a3f366df">|
 - **API**:알라딘API를 이용해 기본 책정보들을 가져왔다
   


---
project PPT
[bookStore_project.pptx](https://github.com/jacomyou1026/bookStore_project/files/13800877/bookStore_project.pptx)


