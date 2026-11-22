<?php
$server = "localhost";
$user = "root";
$password = "";
$db = "ponchao";

	$conn = new mysqli($server,$user,$password,$db);
	mysqli_set_charset($conn, "utf8");
	if($conn->connect_error){
		die("no jala we " . $conn->connect_error);
	}else{
	}
?>