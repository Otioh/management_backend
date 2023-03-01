<?php
header('Access-Control-Allow-Origin:*');
include_once('db.php');

if(isset($_POST['student'])){
    
    
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
    $programme=$_POST['programme'];
    $pro_id=$_POST['pro_id']; 
    $dob=$_POST['dob'];
    $marital=$_POST['marital'];
    $guarantor=$_POST['guarantor'];
    $guarantor_image=$_POST['guarantor_image'];
    $guarantor_phone=$_POST['guarantor_phone'];
    $guarantor_address=$_POST['guarantor_address'];
    $date_admitted=$_POST['date_admitted'];
    $graduation=$_POST['graduation'];
    $reg_no='ROI'.mt_rand(0,9).mt_rand(0,9).mt_rand(0,9).mt_rand(0,9).mt_rand(0,9).mt_rand(0,9);
    
    if($first_name===""  || $surname==="" || $email==="" || $phone==="" || $image==="" || $guarantor_image===""  || $programme===""){
        echo 'All Fields are required';
    }else{
       
$query="SELECT * FROM students WHERE email='".$email."'";

$result = mysqli_query($conn,$query);

if (mysqli_num_rows($result) > 0) {
    echo 'Student Already Exist with this Email: '.$email;
}else{
    $query="INSERT INTO `students` (`id`, `first_name`, `surname`, `other_names`, `dob`, `marital`, `phone`, `email`, `address`, `lga`, `state`, `guarantor`, `guarantor_image`, `guarantor_phone`, `reg_no`, `fee_paid`, `fee`, `image`, `programme`, `graduated`, `prog_id`, `gender`, `guarantor_address`, `date_admitted`, `graduation`) VALUES (NULL, '".$first_name."', '".$surname."', '".$other_names."', '".$dob."', '".$marital."', '".$phone."', '".$email."', '".$address."', '".$lga."', '".$state."', '".$guarantor."', '".$guarantor_image."', '".$guarantor_phone."', '".$reg_no."', '', '30000', '".$image."', '".$programme."', '', '".$pro_id."', '".$gender."', '".$guarantor_address."', '".$date_admitted."', '".$graduation."');";

    if(mysqli_query($conn,$query)){
echo 'Registered Successfully';
    }else{
        echo "Error Registering Student";
    }
}

    
}   
    
}elseif(isset($_POST['update'])){

    $first_name=$_POST['first_name']; 
    $surname=$_POST['surname'];
    $other_names=$_POST['other_names']; 
    $email=$_POST['email'];
    $image=$_POST['image'];

    $address=$_POST['address'];
    $lga=$_POST['lga'];
    $state=$_POST['state'];


    $dob=$_POST['dob'];
  
    $guarantor=$_POST['guarantor'];

    $guarantor_phone=$_POST['guarantor_phone'];
    $guarantor_address=$_POST['guarantor_address'];
    $date_admitted=$_POST['date_admitted'];
    $graduation=$_POST['graduation'];
    $reg_no=$_POST['reg_no'];;
    
    if($first_name===""  || $surname==="" || $email==="" || $phone==="" || $image==="" || $guarantor_image===""  || $programme===""){
        echo 'All Fields are required';
    }else{
       
$query="SELECT * FROM students WHERE email='".$email."'";

$result = mysqli_query($conn,$query);

if (mysqli_num_rows($result) > 0) {
    echo 'Student Already Exist with this Email: '.$email;
}else{
    $query="INSERT INTO `students` (`id`, `first_name`, `surname`, `other_names`, `dob`, `marital`, `phone`, `email`, `address`, `lga`, `state`, `guarantor`, `guarantor_image`, `guarantor_phone`, `reg_no`, `fee_paid`, `fee`, `image`, `programme`, `graduated`, `prog_id`, `gender`, `guarantor_address`, `date_admitted`, `graduation`) VALUES (NULL, '".$first_name."', '".$surname."', '".$other_names."', '".$dob."', '".$marital."', '".$phone."', '".$email."', '".$address."', '".$lga."', '".$state."', '".$guarantor."', '".$guarantor_image."', '".$guarantor_phone."', '".$reg_no."', '', '30000', '".$image."', '".$programme."', '', '".$pro_id."', '".$gender."', '".$guarantor_address."', '".$date_admitted."', '".$graduation."');";

    if(mysqli_query($conn,$query)){
echo 'Registered Successfully';
    }else{
        echo "Error Registering Student";
    }
}

    
}   


}else{

    if(isset($_GET['delete'])){
        $query="DELETE  FROM students WHERE reg_no='".$_GET['reg_no']."' ";
            if(mysqli_query($conn,$query)){
    echo 'Student with '.$_GET['reg_no'].' Deleted Successfully';
        }
    
    }elseif(isset($_GET['id'])){
        $query="SELECT * FROM students WHERE reg_no='".$_GET['id']."' OR email='".$_GET['id']."'";
        $result = mysqli_query($conn,$query);

        $rows = array();
        while($r = mysqli_fetch_array($result)) {
          $rows[] = $r;
        }
        echo json_encode($rows);
    
    }else{
$query="SELECT * FROM students";
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