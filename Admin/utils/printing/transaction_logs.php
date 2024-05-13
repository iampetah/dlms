<?php
require_once '../../../Models/RequestModel.php';
require('../../../fpdf186/fpdf.php');
require_once '../../../Models/EmployeeModel.php';
require_once '../is_login.php';

$id = $_SESSION['id'];
$requestModel = new RequestModel();
$requests = $requestModel->getRequests();
$employeeModel = new EmployeeModel();
$employee = $employeeModel->getEmployeeById($id);
$line_height = 4;
$pdf = new FPDF('P', 'mm', 'Letter');

$pdf->AddPage();

// Set font
$pdf->SetFont('Arial', 'B', 25);
$pdf->SetTextColor(255, 0, 0);

// Title
$pdf->Image('../../../assets/img/logo01.png', 1, 10, 28, 28, 'PNG');
$pdf->Image('../../../assets/img/logo02.png', 180, 10, 33, 33, 'PNG');

$pdf->Cell(193, 10, 'PANABO CITY DIAGNOSTIC CENTER', 0, 1, 'C');
$pdf->SetFont('Arial', 'B', 15);
$pdf->SetTextColor(0, 0, 0);

$pdf->Cell(190, 3, 'PARTNERSHIP, COMMITMENT, DEVOTION, AND CARE', 0, 1, 'C');
$pdf->SetFont('Arial', 'B', 10);
$pdf->Cell(190, 5, 'panabo.diagnostic@yahoo/gmail.com', 0, 1, 'C');
$pdf->SetFont('Arial', 'B', 12);
$pdf->Cell(190, 5, 'PLDT Landline:(084) 217-3824', 0, 1, 'C');
$pdf->Cell(190, 5, '_____________________________________________________', 0, 1, 'C');
$pdf->SetFont('Arial', 'B', 15);
$pdf->Cell(190, 8, 'TRANSACTION LOGS', 0, 1, 'C', $pdf->SetTextColor(135, 206, 235));


$pdf->Ln(8);

$pdf->SetTextColor(135, 206, 235);
$pdf->SetFont('Arial', '', 12);
$pdf->Cell(90, 8, 'Test', 1, 0, 'C');

$pdf->Cell(35, 8, 'Amount', 1, 0, 'C');

$pdf->Cell(35, 8, 'Time Started', 1, 0, 'C');
$pdf->Cell(35, 8, 'Time Ended', 1, 0, 'C');
$pdf->Ln(8);
$pdf->SetFillColor(255, 255, 255);
$pdf->SetTextColor(0, 0, 0);
foreach ($requests as $request) {
  $started_time = date('F d, Y', strtotime($request->request_date)) . "\n";
  $started_time .= date('H:i', strtotime($request->request_date));
  $started_date = date("F d, Y", strtotime($request->request_date));
  $no_of_lines = 0;
  if ($request->result_date != null) {
    $result_time = date("F d, Y", strtotime($request->result_date)) . "\n";
    $result_time .= date('H:i', strtotime($request->result_date));
  } else {
    echo $request->result_date;
    $result_time = "N/A";
  }
  $tests = "";
  $no_of_lines = 0;
  foreach ($request->services as $service) {
    $tests .=  $service->name . ",\n";
    $no_of_lines++;
  }


  if ($no_of_lines == 0) {
    $no_of_lines = 2;
  }
  if ($tests == "" || $tests == null) {
    $tests = "\n N/A \n";
  }


  for ($i = 0; $i < $no_of_lines - 1; $i++) {
    $started_time .= "\n";
    $result_time .= "\n";
  }
  if (str_contains($result_time, "N/A")) {
    $result_time .= "\n";
  }
  $pdf->SetFont('Arial', '', 10);
  $row_height = $line_height * $no_of_lines;
  $pdf->MultiCell(90, $line_height, $tests, 1, 0, 'C');
  $pdf->SetFont('Arial', '', 11);
  //$pdf->setX(65);
  $y = $pdf->GetY();
  $x = $pdf->GetX();
  $pdf->SetXY($x + 90, $y - $row_height);
  $pdf->MultiCell(35, $line_height * ($no_of_lines), $request->total . '.00', 1, 0, 'R  ');
  $x = $pdf->GetX();

  $pdf->SetXY($x + 125, $y - $row_height);
  $pdf->MultiCell(35, $line_height, $started_time, 1, 0, 'C');
  $pdf->SetXY($x + 160, $y - $row_height);
  $pdf->MultiCell(35, $line_height, $result_time, 1, 0, 'C');
  $pdf->Ln(0);
}
$pdf->Ln(20);
$pdf->SetFont('Arial', 'B', 10);
$pdf->Cell(25, 3, '', 0, 0);
$pdf->Cell(133 - (strlen($employee->getFullName())), 3, 'Evelyn Nuyad', 0, 0);
$pdf->Cell(140, 3, $employee->getFullName(), 0, 0);
$pdf->Cell(190, 3, '', 0, 1);
$pdf->Cell(135, -2, '____________________________________', 0, 0);
$pdf->Cell(55, -2, '__________________________', 0, 1);
$pdf->SetFont('Arial', '', 8);
$pdf->Cell(20, 10, '', 0, 0);
$pdf->SetFont('Arial', 'B', 11);
$pdf->SetTextColor(135, 206, 235);
$pdf->Cell(5, 10, '', 0, 0);
$pdf->Cell(120, 10, 'PCDC Owner', 0, 0);
$pdf->Cell(150, 10, 'Information Desk', 0, 0);
$pdf->Output('invoice.pdf', 'I');