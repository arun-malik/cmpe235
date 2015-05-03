<?php
header('Access-Control-Allow-Origin: *');
include 'database_config.php';

$input = json_decode(file_get_contents('php://input'), true);
$courseId = $input["courseId"];
$PHomework = $input["PHomework"];
$PLabs = $input["PLabs"];
$PProject = $input["PProject"];
$PPresentation = $input["PPresentation"];
$PMidterm = $input["PMidterm"];
$PFinal = $input["PFinal"];


$total = $PHomework + $PLabs + $PProject + $PPresentation + $PMidterm + $PFinal;
if($total != 100){
	http_response_code(400);
	$response = array("error"=>"one of the fields is wrong");
	return json_encode($response);
}
print "not executed";
$conn = get_connection();

$sql = "UPDATE courses SET ".
		"PHomework=$PHomework, ".
		"PLabs=$PLabs, ".
		"PProject=$PProject, ".
		"PPresentation=$PPresentation, ".
		"PMidterm=$PMidterm, ".
		"PFinal=$PFinal ".
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