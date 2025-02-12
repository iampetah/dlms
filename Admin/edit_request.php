<?php
require_once 'utils/is_login.php';
require_once '../Models/EmployeeModel.php';
require_once '../Models/ServicesModel.php';
require_once '../Models/RequestModel.php';


$head_title = 'Add Request';
$page_title = 'Add Request';
$employeeModel = new EmployeeModel();
$employee = $employeeModel->getEmployeeById($_SESSION['id']);
$servicesModel = new ServicesModel();
$services = $servicesModel->getAllServices();
$requestModel = new RequestModel();
$request_id = $_GET['request_id'];
$detailRequest = $requestModel->getRequestById($request_id);
$servicesModel = new ServicesModel();
$packages = $servicesModel->getAllPackages();


?>

<!DOCTYPE html>
<html lang="en">

<head>
  <title>Edit Request Form <?php echo $_SESSION['id'];  ?></title>
  <?php require 'components/head.html' ?>
  <link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/sweetalert2@10.10.1/dist/sweetalert2.min.css'>
</head>
<style>
  .container {
    height: 100%;
  }

  .packages input {
    display: inline;
  }

  .tot span {
    font-size: 20px;
    font-weight: 800;
    margin-left: 750px;
  }

  .tot input {
    font-size: 25px;
    height: 50px;
    background-color: rgba(0, 0, 0, 0);
    width: 140px;
    border: none;
    font-weight: 700;
    text-align: right;
    margin-left: 750px;
  }

  .tet {
    margin-top: 26px;
    margin-left: 750px;
    width: 140px;
    height: 50px;
    box-shadow: 1px 1px 10px rgba(0, 0, 0, 0.20);
    position: absolute;
  }

  th {
    top: 0;
    z-index: 2;
    position: sticky;
    background-color: white;
  }

  td {
    font-weight: 500;
  }

  .total {

    position: relative;

    margin-top: -70px;
    margin-left: 77%;
    z-index: 1;
  }

  .input-field label {
    font-size: 15px;
  }

  .tbl-scroll {
    overflow: hidden;
    overflow-y: scroll;
    height: 220px;
  }

  .checkbox-inline {
    -webkit-columns: 2;
    -moz-columns: 2;
    columns: 2;
  }
  .container form .fields {
    display: flex;
    align-items: center;
    justify-content: space-between;
    flex-wrap: wrap;
  }

  form .fields .input-field {
    display: flex;
    width: calc(100% / 4 - 15px);
    flex-direction: column;
    margin: 4px 0;
  }
</style>

