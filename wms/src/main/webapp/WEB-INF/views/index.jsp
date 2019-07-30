<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>LDCC WMS</title>

<!-- Custom fonts for this template-->
<link href="/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<ul
			class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
			id="accordionSidebar">

			<!-- Sidebar - Brand -->
			<a
				class="sidebar-brand d-flex align-items-center justify-content-center"
				href="">
				<div class="sidebar-brand-icon">
					<i class="fas fa-warehouse"></i>

				</div>
				<div class="sidebar-brand-text mx-3">LDCC WMS</div>
			</a>

			<!-- Divider -->
			<hr class="sidebar-divider my-0">

			<!-- Nav Item - Dashboard -->
			<li class="nav-item active"><a class="nav-link" href=""> <i
					class="fas fa-fw fa-tachometer-alt"></i> <span>중앙 관제시스템</span></a></li>

			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Heading -->
			<div class="sidebar-heading">물류</div>

			<li class="nav-item"><a class="nav-link" href="/map"> <i
					class="fas fa-fw fa-chart-area"></i> <span>운송</span></a></li>

			<!-- Nav Item - Charts -->
			<li class="nav-item"><a class="nav-link" href="/charts"> <i
					class="fas fa-fw fa-chart-area"></i> <span>Charts</span>
			</a></li>

			<!-- Nav Item - Tables -->
			<li class="nav-item"><a class="nav-link" href="tables.html">
					<i class="fas fa-fw fa-table"></i> <span>Tables</span>
			</a></li>

			<!-- Divider -->
			<hr class="sidebar-divider d-none d-md-block">

		</ul>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<div class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 mt-3 text-gray-800">Warehouse</h1>
					</div>
					
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-success">Low-temperature Warehouse</h6>
						</div>
						<div class="card-body">
							<h4 class="small font-weight-bold">
								저온창고 적재율 <span class="float-right">81.25%</span>
							</h4>
							<div class="mb-3 progress">
								<div class="progress-bar bg-success" role="progressbar" style="width: 81.25%" aria-valuenow="81.25" aria-valuemin="0" aria-valuemax="100"></div>
							</div>
							<div class="row">
								<div class="ml-2 mb-3 mr-3 col-sm-6">
									<div class="row">
										<div class="card col-sm-6">											
											<h5 class="card-title text-center mt-2">1F</h5>
											<div class="warehouse1f">
												<button type="button" class="col btn btn-success mb-1" id="a1">A1</button>
												<button type="button" class="col btn btn-success mb-1" id="a2">A2</button>
												<button type="button" class="col btn btn-success mb-3" id="a3">A3</button>
												
												<button type="button" class="col btn btn-success mb-1" id="b1">B1</button>
												<button type="button" class="col btn btn-success mb-1" id="b2">B2</button>
												<button type="button" class="col btn btn-success mb-3" id="b3">B3</button>
												
												<button type="button" class="col btn btn-success mb-1" id="c1">C1</button>
												<button type="button" class="col btn btn-success mb-1" id="c2">C2</button>
											</div>
										</div>
										
										<div class="card col-sm-6">											
											<h5 class="card-title text-center mt-2">2F</h5>
											<div class="warehouse2f">
												<button type="button" class="col btn btn-success mb-1" id="a1">A1</button>
												<button type="button" class="col btn btn-secondary mb-1" id="a2" disabled>A2</button>
												<button type="button" class="col btn btn-secondary mb-3" id="a3" disabled>A3</button>
												
												<button type="button" class="col btn btn-success mb-1" id="b1">B1</button>
												<button type="button" class="col btn btn-secondary mb-1" id="b2" disabled>B2</button>
												<button type="button" class="col btn btn-success mb-3" id="b3">B3</button>
												
												<button type="button" class="col btn btn-success mb-1" id="c1">C1</button>
												<button type="button" class="col btn btn-success mb-1" id="c2">C2</button>
											</div>
										</div>
									</div>
								</div>
								
								<div class="mb-3 col-sm-5">
									<div class="card">
										<div class="card-body">
											<h5 class="card-title" id="info-title">Info</h5>
											<form>
											  <div class="form-group">
											    <label for="warehouseTemp">현재 창고 온도</label>
											    <input type="text" class="form-control" id="warehouseTemp" value="15°C">
											  </div>
											  <div class="info">
												  <div class="form-group">
												    <label for="productName">품목</label>
												    <input type="text" class="form-control" id="productName" value="수박">
												  </div>
												  <div class="form-group">
												    <label for="storedDate">적제일</label>
												    <input type="date" class="form-control" id="storedDate" value="2019-07-31">
												  </div>
												  <div class="form-group">
												    <label for="storedPlace">적제 위치</label>
												    <input type="text" class="form-control" id="storedPlace" value="B2-2">
												  </div>
											  </div>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">Frozen Warehouse</h6>
						</div>
						<div class="card-body">
							<h4 class="small font-weight-bold">
								냉동창고 적재율 <span class="float-right">75.00%</span>
							</h4>
							<div class="progress mb-4">
								<div class="progress-bar" role="progressbar" style="width: 75%" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
							</div>
							<div class="row">
								<div class="ml-2 mb-3 mr-2 col-sm-6">
									<div class="row" style="height: 100%">
										<div class="card col-sm-6">
												<h5 class="card-title text-center mt-2">1F</h5>

												<div class="warehouse1f">
													<button type="button" class="col btn btn-primary mb-1" id="Fa1">A1</button>
													<button type="button" class="col btn btn-primary mb-1" id="Fa2">A2</button>
													<button type="button" class="col btn btn-primary mb-3" id="Fa3">A3</button>
													
													<button type="button" class="col btn btn-primary mb-1" id="Fb1">B1</button>
													<button type="button" class="col btn btn-primary mb-1" id="Fb2">B2</button>
													<button type="button" class="col btn btn-secondary mb-3" id="Fb3" disabled>B3</button>
													
													<button type="button" class="col btn btn-primary mb-1" id="Fc1">C1</button>
													<button type="button" class="col btn btn-primary mb-1" id="Fc2">C2</button>
												</div>
										</div>
										<div class="card col-sm-6">
												<h5 class="card-title text-center mt-2">2F</h5>

												<div class="warehouse2f">
													<button type="button" class="col btn btn-primary mb-1" id="Fa1">A1</button>
													<button type="button" class="col btn btn-secondary mb-1" id="Fa2" disabled>A2</button>
													<button type="button" class="col btn btn-primary mb-3" id="Fa3">A3</button>
													
													<button type="button" class="col btn btn-secondary mb-1" id="Fb1" disabled>B1</button>
													<button type="button" class="col btn btn-secondary mb-1" id="Fb2" disabled>B2</button>
													<button type="button" class="col btn btn-primary mb-3" id="Fb3">B3</button>
													
													<button type="button" class="col btn btn-primary mb-1" id="Fc1">C1</button>
													<button type="button" class="col btn btn-primary mb-1" id="Fc2">C2</button>
												</div>
										</div>
									</div>
								</div>
								<div class="mb-3 col-sm-5">
									<div class="card">
										<div class="card-body">
											<h5 class="card-title" id="f-info-title">Info</h5>
											<form>
											  <div class="form-group">
											    <label for="warehouseTemp">현재 창고 온도</label>
											    <input type="text" class="form-control" id="fwarehouseTemp" value="- 10°C">
											  </div>
											  <div class="info">
												  <div class="form-group">
												    <label for="productName">품목</label>
												    <input type="text" class="form-control" id="fproductName" value="롯데식품 돼지바">
												  </div>
												  <div class="form-group">
												    <label for="storedDate">적제일</label>
												    <input type="date" class="form-control" id="fstoredDate" value="2019-07-23">
												  </div>
												  <div class="form-group">
												    <label for="storedPlace">적제 위치</label>
												    <input type="text" class="form-control" id="fstoredPlace" value="A1-1">
												  </div>
											  </div>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /.container-fluid -->

	</div>
	<!-- End of Main Content -->

	<!-- Footer -->
	<footer class="sticky-footer bg-white">
		<div class="container my-auto">
			<div class="copyright text-center my-auto">
				<span>Copyright &copy; Your Website 2019</span>
			</div>
		</div>
	</footer>
	<!-- End of Footer -->

	</div>
	<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Bootstrap core JavaScript-->
	<script src="/resources/vendor/jquery/jquery.min.js"></script>
	<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="/resources/js/sb-admin-2.min.js"></script>


</body>

</html>
