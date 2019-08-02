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
		<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

			<!-- Sidebar - Brand -->
			<a class="sidebar-brand d-flex align-items-center justify-content-center" href="/charts">
				<div class="sidebar-brand-icon">
					<i class="fas fa-warehouse"></i>
				</div>
				<div class="sidebar-brand-text mx-3">LDCC WMS</div>
			</a>

			<!-- Divider -->
			<hr class="sidebar-divider my-0">

			<!-- Nav Item - Dashboard -->
			<li class="nav-item active">
				<a class="nav-link" href="/charts"> 
					<i class="fas fa-fw fa-tachometer-alt"></i> <span>Central Control System</span>
				</a>
			</li>

			<!-- Divider -->
			<hr class="sidebar-divider">
			
			<li class="nav-item">
				<a class="nav-link" href="/">
					<i class="fas fa-warehouse"></i> <span>Warehouses</span>
				</a>
			</li>

			<li class="nav-item">
				<a class="nav-link" href="/map"> 
					<i class="fas fa-truck-moving"></i><span> Logistics</span>
				</a>
			</li>

			<li class="nav-item">
				<a class="nav-link" href="/charts"> 
					<i class="fas fa-fw fa-chart-area"></i> <span>Charts</span>
				</a>
			</li>

			<!-- Divider -->
			<hr class="sidebar-divider d-none d-md-block">
			
			<li class="nav-item">
				<a class="nav-link" href="">
					<i class="far fa-folder-open"></i> <span>Documents</span>
				</a>
			</li>
			
			<li class="nav-item">
				<a class="nav-link" href="">
					<i class="fas fa-fw fa-wrench"></i> <span>Utilities</span>
				</a>
			</li>
			
			<li class="nav-item">
				<a class="nav-link" href="">
					<i class="fas fa-fw fa-cog"></i> <span>Components</span>
				</a>
			</li>

		</ul>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 mt-3 text-gray-800"><i class="fas fa-fw fa-tachometer-alt"> </i> Dashboard</h1>
					</div>
					
					<!-- Content Row -->
					<div class="row">

						<!-- Earnings (Monthly) Card Example -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-primary shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class ="col mr-2">
											<div
												class="text-xs font-weight-bold text-primary text-uppercase mb-1">월간 수입</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">100,000,000 원</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-dollar-sign fa-2x text-gray-300"></i>											
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- Earnings (Monthly) Card Example -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-success shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-info text-uppercase mb-1">상품 폐기율</div>
											<div class="row no-gutters align-items-center">
												<div class="col-auto">
													<div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">2.01%</div>
												</div>
												<div class="col">
													<div class="progress progress-sm mr-2">
														<div class="progress-bar bg-success" role="progressbar"
															style="width: 2.01%" aria-valuenow="2.01" aria-valuemin="0"
															aria-valuemax="100"></div>
													</div>
												</div>
											</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- Earnings (Monthly) Card Example -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-info shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-info text-uppercase mb-1">창고 적재율</div>
											<div class="row no-gutters align-items-center">
												<div class="col-auto">
													<div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">78.125%</div>
												</div>
												<div class="col">
													<div class="progress progress-sm mr-2">
														<div class="progress-bar bg-info" role="progressbar"
															style="width: 78.125%" aria-valuenow="78.125" aria-valuemin="0"
															aria-valuemax="100"></div>
													</div>
												</div>
											</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-calendar fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- Pending Requests Card Example -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-warning shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-warning text-uppercase mb-1">경고 누적횟수</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">4 회</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- Content Row -->
					<div class="row">

						<!-- Area Chart -->
						<div class="col-xl-6 col-lg-6">
							<div class="card shadow mb-4">
								<!-- Card Header - Dropdown -->
								<div
									class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">Low-Temperature Warehouse Temperature</h6>
								</div>
								<!-- Card Body -->
								<div class="card-body">
									<div class="chart-area">
										<canvas id="myAreaChart"></canvas>
									</div>
								</div>
							</div>
						</div>
						
						<div class="col-xl-6 col-lg-6">
							<div class="card shadow mb-4">
								<!-- Card Header - Dropdown -->
								<div
									class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">Frozen Warehouse Temperature</h6>
								</div>
								<!-- Card Body -->
								<div class="card-body">
									<div class="chart-area">
										<canvas id="frozenWarehouseChart"></canvas>
									</div>
								</div>
							</div>
						</div>
						

						<!-- Pie Chart -->
						<div class="col-xl-4 col-lg-4">
							<div class="card shadow mb-4">
								<!-- Card Header - Dropdown -->
								<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">적재된 식품류</h6>
								</div>
								<!-- Card Body -->
								<div class="card-body">
									<div class="chart-pie pt-4 pb-2">
										<canvas id="myPieChart"></canvas>
									</div>
									<div class="mt-4 text-center small">
										<span class="mr-2"> <i class="fas fa-circle text-primary"></i> 과일류</span> 
										<span class="mr-2"> <i class="fas fa-circle text-success"></i> 채소류 </span> 
										<span class="mr-2"> <i class="fas fa-circle text-info"></i> 어패류 </span>
									</div>
								</div>
							</div>
						</div>
						
						<div class="col-xl-4 col-lg-4">
							<div class="card shadow mb-4">
								<!-- Card Header - Dropdown -->
								<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">냉장 창고 사용률</h6>
								</div>
								<!-- Card Body -->
								<div class="card-body">
									<div class="chart-pie pt-4 pb-2">
										<canvas id="warehouseUsageLT"></canvas>
									</div>
									<div class="mt-4 text-center small">
										<span class="mr-2"> <i class="fas fa-circle text-primary"></i> 사용 </span> 
										<span class="mr-2"> <i class="fas fa-circle text-secondary"></i> 비사용 </span> 
									</div>
								</div>
							</div>
						</div>
						
						<div class="col-xl-4 col-lg-5">
							<div class="card shadow mb-4">
								<!-- Card Header - Dropdown -->
								<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">냉동 창고 사용률</h6>
								</div>
								<!-- Card Body -->
								<div class="card-body">
									<div class="chart-pie pt-4 pb-2">
										<canvas id="warehouseUsageF"></canvas>
									</div>
									<div class="mt-4 text-center small">
										<span class="mr-2"> <i class="fas fa-circle text-primary"></i> 사용 </span> 
										<span class="mr-2"> <i class="fas fa-circle text-secondary"></i> 비사용 </span> 
									</div>
								</div>
							</div>
						</div>


						<!-- Area Chart -->
						<div class="col-xl-6 col-lg-6">
							<div class="card shadow mb-4">
								<div class="card shadow mb-4">
					                <div class="card-header py-3">
					                  <h6 class="m-0 font-weight-bold text-primary">일별 누적 지연시간</h6>
					                </div>
					                <div class="card-body">
					                  <div class="chart-bar">
					                    <canvas id="dailyDelayTimeBarChart"></canvas>
					                  </div>
					                  <hr>
					                  
					                </div>
					              </div>
							</div>
						</div>
						
						<div class="col-xl-6 col-lg-6">
							<div class="card shadow mb-4">
								<div class="card shadow mb-4">
					                <div class="card-header py-3">
					                  <h6 class="m-0 font-weight-bold text-primary">일별 누적 경고 횟수</h6>
					                </div>
					                <div class="card-body">
					                  <div class="chart-bar">
					                    <canvas id="myBarChart"></canvas>
					                  </div>
					                  <hr>
					                  
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

	<!-- Page level plugins -->
	<script src="/resources/vendor/chart.js/Chart.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="/resources/js/demo/chart-area-demo.js"></script>
	<script src="/resources/js/demo/chart-pie-demo.js"></script>
	<script src="/resources/js/demo/chart-bar-demo.js"></script>

</body>

</html>
