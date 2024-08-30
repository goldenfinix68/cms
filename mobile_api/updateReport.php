<?php
  require_once ('dbConnect.php');
  if ($_SERVER ['REQUEST_METHOD'] == 'POST') {

     $response = array();
     // get 
     $id = $_POST['id'];
     $userid = $_POST ['user_id'];
     $reason = $_POST ['reason'];


     $sql = "UPDATE `components` SET `description`='$reason', `updated_by`='$userid',`updated_at`= CURRENT_TIME() WHERE `component_id` = '$id' ORDER BY component_id DESC";
     if (mysqli_query($con, $sql)) {

      $sql1 = "SELECT users.name AS `reported_by`, components.description, components.created_at, hardwares.*, components.quantity1, components.component_id FROM `components` JOIN hardwares ON components.id = hardwares.id JOIN users ON components.created_by = users.id";
      $res = mysqli_query($con, $sql1);
      $result = array();
      while ($row = mysqli_fetch_array($res)) {
      array_push ($result, array('reported_by' => $row[0], 'reason' => $row[1], 'date_created' => $row[2], 'id' => $row[3],'name' => $row[4], 'description' => $row[5], 'image' => $row[6], 'model_number' => $row[7], 'location' => $row[8], 'status' => $row[9], 'created_at' => $row[10], 'updated_at' => $row[11], 'category' => $row[12], 'qty' => $row[13],'component_id' => $row[14]));
      }

      echo json_encode(array("value" => 1,"message" => "Success", "result" => $result));

     } else {
       $response["value"] = 0;
       $response["message"] = "fail";
       echo json_encode($response);
     }
     // close the database
     mysqli_close($con);
  }
?>
