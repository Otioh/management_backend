<?php
include_once('db.php');


$query="SELECT * FROM programmes";
$result = mysqli_query($conn,$query);

  $rows = array();
  while($r = mysqli_fetch_array($result)) {
    $rows[] = $r;
  }
  echo json_encode($rows);

  mysqli_close($conn);


?>