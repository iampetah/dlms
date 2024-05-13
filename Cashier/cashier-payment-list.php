<?php
require_once 'utils/is_login.php';
require_once '../Models/EmployeeModel.php';
require_once '../Models/AppointmentModel.php';
require_once '../Models/RequestModel.php';
require_once '../Models/ServicesModel.php';
$head_title = 'Payment List';
$page_title = 'Dashboard';
$employeeModel = new EmployeeModel();
$employee = $employeeModel->getEmployeeById($_SESSION['id']);
$servicesModel = new ServicesModel();
$services = $servicesModel->getAllServices();
$requestModel = new RequestModel();
$requests = $requestModel->getRequestsByStatus(Request::PAID);
$total = 0;
foreach ($requests as $request) {
  $total += $request->total;
}
?>
<!DOCTYPE html>
<html lang="en">

<?php require 'components/head.html' ?>
<style>
  .search {
    border: 2px solid #fff;
    overflow: auto;
    border-radius: 5px;
    -moz-border-radius: 5px;
    -webkit-border-radius: 5px;
    box-shadow: 1px 1px 10px rgba(0, 0, 0, 0.20);


  }

  .search input[type="text"] {
    border: 0px;
    width: 67%;
    padding: 10px 10px;
  }

  .search input[type="text"]:focus {
    outline: 0;
  }

  .search input[type="submit"] {
    border: 0px;
    background: none;
    background-color: #0d6efd;
    color: #fff;
    float: right;
    padding: 10px;

    -moz-border-radius-top-right: 5px;
    -webkit-border-radius-top-right: 5px;

    -moz-border-radius-bottom-right: 5px;
    -webkit-border-radius-bottom-right: 5px;
    cursor: pointer;
  }

  /* ===========================
   ====== Medua Query for Search Box ====== 
   =========================== */

  @media only screen and (min-width : 150px) and (max-width : 780px) {}

  .search {
    width: 95%;
    margin: 0 auto;
  }
</style>

<body>

  <?php require 'components/header.html' ?>
  <?php require 'components/sidebar.html' ?>

  <main id="main" class="main">

    <div class="pagetitle">
      <h1>Payment</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item">Payment</li>
          <li class="breadcrumb-item">Payment List</li>

        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section">
      <div class="row">
        <div class="col-lg-12">

          <div class="card">
            <div class="card-body">
              <hr>
              <div class="position-relative">
                <h5>List of Payments</h5>
                <div class="col-5 position-absolute top-0 end-0">


                </div>
              </div>
              <div class="col-lg-12">

                <br>


                <a onclick="printRequest()" type="button" class="btn btn-secondary">
                  <i class="bi bi-printer-fill"></i> Print
                </a>
                <h5 class="card-title">Filter by:</h5>
                <div class="form-group">

                  <select class="form-select" id="test1" name="" aria-label="Default select example" onchange="filterRequests()">
                    <option selected value="">Choose Test</option>
                    <?php
                    foreach ($services as $service) {
                    ?>
                      <option value="<?php echo $service->id ?>" data-price="<?php echo $service->price ?>"><?php echo $service->name ?></option>
                    <?php } ?>

                    </option>
                  </select>
                </div>
                <div class="row mb-3">
                  <label for="inputDate" class="col-sm-2 col-form-label">Start</label>
                  <div class="col-sm-4">
                    <input type="date" class="form-control" onchange="filterRequests()" id="startDate">
                  </div>
                  <label for=" inputDate" class="col-sm-2 col-form-label">End</label>
                  <div class="col-sm-4">
                    <input type="date" class="form-control" onchange="filterRequests()" id="endDate">
                  </div>
                </div>
                <div class="col-sm-6">
                  <br>

                </div>
                <table class="table table-bordered mt-3" style="text-align: center;">
                  <thead>
                    <tr>
                      <th scope="col">Payment ID</th>
                      <th scope="col">Lastname</th>
                      <th scope="col">Firstname</th>
                      <th scope="col">Service Availed</th>
                      <th scope="col">Total Amount</th>
                      <th scope="col">Status</th>


                    </tr>
                  </thead>
                  <tbody>

                    <?php foreach ($requests as $request) { ?>
                      <tr id="request-row-<?php echo $request->id ?>">
                        <th class="request_id"><?php echo $request->id ?></th>
                        <td><?php echo $request->patient->last_name ?></td>
                        <td><?php echo $request->patient->first_name ?></td>
                        <td>
                          <ul>
                            <?php foreach ($request->services as $service) { ?>
                              <li><?php echo $service->name ?></li>
                            <?php } ?>
                          </ul>
                        <td><?php echo $request->total ?>.00</td>
                        <td><?php echo $request->status ?></td>


                      </tr>
                    <?php } ?>


                  </tbody>
                </table>
              </div>
              <div class="container">
                <div class="col-sm-4" style="margin-left:auto">
                  <label for="" class="row" style="  font-size: 30px;">Total </label>
                  <label class="col" for="" style=" font-size: 40px;">&#x20B1;</label>
                  <input class="col-sm-10" type="text" style="border:none; font-size: 30px; text-indent: 45px;" id="total" class="form-control" value="<?php echo $total ?>.00" readonly>

                </div>

              </div>
            </div>
          </div>



        </div>
      </div>

      </div>
      </div>
    </section>

  </main><!-- End #main -->



  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <?php require 'components/required_js.html' ?>
  <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
  <script>
    const requests = <?php echo json_encode($requests) ?>;
    for (const request of requests) {
      request.patient.fullName = `${request.patient.first_name} ${request.patient.last_name}`
    }

    function filterRequests() {
      const testId = $('#test1').val()
      const startDate = $('#startDate').val()
      const endDate = $('#endDate').val()
      const test1 = $('#test1').val()

      const filteredRequests = requests.filter(request => {
        const requestDate = new Date(request.request_date)
        const start = new Date(startDate)
        const end = new Date(endDate)
        const isTestExist = false;
        console.log(test1)
        return (startDate === '' || requestDate >= start) &&
          (endDate === '' || requestDate <= end) && (test1 === "" || !test1 || request.services.some(service => service.id == testId))
      })
      let total = 0
      for (const request of filteredRequests) {
        total += request.total
      }
      $('#total').val(total.toFixed(2))
      $('tbody tr').remove()
      for (const request of filteredRequests) {
        console.log(request.request_date)
        $('tbody').append(`
          <tr id="request-row-${request.id}">
            <th class="request_id">${request.id}</th>
            <td>${request.patient.last_name}</td>
            <td>${request.patient.first_name}</td>
            <td>
              <ul>
                ${request.services.map(service => `<li>${service.name}</li>`).join('')}
              </ul>
            </td>
            <td>${request.total}</td>
            <td>${request.status}</td>
          </tr>
        `)
      }

    }

    function printRequest() {
      let urlStr = "";

      $(".request_id").map(function() {
        console.log($(this).text())
        urlStr += `request_ids[]=${$(this).text()}&`
      })

      console.log("utils/generate_payment_list_pdf.php/user_id=<?php echo $_SESSION['id'] ?>&" + urlStr);
      window.location = "utils/generate_payment_list_pdf.php?user_id=<?php echo $_SESSION['id'] ?>&" + urlStr;


    }
  </script>
</body>

</html>