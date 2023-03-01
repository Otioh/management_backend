<?php
header('Access-Control-Allow-Origin:*'); 
include_once('db.php');

if(isset($_POST['pay'])){ 
    
    $date_created=date("d/m/y");
     $pay_id='T'.mt_rand(0,9).mt_rand(0,9).mt_rand(0,9).mt_rand(0,9).mt_rand(0,9).mt_rand(0,9).mt_rand(0,9).mt_rand(0,9);
    $payer=$_POST['payer'];
    $description=$_POST['description'];
    $amount=$_POST['amount'];
    $status=$_POST['status'];
    $tran_id=$_POST['tran_id'];

    $query="SELECT * FROM students WHERE reg_no='".$payer."'";

$result = mysqli_query($conn,$query);

if (mysqli_num_rows($result) > 0) {
$row=mysqli_fetch_assoc($result);


    $query="INSERT INTO `payments` (`id`, `transaction_id`, `description`, `amount`, `payer`, `status`, `date_initiated`, `payment_id`) VALUES (NULL, '".$tran_id."', '".$description."', ".$amount.", '".$payer."', '".$status."', '".$date_created."', '".$pay_id."');";

    if(mysqli_query($conn,$query)){
echo 'Payment Successful for '.$row['first_name'].' '.$row['surname'].'';
    }else{
        echo "Error Registering Payment";
    }
}else{
    echo "No Student Found with ".$payer."";
}
    
}else{

    if(isset($_GET['delete'])){
        $query="DELETE  FROM payments WHERE id='".$_GET['id']."' "; 
            if(mysqli_query($conn,$query)){
    echo 'payments with '.$_GET['id'].' Deleted Successfully';
        }
    
    }else{
$query="SELECT * FROM payments";
$result = mysqli_query($conn,$query);

  $rows = array();
  while($r = mysqli_fetch_array($result)) {
    $rows[] = $r;
  }
  echo json_encode($rows);

  mysqli_close($conn);
}




}


?>