<?php
header('Access-Control-Allow-Origin: *');
include 'database_config.php';

$input = json_decode(file_get_contents('php://input'), true);
$courseId = $input["courseId"];
$MHomework = $input["MHomework"];
$MLabs = $input["MLabs"];
$MProject = $input["MProject"];
$MPresentation = $input["MPresentation"];
$MMidterm = $input["MMidterm"];
$MFinal = $input["MFinal"];

$conn = get_connection();

$sql = "UPDATE courses SET ".
		"MHomework=$MHomework, ".
		"MLabs=$MLabs, ".
		"MProject=$MProject, ".
		"MPresentation=$MPresentation, ".
		"MMidterm=$MMidterm, ".
		"MFinal=$MFinal ".
		"WHERE ID=$courseId";

if (mysqli_query($conn, $sql)) {
    $status = "Record updated successfully";
} else {
    $status = "Error updating record: " . mysqli_error($conn);
}

$data = array("status"=>$status);	

header('Content-Type: application/json');
echo json_encode($data);
?>