<?php
require_once __DIR__ . '/../../../Models/RequestModel.php';
header("Content-Type: application/json");



$time = $_GET['time'];
$requestModel = new RequestModel();
$data = $requestModel->getSalesRequestByTime($time);

echo json_encode($data);