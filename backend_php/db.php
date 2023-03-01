<?php
header('Access-Control-Allow-Origin:*');

  $conn=mysqli_connect("localhost", 'root', '','roicomsat');

  // Check connection
  if (mysqli_connect_errno())
  {
   echo "Failed to connect to MySQL: " . mysqli_connect_error();
  }


?>