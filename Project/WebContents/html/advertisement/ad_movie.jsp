<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개봉 예정작들</title>
<link href="ad_movie.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<!-- 제이쿼리 불러오기 -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

	<!-- XEIcon 폰트 불러오기 -->
	<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">

	<div class="wrap">
		<!-- 상단 배너 슬라이더 -->
		<div class="main-bn">
			<div class="slider">
				<div class="slides">
					<div class="bn active"
						style="background-image: url('https://kimyang-sun.github.io/pf-img/esc-img/main_bn_01.jpg');">
						<div class="inner-txt">
							<h1 class="tt font-museum-m inline-block">수상한 팀 프로젝트</h1>
							<h2 class="st font-museum-l inline-block">숨겨진 비밀코드</h2>
							<span class="font-museum-l">PART 01</span>
							<p>
								코딩을 하다가 발견한 이상한 비밀 코드<br>당신의 운명은 어떻게 될 것인가?
								<br><br>COOL20 X Notflex Collaboration 의상 예약판매중
							</p>
							<div class="view inline-block">
								<a onclick="service()" style="cursor:pointer">자세히 보기</a>
							</div>
							<div class="reserve inline-block">
								<a href="/Project/html/sub3_itemlist.jsp?frm1=Collaboration">상품 구경하러 가기</a>
							</div>
						</div>
					</div>
					<div class="bn"
						style="background-image: url('https://kimyang-sun.github.io/pf-img/esc-img/main_bn_02.jpg');">
						<div class="inner-txt">
							<h1 class="tt font-museum-m inline-block">EXIT TRAP</h1>
							<h2 class="st font-museum-l inline-block">백업파일의 위기</h2>
							<span class="font-museum-l">PART 02</span>
							<p>
								제출까지 남은 한 시간,<br>갑자기 전원이 나가버리고 마는데..
								<br><br>COOL20 X Notflex Collaboration 의상 예약판매중
							</p>
							<div class="view inline-block">
								<a onclick="service()" style="cursor:pointer">자세히 보기</a>
							</div>
							<div class="reserve inline-block">
							<a href="/Project/html/sub3_itemlist.jsp?frm1=Collaboration">상품 구경하러 가기</a>
							</div>
						</div>
					</div>
					<div class="bn"
						style="background-image: url('https://kimyang-sun.github.io/pf-img/esc-img/main_bn_03.jpg');">
						<div class="inner-txt">
							<h1 class="tt font-museum-m inline-block">DEAD BATTERY</h1>
							<h2 class="st font-museum-l inline-block">판매자의 전화</h2>
							<span class="font-museum-l">PART 03</span>
							<p>
								그것은 몇 년 전 지인을 통해 구매했던 노트북,<br>과연 그 노트북은 중고가 아니었을까.
								<br><br>COOL20 X Notflex Collaboration 의상 예약판매중
							</p>
							<div class="view inline-block">
								<a onclick="service()" style="cursor:pointer">자세히 보기</a>
							</div>
							<div class="reserve inline-block">
								<a href="/Project/html/sub3_itemlist.jsp?frm1=Collaboration">상품 구경하러 가기</a>
							</div>
						</div>
					</div>
					<div class="bn"
						style="background-image: url('https://kimyang-sun.github.io/pf-img/esc-img/main_bn_04.jpg');">
						<div class="inner-txt">
							<h1 class="tt font-museum-m inline-block">2진수의 방</h1>
							<h2 class="st font-museum-l inline-block">위험한 컴파일러</h2>
							<span class="font-museum-l">PART 04</span>
							<p>
								노트북의 충전기를 찾기 위해 돌아다니던 중,<br>2진수로 가득한 방을 발견하고 마는데..
								<br><br>COOL20 X Notflex Collaboration 의상 예약판매중
							</p>
							<div class="view inline-block">
								<a onclick="service()" style="cursor:pointer">자세히 보기</a>
							</div>
							<div class="reserve inline-block">
								<a href="/Project/html/sub3_itemlist.jsp?frm1=Collaboration">상품 구경하러 가기</a>
							</div>
						</div>
					</div>
					<div class="bn"
						style="background-image: url('https://kimyang-sun.github.io/pf-img/esc-img/main_bn_05.jpg');">
						<div class="inner-txt">
							<h1 class="tt font-museum-m inline-block">숨어있는 벌레의 방</h1>
							<h2 class="st font-museum-l inline-block">Debugging</h2>
							<span class="font-museum-l">PART 05</span>
							<p>
								시스템 안에서 무언가가 기어다니는 소리가 들려오고 있다<br>모두 잡아내야 한다.
								<br><br>COOL20 X Notflex Collaboration 의상 예약판매중
							</p>
							<div class="view inline-block">
								<a onclick="service()" style="cursor:pointer">자세히 보기</a>
							</div>
							<div class="reserve inline-block">
								<a href="/Project/html/sub3_itemlist.jsp?frm1=Collaboration">상품 구경하러 가기</a>
							</div>
						</div>
					</div>
					<div class="bn"
						style="background-image: url('https://kimyang-sun.github.io/pf-img/esc-img/main_bn_06.jpg');">
						<div class="inner-txt">
							<h1 class="tt font-museum-m inline-block">요청하신 페이지를 찾을 수 없습니다</h1>
							<h2 class="st font-museum-l inline-block">404 NOT FOUND</h2>
							<span class="font-museum-l">PART 06</span>
							<p>
								드디어 끝을 보고 있는 당신!<br>과연 당신은 올바른 페이지를 찾아 연결할 수 있을 것인가!
								<br><br>COOL20 X Notflex Collaboration 의상 예약판매중
							</p>
							<div class="view inline-block">
								<a onclick="service()" style="cursor:pointer">자세히 보기</a>
							</div>
							<div class="reserve inline-block">
								<a href="/Project/html/sub3_itemlist.jsp?frm1=Collaboration">상품 구경하러 가기</a>
							</div>
						</div>
					</div>
				</div>
				<div class="page-btns">
					<button class="page-btn prev-btn">
						<i class="xi-angle-left"></i>
					</button>
					<button class="page-btn next-btn">
						<i class="xi-angle-right"></i>
					</button>
					<div class="page-no">
						<span class="current-slide-no"></span> <span class="slash">/</span>
						<span class="total-slide-no"></span>
					</div>
				</div>
			</div>
		</div>
	</div>
