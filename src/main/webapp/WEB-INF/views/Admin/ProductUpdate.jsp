
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>제품 수정 페이지?</title>
<!--부트 스트랩 코드-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">

<style>
input {
	width: 400px;
}

a {
	appearance: auto;
	font-style:;
	font-variant-ligatures:;
	font-variant-caps:;
	font-variant-numeric:;
	font-variant-east-asian:;
	font-variant-alternates:;
	font-weight:;
	font-stretch:;
	font-size:;
	font-family:;
	font-optical-sizing:;
	font-kerning:;
	font-feature-settings:;
	font-variation-settings:;
	text-rendering: auto;
	color: buttontext;
	letter-spacing: normal;
	word-spacing: normal;
	line-height: normal;
	text-transform: none;
	text-indent: 0px;
	text-shadow: none;
	display: inline-block;
	text-align: center;
	align-items: flex-start;
	cursor: default;
	box-sizing: border-box;
	background-color: buttonface;
	margin: 0em;
	padding: 1px 6px;
	border-width: 2px;
	border-style: outset;
	border-color: buttonborder;
	border-image: initial;
	text-decoration: none; 
	
}
</style>
</head>
<body>
	<!--부트 스트랩 코드-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
		crossorigin="anonymous"></script>
	<!--js 코드-->
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
	<!-- Top Nav Bar  include로 뺄 예정임-->
	<div name="top bar">
		<nav class="navbar navbar-expand-lg bg-body-tertiary">
			<div class="container-fluid">
				<a class="navbar-brand"
					href="${pageContext.request.contextPath}/main"><b>Manager
						Page</b></a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarText"
					aria-controls="navbarText" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarText">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page"
							href="${pageContext.request.contextPath}/productView">Product</a>
						</li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/customerView">Customer</a>
						</li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/salesView">Sales</a></li>
					</ul>
					<span class="navbar-text"> 안녕하세요! 000님 <a
						class="btn btn-secondary disabled" role="button"
						aria-disabled="true"
						href="${pageContext.request.contextPath}/logout">Logout</a>
					</span>
				</div>
			</div>
		</nav>
	</div>
	<!--Top Nav Bar End-->

	<div class="p-3 mb-2 bg-body text-body">
		<!--배경색 start-->
		<br>


		<div align="center" style="margin: 5%;">
			<h1 class="display-6">
				<b>Product Update Page</b>
			</h1>
			<br>
			<hr>
			<br>

			<form
				action="${pageContext.request.contextPath}/product/modifyPoduct"
				method="POST" enctype="multipart/form-data">
				<table width="700px">
					<tr>
						<td colspan="4" bgcolor="lightgray"><b>제품등록창</b></td>
					</tr>
					<tr>
						<td colspan="2" rowspan="8" width=30%><img
							src="https://mblogthumb-phinf.pstatic.net/MjAyMTA0MTVfMTE2/MDAxNjE4NDU0MTU0Nzc5.pHUtY9vre2Blb2nNcKSdHTdcDyOITCuiGBJg8DQYzEIg.CZS_8DFgrsm1gZFFkZpZ9zYwd-lXLfy-urxhoxwwbRYg.JPEG.jj_ssong/1216_%EC%86%8C%EB%A6%AC_%EC%A6%9D%EB%AA%85.jpg?type=w800"
							width="100%"> 사진 영역(임시고정)</td>
					</tr>
					<input type="hidden" name="productNo" value="${product.productNo}">
					<tr>
						<td style="text-align: center;">제품명</td>
						<td><input type="text" name="productName"
							value="${product.productName}" required></td>
					</tr>
					<tr>
						<td style="text-align: center;">수량</td>
						<td><input type="number" name="productEa"
							value="${product.productEa}" required></td>
					</tr>
					<tr>
						<td style="text-align: center;">가격</td>
						<td><input type="number" name="price" min="3000"
							value="${product.price}" required></td>
					</tr>
					<tr>
						<td style="text-align: center;">상품 정보</td>
						<td><input type="text" name="productContent"
							value="${product.productContent}" required></td>
					</tr>
					<tr>
						<td style="text-align: center;">카테고리</td>
						<td><input type="text" name="category"
							value="${product.category}" required></td>
					</tr>
					<tr>
						<td style="text-align: center;">서브 카테고리</td>
						<td><input type="text" name="subCategory"
							value="${product.subCategory}" required></td>
					</tr>
					<tr>
						<td style="text-align: center;">제품사진</td>
						<td><input type="file" name="file"></td>
					</tr>

					<tr>
						<td colspan="4" style="text-align: right;">
							<button type="submit">수정</button>&nbsp;&nbsp;&nbsp; <a
							href="${pageContext.request.contextPath}/product/deletePoduct/${product.productNo}">삭제</a>
						</td>
					</tr>
				</table>
			</form>
















		</div>
	</div>










	</div>
	<!--배경색 end-->





</body>
</html>