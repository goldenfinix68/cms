<?php
require_once ('dbConnect.php');
  if ($_SERVER ['REQUEST_METHOD'] == 'POST') {

     $response = array();
     // get 
     $id = $_POST['id'];
     $name = $_POST ['name'];
     $description = $_POST ['description'];
     $modelnumber = $_POST ['model_number'];
     $createdby = $_POST ['created_by'];
     $location = $_POST ['location'];
     $qty = $_POST ['qty'];
     $category = $_POST ['category'];
     $status = $_POST ['status'];

     $sql = "INSERT INTO `components`(`id`, `name`, `description`, `model_number`, `created_by`, `created_at`, `updated_by`, `updated_at`, `location`, `quantity1`, `category`, `active`) 
     VALUES('$id','$name','$description','$modelnumber','$createdby',CURRENT_TIME(),'$createdby',CURRENT_TIME(),'$location','$qty', '$category', '$status')";

     if (mysqli_query($con, $sql)) {
       $response["value"] = 1;
       $response["message"] = "success";
       echo json_encode($response);
     } else {
       $response["value"] = 0;
       $response["message"] = "fail";
       echo json_encode($response);
     }
   // close the database
   mysqli_close($con);
  }
?>