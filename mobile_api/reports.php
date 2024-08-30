<?php 
require_once('dbConnect.php');
  if($_SERVER['REQUEST_METHOD']=='GET'){

    $response = array();
    $sql = "SELECT users.name AS `reported_by`, components.description, components.created_at, hardwares.*, components.quantity1, components.component_id FROM `components` JOIN hardwares ON components.id = hardwares.id JOIN users ON components.created_by = users.id ORDER BY components.component_id";
    $res = mysqli_query($con, $sql);
    $result = array();
    while ($row = mysqli_fetch_array($res)) {
    array_push ($result, array('reported_by' => $row[0], 'reason' => $row[1], 'date_created' => $row[2], 'id' => $row[3],'name' => $row[4], 'description' => $row[5], 'image' => $row[6], 'model_number' => $row[7], 'location' => $row[8], 'status' => $row[9], 'created_at' => $row[10], 'updated_at' => $row[11], 'category' => $row[12], 'qty' => $row[13], 'component_id' => $row[14]));
    }
    echo json_encode(array("value" => 1,"message" => "Success", "result" => $result));
    mysqli_close($con);
  }
?>