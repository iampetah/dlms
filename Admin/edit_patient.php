<?php
require_once 'utils/is_login.php';
require_once '../Models/EmployeeModel.php';
require_once '../Models/ServicesModel.php';
require_once '../Models/PatientModel.php';
require_once '../Models/RequestModel.php';

$head_title = 'Add Request';
$page_title = 'Add Request';
$employeeModel = new EmployeeModel();
$employee = $employeeModel->getEmployeeById($_SESSION['id']);
$servicesModel = new ServicesModel();
$services = $servicesModel->getAllServices();
$patientModel = new PatientModel();
$patient_id = $_GET['patient_id'];

$patient  = $patientModel->getPatientById($patient_id);
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
          <li class="breadcrumb-item">Patient Details</li>
          <li class="breadcrumb-item active">Edit Patient Details</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section">

      <div class="card">
        <div class="card-body">
          <hr>
   
          <div class="container">
            <header>Edit Patient Details</header>
            <form id="patient_form" enctype="multipart/form-data" style="min-height:600px; overflow-y:auto;">
              <div class=" form first">
                <input type="number" name="patient_id" id="" value="<?php echo $patient->id ?>" hidden>
                <div class="details personal">

                  <div class="fields">
                    <div class="input-field">
                      <label>Lastname</label>
                      <input type="text" id='last_name' name="request_lastname" placeholder="Enter your Lastame" required>
                    </div>
                    <input type="number" name="request_id" id="" value="<?php echo $patient->id ?>" hidden>
                    <div class="input-field">
                      <label>Firstname</label>
                      <input type="text" id='first_name' name="request_firstname" placeholder="Enter your Firstname" required>
                    </div>
                    <div class="input-field">
                      <label>Middlename</label>
                      <input type="text" id='first_name' name="request_midname" placeholder="Enter your Middlename" >
                    </div>
                    <div class="input-field">
                          <label>Suffix</label>
                          <input type="text" name="request_suffix" id="suffix" placeholder="Enter your Suffix" value="<?php echo isset($patient->suffix) ? $patient->suffix : ""  ?>">
                        </div>
                    <div class="input-field">
                      <label>Sex</label>
                      <select id='gender' required name="request_gender">
                        <option disabled selected>Select Sex</option>
                        <option value="Male">Male</option>
                        <option value="Female">Female</option>
                      </select>
                    </div>
                    <div class="input-field">
                      <label>Date of Birth</label>
                      <input type="date" id="dob" name="request_birthdate" placeholder="Enter birth date" required>
                    </div>
                    <div class="input-field">
                      <label>Age</label>
                      <input type="number" onmousemove="FindAge()" id="age" name="request_age" placeholder="Your age " required>
                    </div>
                    <div class="input-field">
                      <label>Mobile Number</label>
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
                      <label>Purok</label>
                      <input type="text" id="purok" name="request_purok" placeholder="Enter your Purok" required>
                    </div>
                    <div class="input-field">
                      <label>Province</label>
                      <select required name="request_province" id="province">
                        <option disabled selected>Select Province</option>


                      </select>
                    </div>
                  
                    <div class="input-field">
                      <label>City</label>
                      <select required name="request_city" id="city">
                        <option disabled selected>Select City</option>


                      </select>
                    </div>
                    <div class="input-field">
                      <label>Barangay</label>
                      <select required name="request_barangay" id="barangay">
                        <option disabled selected>Select Barangay</option>


                      </select>
                    </div>
                    <div class="input-field">
                          <label></label>
                          <input type="text"  style="border: none;"  placeholder=""  readonly>
                        </div>
                        <div class="input-field">
                          <label></label>
                          <input type="text"  style="border: none;"  placeholder=""  readonly>
                        </div>

                   

                   
                  </div>
                </div>
                <button type="submit" id="third" name="submit" class="btn btn-primary" style="float:right; margin-left:auto;">Submit</button>
              </div>
          </div>
        </div>
      </div>
      </div>
      </div>
      </form>

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
    //FUNCTIONS

    console.log(<?php echo json_encode($patient) ?>)

    function FindAge() {
      var day = document.getElementById("dob").value;
      var DOB = new Date(day);
      var today = new Date();
      var Age = today.getTime() - DOB.getTime();
      Age = Math.floor(Age / (1000 * 60 * 60 * 24 * 365.25));
      document.getElementById("age").value = Age;
    }




    const form = document.getElementById('patient_form');


    form.addEventListener('submit', function(event) {
      event.preventDefault();
      const formData = new FormData(form);
      console.log('hello')

      fetch('utils/edit_patient.php', {
          method: 'POST',
          body: formData,

        })
        .then(() => {
          Swal.fire({
            title: "Patient Details Edited",
            icon: "success",
          }).then(() => {
            window.location.href = 'patient-table.php'
          })
        })
    });

    const user_id = <?php echo $_SESSION['id'] ?>;
    const patient = <?php echo json_encode($patient) ?>;
    document.addEventListener("DOMContentLoaded", () => {

      changeData();
      //console.log(request.id);

      function changeData() {


        $('#last_name').val(patient.last_name);
        $('#first_name').val(patient.first_name);
        $('#gender').val(patient.gender);
        $('#dob').val(patient.birthdate);
        $('#age').val(patient.age)
        $('#mobile_number').val(patient.mobile_number);
        $('#province').html(`<option value="${patient.province}">${patient.province}</option>`);
        $('#city').html(`<option value="${patient.city}">${patient.city}</option>`);
        $('#barangay').html(`<option value="${patient.barangay}">${patient.barangay}</option>`);
        $('#purok').val(patient.purok);

        $('#subdivision').val(patient.subdivision);
        $('#house_no').val(patient.house_no);




      }
    })
  </script>
  <script>
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



</body>

</html>