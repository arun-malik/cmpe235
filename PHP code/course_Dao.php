<?php
include 'database_config.php';

/* 
	returns course Name and courseId.
*/
function get_course_info_by_id($courseId){

	$conn = get_connection();
	$sql = "SELECT * FROM courses where ID=" . $courseId;
	$result = mysqli_query($conn, $sql);

	if (mysqli_num_rows($result) > 0) {
    // output data of each row
		while($row = mysqli_fetch_assoc($result)) {
			$data = get_course_record($row);
		}
	} else {
		echo "0 results";
	}
	mysqli_close($conn);
	return $data;
}

function get_students_info_by_id($courseId){
	
	$conn = get_connection();
	$sql = "select * from users inner join course_user on users.ID = course_user.PUserId where course_user.PCourseId = $courseId";
	//$sql = "SELECT * FROM courses where ID=" . $courseId;
	$result = mysqli_query($conn, $sql);
	$array = array();
	if (mysqli_num_rows($result) > 0) {
    // output data of each row
		while($row = mysqli_fetch_assoc($result)) {
			$data = get_course_user_record($row);
			$array[] = $data;
		}
	} else {
		echo "0 results";
	}
	mysqli_close($conn);
	return $array;
}
/*
	returns all courses present in the database.
*/
function get_course_info(){
	$conn = get_connection();
	$sql = "SELECT * FROM courses";
	$result = mysqli_query($conn, $sql);
	$array = array();
	if (mysqli_num_rows($result) > 0) {
    // output data of each row
		while($row = mysqli_fetch_assoc($result)) {
			$data = get_course_record($row);
			$array[] = $data;
		}
	} else {
		echo "0 results";
	}
	
	mysqli_close($conn);
	return $array;
}

/*
	gets array in the right format.
*/
function get_course_record($row){
	$data = array('ID'=>intval($row["ID"]), 
					'CourseName'=>$row["CourseName"], 
					'MHomework'=>intval($row["MHomework"]), 
					'MLabs'=>intval($row["MLabs"]),
					'MProject'=>intval($row["MProject"]), 
					'MPresentation'=>intval($row["MPresentation"]), 
					'MMidterm'=>intval($row["MMidterm"]),
					'MFinal'=>intval($row["MFinal"]), 
					'PHomework'=>intval($row["PHomework"]), 
					'PLabs'=>intval($row["PLabs"]),
					'PProject'=>intval($row["PProject"]), 
					'PPresentation'=>intval($row["PPresentation"]), 
					'PMidterm'=>intval($row["PMidterm"]),
					'PFinal'=>intval($row["PFinal"]), 
					'ARangeStart'=>intval($row["ARangeStart"]), 
					'ARangeEnd'=>intval($row["ARangeEnd"]),
					'BRangeStart'=>intval($row["BRangeStart"]), 
					'BRangeEnd'=>intval($row["BRangeEnd"]), 
					'CRangeStart'=>intval($row["CRangeStart"]), 
					'CRangeEnd'=>intval($row["CRangeEnd"]), 
					'DRangeStart'=>intval($row["DRangeStart"]), 
					'DRangeEnd'=>intval($row["DRangeEnd"]), 
					'ERangeStart'=>intval($row["ERangeStart"]), 
					'ERangeEnd'=>intval($row["ERangeEnd"]), 
					'FRangeStart'=>intval($row["FRangeStart"]),
					'FRangeEnd'=>intval($row["FRangeEnd"]),
					'Description'=>$row['Description']);
	//print "data is: \n" . $data;	
	return $data;
}

function get_course_user_record($row){
		$data = array('ID'=>intval($row["ID"]), 
					'Homework'=>intval($row["Homework"]), 
					'Labs'=>intval($row["Labs"]),
					'Project'=>intval($row["Project"]), 
					'Presentation'=>intval($row["Presentation"]), 
					'Midterm'=>intval($row["Midterm"]),
					'Final'=>intval($row["Final"]), 
					'FirstName'=>$row["FirstName"],
					'LastName'=>$row["LastName"],
					'EmailId'=>$row["EmailId"]);
		
		return $data;
}
?>