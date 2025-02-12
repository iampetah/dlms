<?php
require_once 'utils/is_login.php';
require_once '../Models/EmployeeModel.php';
require_once '../Models/PatientModel.php';
require_once '../Models/RequestModel.php';
$head_title = 'Patient List';
$page_title = 'Dashboard';
$employeeModel = new EmployeeModel();
$employee = $employeeModel->getEmployeeById($_SESSION['id']);
$patientModel = new PatientModel();
$patients = [];
$requestModel = new RequestModel();
$requests = $requestModel->getRequestsByStatus(Request::PAID);
$paidRequests = [];
$service_id = null;
foreach ($requests as $request) {
    foreach ($request->services as $service) {
        if (($service->name == "CBC" || $service->name == "Complete Blood Count") && count($service->results) == 0) {

            $paidRequests[] = $request;
            $service_id = $service->id;
        }
    }
}

?>
<!DOCTYPE html>
<html lang="en">
<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/sweetalert2@10.10.1/dist/sweetalert2.min.css'>
<?php require_once 'components/head.html' ?>
<style>
    @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap');

    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        font-family: 'Inter', sans-serif;
    }

    .formbold-mb-3 {
        margin-bottom: 15px;
    }

    .formbold-main-wrapper {
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 48px;
    }

    .formbold-form-wrapper {
        margin: 0 auto;
        max-width: 570px;
        width: 100%;
        background: white;

    }

    .formbold-img {
        display: block;
        margin: 0 auto 45px;
    }

    .formbold-input-wrapp>div {
        display: flex;
        gap: 20px;
    }

    .formbold-input-flex {
        display: flex;
        gap: 20px;
        margin-bottom: 15px;
    }

    .formbold-input-flex>div {
        width: 50%;
    }

    .formbold-form-input {
        width: 100%;
        padding: 13px 22px;
        border-radius: 5px;
        border: 1px solid #dde3ec;
        background: #ffffff;
        font-weight: 500;
        font-size: 16px;
        color: #536387;
        outline: none;
        resize: none;
    }

    .formbold-form-input::placeholder,
    select.formbold-form-input,
    .formbold-form-input[type='date']::-webkit-datetime-edit-text,
    .formbold-form-input[type='date']::-webkit-datetime-edit-month-field,
    .formbold-form-input[type='date']::-webkit-datetime-edit-day-field,
    .formbold-form-input[type='date']::-webkit-datetime-edit-year-field {
        color: rgba(83, 99, 135, 0.5);
    }

    .formbold-form-input:focus {
        border-color: #6a64f1;
        box-shadow: 0px 3px 8px rgba(0, 0, 0, 0.05);
    }

    .formbold-form-label {
        color: #07074D;
        font-weight: 500;
        font-size: 14px;
        line-height: 24px;
        display: block;
        margin-bottom: 10px;
    }

    .formbold-form-file-flex {
        display: flex;
        align-items: center;
        gap: 20px;
    }

    .formbold-form-file-flex .formbold-form-label {
        margin-bottom: 0;
    }

    .formbold-form-file {
        font-size: 14px;
        line-height: 24px;
        color: #536387;
    }

    .formbold-form-file::-webkit-file-upload-button {
        display: none;
    }

    .formbold-form-file:before {
        content: 'Upload file';
        display: inline-block;
        background: #EEEEEE;
        border: 0.5px solid #FBFBFB;
        box-shadow: inset 0px 0px 2px rgba(0, 0, 0, 0.25);
        border-radius: 3px;
        padding: 3px 12px;
        outline: none;
        white-space: nowrap;
        -webkit-user-select: none;
        cursor: pointer;
        color: #637381;
        font-weight: 500;
        font-size: 12px;
        line-height: 16px;
        margin-right: 10px;
    }

    .formbold-btn {
        text-align: center;
        width: 100%;
        font-size: 16px;
        border-radius: 5px;
        padding: 14px 25px;
        border: none;
        font-weight: 500;
        background-color: #6a64f1;
        color: white;
        cursor: pointer;
        margin-top: 25px;
    }

    .formbold-btn:hover {
        box-shadow: 0px 3px 8px rgba(0, 0, 0, 0.05);
    }

    .formbold-w-45 {
        width: 45%;
    }
