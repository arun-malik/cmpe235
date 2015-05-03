<?php
header('Access-Control-Allow-Origin: *');
include 'database_config.php';

$data = json_decode(file_get_contents('php://input'), true);
$ID = $data["ID"];
$pw = $data["password"];

$is_authentic = authenticate_user($ID, $pw);

$r = array('status'=>$is_authentic);

header('Content-Type: application/json');
echo json_encode($r);

function authenticate_user($ID, $pw){
	$conn = get_connection();
	$sql = "SELECT * FROM `login` WHERE ID='$ID' AND Password='$pw'";
	$result = mysqli_query($conn, $sql);

	if (mysqli_num_rows($result) > 0) {
		$data = "true";
	} else {
		$data = "false";
	}
	mysqli_close($conn);
	return $data;
}
?>