<body>

  <?php require_once 'components/header.html' ?>

  <!-- ======= Sidebar ======= -->
  <?php require 'components/sidebar.html';
  ?>

  <main id="main" class="main">


    <div class="pagetitle">
      <h1>Request Form</h1>

      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="dashboard.php">Home</a></li>
          <li class="breadcrumb-item">Request Form</li>
          <li class="breadcrumb-item active">Edit Request Form</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section">
      <div class="row">
        <div class="col-md-12">

          <div class="card">
            <div class="card-body">
              <hr>
              <div class="container">
                <header>Edit Request Form</header>
                <form id="request_form" enctype="multipart/form-data">
                  <input type="number" name="patient_id" id="" value="<?php echo $detailRequest->patient->id; ?>">
                  <div class="form first">
                    <div class="details personal">
                      <label>Date </label>
                      <input type="text" name="request_date" class="form-control" id="request_date" readonly>
                      <script>
                        var d = new Date()
                        var yr = d.getFullYear();
                        var month = d.getMonth() + 1

                        if (month < 10) {
                          month = '0' + month
                        }
                        var date = d.getDate();
                        if (date < 10) {
                          date = '0' + date
                        }
                        var c_date = yr + "-" + month + "-" + date;

                        document.getElementById("request_date").value = c_date;
                      </script>
                      <div class="fields">
                        <div class="input-field">
                          <label>Lastname*(Jr.Sr. and etc...)</label>
                          <input type="text" id='last_name' name="request_lastname" placeholder="Enter your Lastame" required>
                        </div>
                        <input type="number" name="request_id" id="" value="<?php echo $detailRequest->id ?>" hidden>
                        <div class="input-field">
                          <label>Firstname*</label>
                          <input type="text" id='first_name' name="request_firstname" placeholder="Enter your Firstname" required>
                        </div>
                        <div class="input-field">
                          <label>Middlename</label>
                          <input type="text" id='middle_name' name="request_middlename" placeholder="Enter your Middlename" value="<?php echo $detailRequest->patient->middle_name ?>">
                        </div>
                        <div class="input-field">
                          <label>Suffix</label>
                          <input type="text" name="request_suffix" id="suffix" placeholder="Enter your Suffix" required>
                        </div>
                        <div class="input-field">
                          <label>Sex*</label>
                          <select id='gender' required name="request_gender">
                            <option disabled selected>Select Sex</option>
                            <option value="Male">Male</option>
                            <option value="Female">Female</option>
                          </select>
                        </div>
                        <div class="input-field">
                          <label>Date of Birth*</label>
                          <input type="date" id="dob" name="request_birthdate" placeholder="Enter birth date" required>
                        </div>
                        <div class="input-field">
                          <label>Age*</label>
                          <input type="number" onmousemove="FindAge()" id="age" name="request_age" placeholder="Your age " required readonly>
                        </div>
                        <div class="input-field">
                          <label>Mobile Number*</label>
                          <input type="tel" id='mobile_number' name="request_phone" pattern="[0-9]{11}" pmaxlength="11" oninput="validateNumber(event)" placeholder="Enter mobile number" required>
                        </div>

                        <div class="input-field">
                          <label>Building/ House Number</label>
                          <input type="text" id="house_no" name="request_house_no" placeholder="Enter your Building/ House Number">
                        </div>
                        <div class="input-field">
                          <label>Subdivision/Street Name</label>
                          <input type="text" id="subdivision" name="request_subdivision" placeholder="Enter your Subdivision/Street Name">
                        </div>
                        <div class="input-field">
                          <label>Purok*</label>
                          <input type="text" id="purok" name="request_purok" placeholder="Enter your Purok" required>
                        </div>
                        <div class="input-field">
                          <label>Province*</label>
                          <select required name="request_province" id="province">
                            <option disabled selected>Select Province</option>


                          </select>
                        </div>
                        <div class="input-field">
                          <label>City*</label>
                          <select required name="request_city" id="city">
                            <option disabled selected>Select City</option>


                          </select>
                        </div>
                        <div class="input-field">
                          <label>Barangay*</label>
                          <select required name="request_barangay" id="barangay">
                            <option disabled selected>Select Barangay</option>


                          </select>
                        </div>




                      </div>
                    </div>


                    <div class="container">
                      <div class="row">
                        <div class="col-lg-12">
                          <div class="card">
                            <div class="card-body">


                              <br>

                              <div class="row mb-3">


                                <div class="col-lg-12">

                                  <div class="row">
                                    <div class="col-sm-6">
                                      <h5>Select service</h5>
                                    </div>
                                    <div class="col row">
                                      <select onchange="fillPackageServices()" id="package-select">
                                        <option selected>Select Package</option>
                                        <?php
                                        foreach ($packages as $package) {
                                        ?>
                                          <option value="<?php echo $package['id'] ?>"><?php echo $package['name'] ?></option>
                                        <?php } ?>

                                        </option>
                                      </select>
                                    </div>


                                    <!---  <div class="form-group">
                                        <select class="form-select" id="test1" name="request_test[]" aria-label="Default select example">
                                          <option disabled selected>Choose Test</option>
                                          <?php
                                          foreach ($services as $service) {
                                          ?>
                                            <option value="<?php echo $service->id ?>" data-price="<?php echo $service->price ?>"><?php echo $service->name ?></option>
                                          <?php } ?>

                                          </option>
                                        </select>
                                      </div>
                                    </div>



                                    <div class="col-sm-6">
                                      <br>
                                      <div class="form-group">
                                        <select class="form-select" id="test2" name="request_test[]" aria-label="Default select example">
                                          <option disabled selected>Choose Test</option>
                                          <?php
                                          foreach ($services as $service) {
                                          ?>
                                            <option value="<?php echo $service->id ?>" data-price="<?php echo $service->price ?>"><?php echo $service->name ?></option>
                                          <?php } ?>

                                          </option>
                                        </select>
                                      </div>
                                    </div>
                                    <div class="col-sm-6">
                                      <div class="form-group">
                                        <select class="form-select" id="test3" name="request_test[]" aria-label="Default select example">
                                          <option disabled selected>Choose Test</option>
                                          <?php
                                          foreach ($services as $service) {
                                          ?>
                                            <option value="<?php echo $service->id ?>" data-price="<?php echo $service->price ?>"><?php echo $service->name ?></option>
                                          <?php } ?>

                                          </option>
                                        </select>
                                      </div>
                                    </div>
                                    <div class="col-sm-6">
                                      <div class="form-group">
                                        <select class="form-select" id="test4" name="request_test[]" aria-label="Default select example">
                                          <option disabled selected>Choose Test</option>
                                          <?php
                                          foreach ($services as $service) {
                                          ?>
                                            <option value="<?php echo $service->id ?>" data-price="<?php echo $service->price ?>"><?php echo $service->name ?></option>
                                          <?php } ?>

                                          </option>
                                        </select>
                                      </div>
                                    </div>
                                    <div class="col-sm-6">
                                      <div class="form-group">
                                        <select class="form-select" id="test5" name="request_test[]" aria-label="Default select example">
                                          <option disabled selected>Choose Test</option>
                                          <?php
                                          foreach ($services as $service) {
                                          ?>
                                            <option value="<?php echo $service->id ?>" data-price="<?php echo $service->price ?>"><?php echo $service->name ?></option>
                                          <?php } ?>

                                          </option>
                                        </select>
                                      </div>
                                    </div>
                                    <div class="col-sm-6">
                                      <div class="form-group">
                                        <select class="form-select" id="test6" name="request_test[]" aria-label="Default select example">
                                          <option disabled selected>Choose Test</option>
                                          <?php
                                          foreach ($services as $service) {
                                          ?>
                                            <option value="<?php echo $service->id ?>" data-price="<?php echo $service->price ?>"><?php echo $service->name ?></option>
                                          <?php } ?>

                                          </option>
                                        </select>
                                      </div>
                                    </div>
                                    <div class="col-sm-6">
                                      <div class="form-group">
                                        <select class="form-select" id="test7" name="request_test[]" aria-label="Default select example">
                                          <option disabled selected>Choose Test</option>
                                          <?php
                                          foreach ($services as $service) {
                                          ?>
                                            <option value="<?php echo $service->id ?>" data-price="<?php echo $service->price ?>"><?php echo $service->name ?></option>
                                          <?php } ?>

                                          </option>
                                        </select>
                                      </div>
                                    </div>
                                    <div class="col-sm-6">
                                      <div class="form-group">
                                        <select class="form-select" id="test8" name="request_test[]" aria-label="Default select example">
                                          <option disabled selected>Choose Test</option>
                                          <?php
                                          foreach ($services as $service) {
                                          ?>
                                            <option value="<?php echo $service->id ?>" data-price="<?php echo $service->price ?>"><?php echo $service->name ?></option>
                                          <?php } ?>

                                        </select>
                                        </option>
                                      </div>
                                    </div>!-->
                                    <fieldset class="checkbox-inline">
                                      <legend class="control-label" for="course_details"> </legend>
                                      <?php
                                      foreach ($services as $service) {
                                      ?>
                                        <div class="col-sm-12" style="font-size: 15px; height: 200px; overflow-y: auto;">
                                          <input class="form-check-input" style="border-color: black; font-size: 17px;" name="request_test[]" type="checkbox" id="gridCheck1" value="<?php echo $service->id ?>" data-price="<?php echo $service->price ?>">
                                          <label class="form-check-label" for="gridCheck1"> <b> <?php echo $service->name ?></b>-(Php&nbsp;<?php echo $service->price ?>.00) </label>
                                        </div>
                                      <?php } ?>

                                    </fieldset>

                                  </div>
                                </div>
                              </div>

                            </div>
                            <input hidden id="user_id" type='number' name="user_id" value=<?php echo $_SESSION['id'] ?>>


                          </div>
                          <br>
                          <div class="total">
                            <div class="row mb-3">
                              <label for="" style=" margin-top: 35px;  font-size: 30px;">Total Amount</label>
                              <label for="" style="position: absolute; margin-top: 80px;  font-size: 40px;">&#x20B1;</label>
                              <div class="col-sm-10 end-0">
                                <input type="text" style="border:none; font-size: 30px; text-indent: 45px;" id="total" name="request_amount" class="form-control" value="0.00" readonly>
                              </div>

                            </div>
                            <button type="submit" id="third" name="submit" class="btn btn-primary">Submit</button>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
        </form>
      </div>
      </div>
      </div>

      </div>
      </div>
    </section>

  </main><!-- End #main -->

  <!-- ======= Footer ======= -->


  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.10.1/dist/sweetalert2.all.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
  <script src="../assets/js/script3.js"></script>
  <?php require 'components/required_js.html' ?>

  <script>
    document.addEventListener("DOMContentLoaded", function() {
      // Loop through test1 to test8
      for (var i = 1; i <= 8; i++) {
        var select = document.getElementById("test" + i);
        select.addEventListener("change", function() {
          updateTotalPrice();
        });
      }
    });

    //FUNCTIONS


    function FindAge() {
      var day = document.getElementById("dob").value;
      var DOB = new Date(day);
      var today = new Date();
      var Age = today.getTime() - DOB.getTime();
      Age = Math.floor(Age / (1000 * 60 * 60 * 24 * 365.25));
      document.getElementById("age").value = Age;
    }

    function updateTotalPrice() {
      var total = 0;
      const checkboxes = $('.form-check-input');
      checkboxes.each((index, checkbox) => {
        if (checkbox.checked) {
          total += parseInt(checkbox.getAttribute('data-price'));
        }
      })

      var totalInput = document.getElementById("total");
      totalInput.value = total.toFixed(2);
    }


    const form = document.getElementById('request_form');


    form.addEventListener('submit', function(event) {

      event.preventDefault();


      const formData = new FormData(form);
      console.log('hello')

      fetch('utils/edit_request.php', {
          method: 'POST',
          body: formData,

        })
        .then(() => {
          Swal.fire({
            title: "Request Edited",
            icon: "success",
          }).then(() => {
            window.location.href = 'pending_requests.php'
          })
        })
    });

    const user_id = <?php echo $_SESSION['id'] ?>;
    const request = <?php echo json_encode($detailRequest) ?>;
    const packages = <?php echo json_encode($packages); ?>

    function fillPackageServices() {
      const packageSelect = $("#package-select");

      console.log(packages);
      const packageId = packageSelect.get(0).value;
      const selectedPackage = packages.find((package) => package.id == packageId);

      const servicesSelect = $("[name='request_test[]']");
      servicesSelect.map((index, select) => {
        select.checked = false;
      });

      servicesSelect.map((index, select) => {
        for (const serviceId of selectedPackage.service_ids) {
          if (select.value == serviceId) {
            select.checked = true;
            console.log(select.checked);
          }
        }
      });

      var totalInput = document.getElementById("total");

      totalInput.value = parseInt(selectedPackage.price).toFixed(2);
      console.log(typeof selectedPackage.price);
    }
    document.addEventListener("DOMContentLoaded", () => {
      const appointmentSelect = document.getElementById('appointment-select');
      changeData();
      console.log(request.id);
      console.log(request);

      function changeData() {

        $('#request_date').val(request.request_date.split(' ')[0]);
        $('#last_name').val(request.patient.last_name);
        $('#middle_name').val(request.patient.middle_name);
        $('#first_name').val(request.patient.first_name);
        $('#suffix').val(request.patient.suffix);
        $('#gender').val(request.patient.gender);
        $('#dob').val(request.patient.birthdate);
        $('#age').val(request.patient.age)
        $('#mobile_number').val(request.patient.mobile_number);
        $('#province').html(`<option value="${request.patient.province}">${request.patient.province}</option>`);
        $('#city').html(`<option value="${request.patient.city}">${request.patient.city}</option>`);
        $('#barangay').html(`<option value="${request.patient.barangay}">${request.patient.barangay}</option>`);
        $('#purok').val(request.patient.purok);
        $('#total').val(request.total);
        $('#user_id').val(request.user_id)
        $('#subdivision').val(request.patient.subdivision);
        $('#house_no').val(request.patient.house_no);

        const checkboxes = $('.form-check-input');

        request.services.map((service) => {
          checkboxes.each((index, checkbox) => {
            if (checkbox.value == service.id) {
              checkbox.checked = true;
            }
          })
        })

        updateTotalPrice();

      }
    })

    function validateNumber(event) {
      const input = event.target;
      const regex = /^[0-9]*$/; // Regular expression to match only numbers

      if (!regex.test(input.value)) {
        input.value = input.value.replace(/[^0-9]/g, ''); // Remove non-numeric characters
      }

      // Limit input to 11 digits
      if (input.value.length > 11) {
        input.value = input.value.slice(0, 11);
      }
    }
  </script>

  <script>
    document.addEventListener('DOMContentLoaded', function() {
      var checkboxes = document.querySelectorAll('.form-check-input');
      var totalSumInput = document.getElementById('total');
      var totalSum = 0;

      checkboxes.forEach(function(checkbox) {
        checkbox.addEventListener('change', function() {
          updateTotalPrice();
        });
      });
    });
  </script>

</body>

</html>