<script>
console.clear();

//상단 메인 배너 슬라이더
$('.main-bn > .slider > .page-btns > .page-btn').click(function(){
 var $clicked = $(this);
 var $slider = $(this).closest('.slider');
 
 var index = $(this).index();
 var isLeft = index == 0;
 //console.log(index);
 
 var $current = $slider.find(' > .slides > .bn.active');
 var $post;
 
 if ( isLeft ){
     $post = $current.prev();
 }
 else {
     $post = $current.next();
 }
 //console.log($post.length);
 
 if ( $post.length == 0 ){
     if ( isLeft ){
         $post = $slider.find(' > .slides > .bn:last-child');
     }
     else {
         $post = $slider.find(' > .slides > .bn:first-child');
     }
 }
 
 $current.removeClass('active');
 $post.addClass('active');
 
 updateCurrentPageNumber();
});

setInterval(function(){
 $('.main-bn > .slider > .page-btns > .next-btn').click();
}, 8000);

//슬라이더 페이지 번호 지정
function pageNumber__Init(){
 // 전채 배너 페이지 갯수 세팅해서 .slider 에 'data-slide-total' 넣기
 var totalSlideNo = $('.main-bn > .slider > .slides > .bn').length;
 //console.log(totalSlideNo);
 
 $('.main-bn > .slider').attr('data-slide-total', totalSlideNo);
 
 // 각 배너 페이지 번호 매기기
 $('.main-bn > .slider > .slides > .bn').each(function(index, node){
     $(node).attr('data-slide-no', index + 1);
 });
};

pageNumber__Init();

//슬라이더 이동시 페이지 번호 변경
function updateCurrentPageNumber(){
 var totalSlideNo = $('.main-bn > .slider').attr('data-slide-total');
 var currentSlideNo = $('.main-bn > .slider > .slides > .bn.active').attr('data-slide-no');
 
 $('.main-bn > .slider > .page-btns > .page-no > .total-slide-no').html(totalSlideNo);
 $('.main-bn > .slider > .page-btns > .page-no > .current-slide-no').html(currentSlideNo);
};

updateCurrentPageNumber();

function service(){
	let loginId= "${LOGINID}";
	if(loginId ==""){
		alert("로그인 후 확인할 수 있는 이벤트입니다");
		location.href="/Project/html/sub1_loginform.jsp";
	}else{
		location.href="/Project/html/sub7_notice_Modify.jsp?notice_id=14";
	}
}
</script>
</body>
</html>