<?php
header('Access-Control-Allow-Origin:*'); 
include_once('db.php');

if(isset($_POST['staff'])){ 
    
    
    $date_created=date("d/m/y");

    $first_name=$_POST['first_name'];  
    $surname=$_POST['surname'];
    $other_names=$_POST['other_names']; 
    $email=$_POST['email'];
    $image=$_POST['image'];
    $phone=$_POST['phone'];
    $address=$_POST['address'];
    $lga=$_POST['lga'];
    $state=$_POST['state'];
    $gender=$_POST['gender'];
    $religion=$_POST['religion'];

    $dob=$_POST['dob'];
    $marital=$_POST['marital'];
    $guarantor=$_POST['guarantor'];
    $guarantor_image=$_POST['guarantor_image'];
    $guarantor_phone=$_POST['guarantor_phone'];

    $designation=$_POST['designation'];

    $accno=$_POST['accno'];
    $accname=$_POST['accname'];
    $bank=$_POST['bank'];
    $staff_id='RS'.mt_rand(0,9).mt_rand(0,9).mt_rand(0,9).mt_rand(0,9).mt_rand(0,9).mt_rand(0,9);
    
    if($first_name===""  || $surname==="" || $email==="" || $phone==="" || $image==="" || $guarantor_image==="" ){
        echo 'All Fields are required';
    }else{
       
$query="SELECT * FROM staff WHERE email='".$email."'";

$result = mysqli_query($conn,$query);

if (mysqli_num_rows($result) > 0) {
    echo 'staff Already Exist with this Email: '.$email;
}else{
    $query="INSERT INTO `staff` (`id`, `date_created`, `salary`, `first_name`, `surname`, `other_names`, `image`, `gender`, `dob`, `marital`, `religion`, `phone`, `email`, `address`, `lga`, `state`, `accno`, `accname`, `bank`, `guarantor_name`, `guarantor_phone`, `guarantor_image`, `staff_id`, `designation`) VALUES (NULL, '".$date_created."', 0, '".$first_name."', '".$surname."', '".$other_names."', '".$image."', '".$gender."', '".$dob."', '".$marital."', '".$religion."', '".$phone."', '".$email."', '".$address."', '".$lga."', '".$state."', '".$accno."', '".$accname."', '".$bank."', '".$guarantor."', '".$guarantor_phone."', '".$guarantor_image."', '".$staff_id."', '".$designation."');";

    if(mysqli_query($conn,$query)){
echo 'Registered Successfully';
    }else{
        echo "Error Registering staff";
    }
}

    
}   
    
}else{
if(isset($_GET['salary'])){
    $query="UPDATE staff SET salary=".$_GET['salary']." WHERE email='".$_GET['email']."' "; 
    if(mysqli_query($conn,$query)){
echo 'Staff  Salary Updated Successfully';
}



}elseif(isset($_GET['delete'])){
        $query="DELETE  FROM staff WHERE reg_no='".$_GET['reg_no']."' "; 
            if(mysqli_query($conn,$query)){
    echo 'staff with '.$_GET['reg_no'].' Deleted Successfully';
        }
    
    }else{
$query="SELECT * FROM staff";
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