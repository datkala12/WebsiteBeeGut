<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="/public/images/logo-ico-small.svg" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<title>${ product.name }</title>
</head> 
<style>
//
Scrollbar CSS

html *::-webkit-scrollbar {
	border-radius: 0;
	width: 8px;
}

html *::-webkit-scrollbar {
	border-radius: 0;
	width: 8px;
}

html *::-webkit-scrollbar-thumb {
	background-color: rgba(43, 79, 146, 0.15);
}

html *::-webkit-scrollbar-thumb {
	background-color: rgba(43, 79, 146, 0.15);
}

html *::-webkit-scrollbar-track {
	border-radius: 0;
	background-color: rgba(43, 79, 146, 0.15);
}

html *::-webkit-scrollbar-track {
	border-radius: 0;
	background-color: rgba(43, 79, 146, 0.15);
}
</style>
<body>
	<div class="container-fluid">
		<nav class="navbar navbar-expand-lg row shadow-sm fixed-top px-3"
			style="background-color: #0a3d62">
			<div class="container-fluid">
				<a class="navbar-brand" href="#"> <img alt="logo"
					src="/public/images/fpt-logo.png" width="110" height="80">
				</a>
				<button class="navbar-toggler " type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
					aria-controls="navbarNavDropdown" aria-expanded="false"
					aria-label="Toggle navigation">
					<i class="fa-solid fa-bars fs-2"></i>
				</button>
				<div class="collapse navbar-collapse" id="navbarNavDropdown">
					<ul class="navbar-nav">
						<li class="nav-item"><a class="nav-link text-white"
							aria-current="page" href="/home">Trang chủ</a></li>
						<li class="nav-item"><a class="nav-link text-white" href="#">Giảm 
								giá</a></li>
						<li class="nav-item"><a class="nav-link text-white" href="#">Liên
								hệ</a></li>
						<!-- <li class="nav-item"><a class="nav-link text-white" href="#">History</a>
						</li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle text-white" href="#"
							id="navbarDropdownMenuLink" role="button"
							data-bs-toggle="dropdown" aria-expanded="false">Category</a>
							<ul class="dropdown-menu"
								aria-labelledby="navbarDropdownMenuLink">
								<li><a class="dropdown-item" href="#">Action</a></li>
								<li><a class="dropdown-item" href="#">Another action</a></li>
								<li><a class="dropdown-item" href="#">Something else
										here</a></li>
							</ul></li> -->
					</ul>
				</div>
				<div class="d-flex px-4">
					<ul class="navbar-nav">
						<li class="nav-item"><a class="nav-link text-white"
							id="dropAccount" role="button" data-bs-toggle="dropdown"
							aria-expanded="false" href="#"> <i
								class="fa-solid fa-user fs-4"></i>
						</a>
							<ul class="dropdown-menu" aria-labelledby="dropAccount"
								style="top: auto; left: auto;">
								<sec:authorize access="!isAuthenticated()">
								 <li><a class="dropdown-item" href="/login">Login</a></li>
								</sec:authorize>
								<sec:authorize access="isAuthenticated()">
								  <li><a class="dropdown-item" href="/logout">Logout</a></li>
								</sec:authorize>
								<sec:authorize access="hasAuthority('1') and isAuthenticated()">
								<li><a class="dropdown-item" href="/admin">Manage Users</a></li>
								</sec:authorize>
							</ul></li>
						<!-- <li class="nav-item"><a class="nav-link text-white"
							aria-current="page" href="#"> <i
								class="fa-solid fa-magnifying-glass fs-4"></i>
						</a></li> -->
						<li class="nav-item"><a class="nav-link text-white"
							aria-current="page" href="/user/carts"> <i
								class="fa-solid fa-cart-shopping fs-4 position-relative"> <c:if
										test="${ countCart >0}">
										<span
											class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger"
											style="font-size: 0.5em"> ${ countCart } <span
											class="visually-hidden">unread messages</span>
										</span>
									</c:if>
							</i>
						</a></li>
						<li class="nav-item"><a class="nav-link text-white"
							id="dropAccount" role="button" data-bs-toggle="dropdown"
							aria-expanded="false" href="#"> <i
								class="fa-solid fa-globe fs-4"></i>
						</a>
						<ul class="dropdown-menu" aria-labelledby="dropAccount"
								style="top: auto; left: auto; right: 30px;">
							<li><a class="dropdown-item" href="#">Tiếng Việt</a></li>
							<li><a class="dropdown-item" href="#">Tiếng Anh</a></li>
						</ul>
						</li>
						
					</ul>
				</div>
			</div>
		</nav>
		<div class="bg-light p-3" style="margin-top: 120px">
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb mb-0">
					<li class="breadcrumb-item"><a href="/home">Home</a></li>
					<li class="breadcrumb-item active" aria-current="page">${ product.name }</li>
				</ol>
			</nav>
		</div>
		<%-- Main --%>
		<div class="container">
			<form action="/user/store" method="post">
			<input name="product" type="hidden" value="${ product.id }" />
			<input name="price" type="hidden" value="${ product.price }" />
			<input name="quantity" type="hidden" value="${ quantity }" />
				<div class="row gy-1 p-5">
					<div class="col-6 p-2">
						<img alt="${ product.name }" src="${ product.image }"
							class="w-100">
							
					</div>
					<div class="col-6 px-5">
						<h1>${ product.name }</h1>
						<h4 class="text-danger fw-bold">${ product.price }
							<span>VND</span>
						</h4>
						<p class="mt-4">${ product.descriptions }</p>
						<h5>
							Loại sản phẩm : <span class="text-secondary">${ product.categories.name }</span>
						</h5>
						
						<h5>
							Trạng thái : <span class="text-secondary">${ product.available=='1'?'Còn hàng':'Hết hàng' }</span>
						</h5>
						<h5>Số lượng :</h5>
						<nav aria-label="Page navigation example">
							<ul class="pagination">
								<li class="page-item">
								<button type="button" class="page-link" onClick="onDown()"> 
								<i class="fa-solid fa-minus"></i>
								</button>
								</li>
								<li class="page-item">
									<p class="text-black">
										<input id="quantity" name="quantity" value="1" class="form-control"/>
									</p>
								</li>
								<li class="page-item">
								<button type="button" class="page-link" onClick="onUp()"> 
								<i class="fa-solid fa-plus"></i>
								</button>
								</li>
							</ul>
						</nav>
						<button class="btn btn-info w-100 text-white">
							<i class="fa-solid fa-cart-shopping"></i> <span>ADD TO
								CART</span>
						</button>
					</div>
				</div>
			</form>
		</div>
		<%-- Footer --%>
		<div class="row mt-5 p-4" style="background-color: #0a3d62">
			<div class="col-4 text-center">
				<img alt="logo" src="/public/images/fpt-logo.png" width="25%">
				<p style="color: #dcdde1">FPT Polytechnic Shopping</p>
			</div>
			<div class="col-4">
				<p class="text-white fw-bold">Thông tin</p>
				<p style="color: #dcdde1">Về chúng tôi</p>
				<p style="color: #dcdde1">Thông tin vận chuyển</p>
				<p style="color: #dcdde1">Chính sách bảo mật</p>
				<p style="color: #dcdde1">Điều khoản và điều kiện</p>
				<p style="color: #dcdde1">Trở về</p>
				<p style="color: #dcdde1">Phiếu quà tặng</p>
			</div>
			<div class="col-4">
				<p class="text-white fw-bold">Liên hệ với chúng tôi</p>
				<form action="">
					<label for="exampleFormControlInput1" class="form-label"
						style="color: #dcdde1">Địa chỉ email</label> <input type="email"
						class="form-control" id="exampleFormControlInput1"
						placeholder="name@example.com">
					<button type="button" class="btn btn-primary w-100 mt-2">Gửi</button>
				</form>
			</div>
			<hr>
			<p class="text-center text-white fw-bold">FPT Polytechnic</p>
		</div>
	</div>
	<script>
	var quantity = 1;
	
	function onDown() {
		if(quantity>=2) {
			quantity -=1;
		}
	  document.getElementById("quantity").value= quantity;
	};

	function onUp() {
		quantity +=1;
	  document.getElementById("quantity").value= quantity;
	};
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>