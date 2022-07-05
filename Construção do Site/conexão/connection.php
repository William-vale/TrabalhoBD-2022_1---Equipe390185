<?php

	$dbServer = "localhost";
	$dbUser = "root";
	$dbPassword = "";
	$dbName = "biblioteca";

	$conn = mysqli_connect($dbServer, $dbUser, $dbPassword, $dbName);

	if (mysqli_connect_errno()) {
    printf("Connect failed: %s\n", mysqli_connect_error());
    exit();
	}else{
    	echo 'conexão';
    }

?>