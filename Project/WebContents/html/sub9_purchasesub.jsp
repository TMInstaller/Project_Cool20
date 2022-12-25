<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,my.model.*,my.dao.*,my.util.*,java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>구매</title>
<!-- css파일 삽입 위치 -->
<link href="../css/project.css" rel="stylesheet" type="text/css" />
<link href="../css/wow.css" rel="stylesheet" type="text/css" />
</head>

<body>
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<div id="wrap">
		<!-- page_header 삽입 위치 -->
		<jsp:include page="../global/page_header.jsp" flush="false" />

		<div id="content_purchase" class="content_purchase">
			<%
			int iid = Integer.parseInt(request.getParameter("iid"));
			Connection conn = ConnectionProvider.getConnection();
			Project_Items item = null;
			try {
				Project_ItemsDao dao = new Project_ItemsDao();
				item = dao.selectById(conn, iid);
			} catch (SQLException e) {
			} finally {
				JdbcUtil.close(conn);
			}
			if (item != null) {
			%>
			<c:set var="p" value="<%=item%>" />
			<div class="img">
				<img name="image" src="/Project/downloadImage/${p.image}" width=620px height=620px />
			</div>
			<div class="infoArea">
				<h2>${p.name}</h2>
				<form name="frm" method="post">
					<input type="hidden" name="iid" value="${p.id}" /> <input type="hidden" name="image" value="${p.image}" /> <input type="hidden" name="price" value="${p.price}" />

					<div class="line"></div>

					<table>
						<tbody>
							<tr class="price">
								<th scope="row"><span style="font-size: 16px; color: #008BCC; font-weight: bold;">판매가</span></th>
								<td><span style="font-size: 16px; color: #008BCC; font-weight: bold;">${p.price}원</span> <span class="df-custom-add"></span></td>
							</tr>
							<tr class="mileage_value_css  xans-record-">
								<th scope="row"><span style="font-size: 16px; color: #555555;">적립금</span></th>
								<td><span style="font-size: 12px; color: #555555;"> <span style="font-size: 16px; color: ##555555">${p.price*0.01}원 (1%)</span>
								</span></td>
							</tr>
						</tbody>
					</table>
					<ul border="1" summary="" class="shoppting option">
						<!-- 추가옵션 -->
						<!-- 일반옵션 -->
						<li class="shopping option_1">
							<ul>
								<li class="title" scope="row"><i class="so"> </i> 사이즈</li>
								<li class="content"><select>
										<option>- [필수] 옵션을 선택해 주세요 -</option>
										<option>-------------------</option>
										<option>아이보리</option>
										<option>카키</option>
										<option>블랙</option>
								</select>
									<p class="value"></p></li>
							</ul>
						</li>
						<li class="shopping option_1">
							<ul>
								<li class="title" scope="row"><i class="so"> </i> 색상</li>
								<li class="content"><select option_product_no="10679" option_select_element="ec-option-select-finder" option_sort_no="1" option_type="T" item_listing_type="S" option_title="색상" product_type="product_option" product_option_area="product_option_10679_0" name="option1" id="product_option_id1" class="ProductOption0" option_style="select" required="true">
										<option value="*" selected="" link_image="">- [필수] 옵션을 선택해 주세요 -</option>
										<option value="**" disabled="" link_image="">-------------------</option>
										<option value="아이보리" link_image="">아이보리</option>
										<option value="카키" link_image="">카키</option>
										<option value="블랙" link_image="">블랙</option>
								</select>
									<p class="value"></p></li>
							</ul>
						</li>
						<!-- 파일첨부 옵션 -->
					</ul>
					<div id="totalPrice" class="totalPrice">
						<strong>TOTAL</strong> : <span class="total"> <strong> <em>${p.price}원</em>
						</strong>
						</span>
					</div>
					<div class="action_button_1">
						<div class="buy wrap">
							<a href="putCart(form)" class="button buy " onclick="product_submit(1, '/exec/front/order/basket/', this)"> <span id="btnBuy">바로구매</span>
							</a>
						</div>
						<div class="cart wrap">
							<a href="putPurchase(form)" class="button cart " onclick="product_submit(2, '/exec/front/order/basket/', this)">장바구니</a>
						</div>

					</div>
				</form>
			</div>

			<%
			} else if (item == null) {
			%>
			<div>
				상품이
				<%=item%></div>
			<%
			}
			%>
		</div>
	</div>
	<!-- page_footer 삽입 위치 -->
	<jsp:include page="../global/page_footer.jsp" flush="false" />

	<script>
		function putCart(frm) {
			var amount = frm.amount.value.trim();
			var id = frm.iid.value.trim();
			var image = frm.image.value.trim();
			window.open("sub9_cartview.jsp?iid=" + id + "&amount=" + amount
					+ "&image=" + image, "");
		}

		function putPurchase(frm) {
			var amount = frm.amount.value.trim();
			var id = frm.iid.value.trim();
			window.open("sub9_buynow.jsp?iid=" + id + "&amount=" + amount);
		}
	</script>
	<script>
		$("#check_module").click(function() {
			var IMP = window.IMP; // 생략가능
			IMP.init('가맹점식별코드를 넣어주세요');
			// 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
			// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
			IMP.request_pay({
				pg : 'kakao', // version 1.1.0부터 지원.
				/* 
				    'kakao':카카오페이, 
				    html5_inicis':이니시스(웹표준결제)
				        'nice':나이스페이
				        'jtnet':제이티넷
				        'uplus':LG유플러스
				        'danal':다날
				        'payco':페이코
				        'syrup':시럽페이
				        'paypal':페이팔
				 */
				pay_method : 'card',
				/* 
				    'samsung':삼성페이, 
				    'card':신용카드, 
				    'trans':실시간계좌이체,
				    'vbank':가상계좌,
				    'phone':휴대폰소액결제 
				 */
				merchant_uid : 'merchant_' + new Date().getTime(),
				/* 
				    merchant_uid에 경우 
				    https://docs.iamport.kr/implementation/payment
				    위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
				    참고하세요. 
				    나중에 포스팅 해볼게요.
				 */
				name : '주문명:결제테스트',
				//결제창에서 보여질 이름
				amount : 1000,
				//가격 
				buyer_email : 'iamport@siot.do',
				buyer_name : '구매자이름',
				buyer_tel : '010-1234-5678',
				buyer_addr : '서울특별시 강남구 삼성동',
				buyer_postcode : '123-456',
				m_redirect_url : 'https://www.yourdomain.com/payments/complete'
			/*  
			    모바일 결제시,
			    결제가 끝나고 랜딩되는 URL을 지정 
			    (카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐) 
			 */
			}, function(rsp) {
				console.log(rsp);
				if (rsp.success) {
					var msg = '결제가 완료되었습니다.';
					msg += '고유ID : ' + rsp.imp_uid;
					msg += '상점 거래ID : ' + rsp.merchant_uid;
					msg += '결제 금액 : ' + rsp.paid_amount;
					msg += '카드 승인번호 : ' + rsp.apply_num;
				} else {
					var msg = '결제에 실패하였습니다.';
					msg += '에러내용 : ' + rsp.error_msg;
				}
				alert(msg);
			});
		});
	</script>
	<script language="JavaScript">
		var sell_price;
		var amount;

		function init() {
			sell_price = document.form.sell_price.value;
			amount = document.form.amount.value;
			document.form.sum.value = sell_price;
			change();
		}

		function add() {
			hm = document.form.amount;
			sum = document.form.sum;
			hm.value++;

			sum.value = parseInt(hm.value) * sell_price;
		}

		function del() {
			hm = document.form.amount;
			sum = document.form.sum;
			if (hm.value > 1) {
				hm.value--;
				sum.value = parseInt(hm.value) * sell_price;
			}
		}

		function change() {
			hm = document.form.amount;
			sum = document.form.sum;

			if (hm.value < 0) {
				hm.value = 0;
			}
			sum.value = parseInt(hm.value) * sell_price;
		}
	</script>
</body>
</html>
