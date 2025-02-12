<?php
require_once 'utils/is_login.php';
require_once '../Models/EmployeeModel.php';
require_once '../Models/RequestModel.php';
require_once '../Models/PatientModel.php';
$head_title = 'Services';
$page_title = 'Services';
$employeeModel = new EmployeeModel();
$employee = $employeeModel->getEmployeeById($_SESSION['id']);
$requestModel = new RequestModel();
$salesRequest = $requestModel->getRequestsByStatus(Request::PAID);
$requestModel = new RequestModel();
$salesRequestToday = $requestModel->getRequestTodayByStatus(Request::PAID);

$servicesModel = new ServicesModel();
$services = $servicesModel->getAllServices();
?>
<!DOCTYPE html>
<html lang="en">
<?php require 'components/head.html' ?>
<style></style>

<body>
  <?php require 'components/header.html' ?>

  <?php require 'components/sidebar.html' ?>

  <main id="main" class="main">
    <div class="pagetitle">
      <h1>Services</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="dashboard.php">Home</a></li>
          <li class="breadcrumb-item active">Services</li>
        </ol>
      </nav>
    </div>
    <!-- End Page Title -->

    <section class="section dashboard">
      <div class="row">
        <div class="col-lg-12">
          <div class="row">
            <div class="col-lg-4">
              <div class="row">
                <div class="card">
                  <h5 class="card-title">Add Service</h5>
                  <div class="card-body">
                    <form action="" class="row g-3" onsubmit="handleAddButtonClick(event)">
                      <div class="col-12">
                        <label for="inputNanme4" class="form-label">Service Name</label>
                        <input type="text" class="form-control" id="add_service_name" />
                      </div>
                      <div class="col-12">
                        <label for="inputEmail4" class="form-label">Price</label>
                        <input type="number" class="form-control" id="add_service_price" />
                      </div>
                      <div class="col-12">
                        <label for="inputEmail4" class="form-label">Normal Value</label>
                        <input type="text" class="form-control" id="add_service_normal_value" />
                      </div>
                      <div class="text-center">
                        <button type="submit" class="btn btn-primary">
                          Submit
                        </button>
                        <button type="reset" class="btn btn-secondary">
                          Reset
                        </button>

                      </div>
                      <a href="package_services.php">Package Services</a>
                    </form>
                  </div>
                </div>
              </div>
            </div>

            <div class="col-lg-8">
              <div class="card">
                <div class="card-body"style="height: 700px; overflow-y: auto;">
                  <table class="table table-striped hover center mt-3" >
                    <thead>
                      <th>Service Name</th>
                      <th>Price</th>
                      <th>Normal Value</th>
                      <th>Action</th>
                    </thead>
                    <tbody >
                      <?php foreach ($services as $service) : ?>
                        <tr>
                          <th><?php echo $service->name ?></th>
                          <td><?php echo $service->price ?></td>
                          <td><?php echo $service->normal_value ?></td>
                          <td>
                            <button onclick='handleEditButtonClick(<?php echo json_encode($service) ?>)' class="btn btn-success"><i class="bi bi-pencil-square"></i></button>
                            <button class="btn btn-danger" onclick='handleDeleteButtonClick(<?php echo $service->id ?>)'>
                              <i class="bi bi-trash3-fill"></i>
                            </button>
                          </td>
                        </tr>
                      <?php endforeach ?>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  </main>


  <!-- End #main -->

  <!-- ======= Footer ======= -->
  <footer id="footer" class="footer"></footer>
  <!-- End Footer -->

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.10.1/dist/sweetalert2.all.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
  <!-- Template Main JS File -->
  <script src="../assets/js/admin/services.js"></script>
  <script src="../assets/js/main.js"></script>
</body>

</html>