<?php
$servername = "cmpe235project.c6xea0kpbutv.us-east-1.rds.amazonaws.com";
$username = "root";
$password = "rootcmpe235";
$dbname = "mydb";

/*
	returns connection object of the database.
*/
function get_connection(){
	global $servername, $username, $password, $dbname;
	// Create connection
	$conn = mysqli_connect($servername, $username, $password, $dbname);
	// Check connection
	if (!$conn) {
		die("Connection failed: " . mysqli_connect_error());
	}
	return $conn;
}

?>