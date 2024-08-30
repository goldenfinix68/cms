<?php 
require_once('dbConnect.php');
  if($_SERVER['REQUEST_METHOD']=='POST'){

    $response = array();

    // get 
    $id = $_POST['id'];

    $sql = "SELECT * FROM hardwares WHERE `id` = '$id'";
    $res = mysqli_query($con, $sql);
    $result = array();
    while ($row = mysqli_fetch_array($res)) { 
    array_push ($result, array('id' => $row[0],'name' => $row[1], 'description' => $row[2], 'image' => $row[3], 'model_number' => $row[4], 'location' => $row[5], 'status' => $row[6], 'created_at' => $row[7], 'updated_at' => $row[8], 'category' => $row[9]));
    }
    echo json_encode(array("value" => 1,"message" => "Success", "result" => $result));
    mysqli_close($con);
  }
?>