</style>

<body>

    <!-- ======= Header ======= -->
    <!-- End Header -->

    <!-- ======= Sidebar ======= -->
    <!-- ======= Header ======= -->
    <?php require 'components/header.html' ?>

    <!-- ======= Sidebar ======= -->
    <?php require 'components/sidebar.html' ?>

    <main id="main" class="main">

        <div class="pagetitle">
            <h1>Laboratory Result</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="dashboard.php">Home</a></li>
                    <li class="breadcrumb-item">Medical Record</li>
                    <li class="breadcrumb-item active">Urine Analysis </li>
                </ol>
            </nav>
        </div><!-- End Page Title -->

        <section class="section">
            <div class="row">
                <div class="col-lg-4">

                    <div class="card">
                        <div class="card-body profile-card pt-4 d-flex flex-column align-items-center">
                            <h3>Patient information</h3>
                            <div class="row mb-3">

                                <div class="col-sm-12">
                                    <select class="form-select" id="patient-select" aria-label="Default select example">
                                        <option selected>--------Select Patient---------</option>
                                        <?php foreach ($paidRequests as $request) {
                                            $p_fullName = $request->patient->getFullName();

                                            echo "<option class='form-option' value='$request->id'>$p_fullName</option>";
                                        } ?>

                                    </select>
                                </div>
                            </div>
                            <img src="../assets/img/user-profile-icon-in-flat-style-member-avatar-illustration-on-isolated-background-human-permission-s.ico" alt="Profile" class="rounded-circle" style="width: 200px;">

                        </div>
                    </div>
                </div>
                <div class="col-xl-8">

                    <div class="card">
                        <div class="card-body pt-3">
                            <table class="table table-bordered">

                                <tbody>
                                    <tr>
                                        <td scope="row">Firstname</td>
                                        <th data-type='first_name' class='table-data'>Brandon </th>
                                        <td>Family name</td>
                                        <th data-type='last_name' class='table-data'>Jacob</th>
                                    </tr>
                                    <tr>
                                        <td scope="row">Address</td>
                                        <th data-type='address' class='table-data'>Panabo City, Davao del Norte </th>
                                        <td>Age/Gender</td>
                                        <th data-type='age_gender' class='table-data'>22/Male</th>
                                    </tr>
                                    <tr>
                                        <td scope="row">Date Performed</td>
                                        <th data-type='request_date' class='table-data'>June 11, 2023 </th>
                                        <td>Physician</td>
                                        <th>MD</th>
                                    </tr>

                                    <tr>
                                        <td scope="row">Examination Taken</td>
                                        <th data-type='request_date' class='table-data'>Complete Blood Count</th>
                                        <td>Specimen</td>
                                        <th>Whole Blood</th>
                                    </tr>



                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <div class="col-xl-12">
                    <div class="container-fluid">
                        <div class="card mt-1">
                            <div class="card-header">
                                Input Result
                            </div>
                            <div class="card-body">
                                <form id="input-form">
                                    <div class="row">

                                        <div class="row mt-3">
                                            <div class="col-sm-5 mt-3">
                                                <input type="text" style="text-align: center;" value="Test" class="form-control" readonly>
                                            </div>
                                            <div class="col-sm-2 mt-3">
                                                <input type="text" style="text-align: center;" value="Result" class="form-control" readonly>
                                            </div>
                                            <div class="col-sm-5 mt-3">
                                                <input type="text" style="text-align: center;" value="Reference Value" class="form-control" readonly>
                                            </div>

                                            <div class="col-sm-5 mt-3">
                                                <input type="text" class="form-control" value="Hemoglobin count" readonly>
                                            </div>
                                            <div class="col-sm-2 mt-3">
                                                <input type="text" style="text-align: center;" class="form-control" name="hemoglobin_count" data-type="result">
                                            </div>

                                            <div class="col-sm-5 mt-3">
                                                <input type="text" style="text-align: center;" value="120-160g/gL" class="form-control" readonly>
                                            </div>

                                            <div class="col-sm-5 mt-3">
                                                <input type="text" class="form-control" value="Hematocrit count" readonly>
                                            </div>
                                            <div class="col-sm-2 mt-3">
                                                <input type="text" style="text-align: center;" class="form-control" name="hematocrit_count" data-type="result">
                                            </div>

                                            <div class="col-sm-5 mt-3">
                                                <input type="text" style="text-align: center;" value="38-47%" class="form-control" readonly>
                                            </div>

                                            <div class="col-sm-5 mt-3">
                                                <input type="text" class="form-control" value="White Blood Cells" readonly>
                                            </div>
                                            <div class="col-sm-2 mt-3">
                                                <input type="text" style="text-align: center;" class="form-control" name="white_blood_cells" data-type="result">
                                            </div>

                                            <div class="col-sm-5 mt-3">
                                                <input type="text" style="text-align: center;" value="4.5-11.0x10^3/µL" class="form-control">
                                            </div>
                                        </div>



                                        <?php require "components/differential_wbc._template.html" ?>
                                        <table class="table table-bordered mt-3">
                                            <tbody>
                                                <tr>
                                                    <td>Examination Taken</td>
                                                    <td>Urinalysis</td>
                                                    <td>Specimen</td>
                                                    <td>Urine</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <div class="col-sm-12 mt-3">
                                            <input type="text" style="text-align: center;" value="Macroscopic" class="form-control" readonly>
                                        </div>
                                        <div class="row mt-3">
                                            <label for="inputText" class="col-sm-2 col-form-label">Color</label>
                                            <div class="col-sm-4">
                                                <input type="text" class="form-control" name="color" data-type="result">
                                            </div>
                                            <label for="inputText" class="col-sm-2 col-form-label">Sugar</label>
                                            <div class="col-sm-4">
                                                <input type="text" class="form-control" name="sugar" data-type="result">
                                            </div>
                                        </div>
                                        <div class="row mt-3">
                                            <label for="inputText" class="col-sm-2 col-form-label">Appearance</label>
                                            <div class="col-sm-4">
                                                <input type="text" class="form-control" name="appearance" data-type="result">
                                            </div>
                                            <label for="inputText" class="col-sm-2 col-form-label">Albumin</label>
                                            <div class="col-sm-4">
                                                <input type="text" class="form-control" name="albumin" data-type="result">
                                            </div>
                                        </div>
                                        <div class="row mt-3">
                                            <label for="inputText" class="col-sm-2 col-form-label">Specific gravity</label>
                                            <div class="col-sm-4">
                                                <input type="text" class="form-control" name="specific_gravity" data-type="result">
                                            </div>
                                            <label for="inputText" class="col-sm-2 col-form-label">Reaction</label>
                                            <div class="col-sm-4">
                                                <input type="text" class="form-control" name="reaction" data-type="result">
                                            </div>
                                        </div>
                                        <div class="col-sm-12 mt-3">
                                            <input type="text" style="text-align: center;" value="Microscopic" class="form-control" readonly>
                                        </div>
                                        <div class="row mt-3">
                                            <label for="inputText" class="col-sm-2 col-form-label">Sq. Epithelial cells</label>
                                            <div class="col-sm-3">
                                                <input type="text" class="form-control" name="sq_epithelial_cells" data-type="result">
                                            </div>
                                            <div class="col-sm-1">
                                                <input type="text" value="/hpf" class="form-control">
                                            </div>
                                            <label for="inputText" class="col-sm-2 col-form-label">Puss cells</label>
                                            <div class="col-sm-3">
                                                <input type="text" class="form-control" name="puss_cells" data-type="result">
                                            </div>
                                            <div class="col-sm-1">
                                                <input type="text" value="/hpf" class="form-control">
                                            </div>
                                        </div>
                                        <div class="row mt-3">
                                            <label for="inputText" class="col-sm-2 col-form-label">Mucous threads</label>
                                            <div class="col-sm-3">
                                                <input type="text" class="form-control" name="mucous threads" data-type="result">
                                            </div>
                                            <div class="col-sm-1">
                                                <input type="text" value="/hpf" class="form-control">
                                            </div>
                                            <label for="inputText" class="col-sm-2 col-form-label">RBC</label>
                                            <div class="col-sm-3">
                                                <input type="text" class="form-control" name="rbc" data-type="result">
                                            </div>
                                            <div class="col-sm-1">
                                                <input type="text" value="/hpf" class="form-control">
                                            </div>
                                        </div>
                                        <div class="row mt-3">
                                            <label for="inputText" class="col-sm-2 col-form-label">Granular cast</label>
                                            <div class="col-sm-3">
                                                <input type="text" class="form-control" name="granular_cast" data-type="result">
                                            </div>
                                            <div class="col-sm-1">
                                                <input type="text" value="/hpf" class="form-control">
                                            </div>
                                            <label for="inputText" class="col-sm-2 col-form-label">Bacteria</label>
                                            <div class="col-sm-3">
                                                <input type="text" class="form-control" name="bacteria" data-type="result">
                                            </div>
                                            <div class="col-sm-1">
                                                <input type="text" value="/hpf" class="form-control">
                                            </div>
                                        </div>
                                        <div class="row mt-3">
                                            <label for="inputText" class="col-sm-2 col-form-label">Hyaline cast</label>
                                            <div class="col-sm-3">
                                                <input type="text" class="form-control" name="hyaline_cast" data-type="result">
                                            </div>
                                            <div class="col-sm-1">
                                                <input type="text" value="/hpf" class="form-control">
                                            </div>
                                            <label for="inputText" class="col-sm-2 col-form-label">Calcium oxalate</label>
                                            <div class="col-sm-3">
                                                <input type="text" class="form-control" name="calcium_oxalate" data-type="result">
                                            </div>
                                            <div class="col-sm-1">
                                                <input type="text" value="/hpf" class="form-control">
                                            </div>
                                        </div>
                                        <div class="row mt-3">
                                            <label for="inputText" class="col-sm-2 col-form-label">Amorphous urates</label>
                                            <div class="col-sm-3">
                                                <input type="text" class="form-control" name="amorphous_urates" data-type="result">
                                            </div>
                                            <div class="col-sm-1">
                                                <input type="text" value="/hpf" class="form-control">
                                            </div>
                                            <label for="inputText" class="col-sm-2 col-form-label">Amor. phosphates</label>
                                            <div class="col-sm-3">
                                                <input type="text" class="form-control" name="amor_phosphates" data-type="result">
                                            </div>
                                            <div class="col-sm-1">
                                                <input type="text" value="/hpf" class="form-control">
                                            </div>
                                        </div>

                                    </div>
                            </div>
                        </div>
                    </div>
                    </form>
                </div>
                <div class="card-footer text-end">

                    <button onclick="saveResult()" id="#third" class="btn btn-info">Save</button>
                </div>
            </div>
            </div>
            </div>

            </div>
            </div>
            </div>
        </section>
        </section>

    </main><!-- End #main -->

    <!-- ======= Footer ======= -->


    <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

    <!-- Vendor JS Files -->
    <?php require 'components/required_js.html' ?>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script>
        const requests = <?php echo json_encode($paidRequests) ?>;
        const serviceId = <?php echo $service_id ?>;
        console.log("hello", requests);
    </script>
    <script src="../assets/js/admin/medicalRecord.js"></script>
    <script src="../assets/js/admin/medical_record/package_submit.js"></script>

</body>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.10.1/dist/sweetalert2.all.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

</html>