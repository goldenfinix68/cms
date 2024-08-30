<?php 
require_once('dbConnect.php');
  if($_SERVER['REQUEST_METHOD']=='POST'){
    $response = array();
    $email = $_POST['email'];
    $password = $_POST['password'];
    $sql = "SELECT * FROM users WHERE email='$email' AND password='$password'";
    $res = mysqli_query($con, $sql);
    $check = mysqli_fetch_array($res);
    if(isset($check)){
      $sql = "SELECT * FROM users WHERE email='$email' AND password='$password'";
      $res = mysqli_query($con, $sql);
      $result = array();
      while ($row = mysqli_fetch_array($res)) {
      array_push ($result, array('id' => $row[0], 'name' => $row[1],'email' => $row[2], 'email_verified_at' => $row[3], 'password' => $row[4], 'remember_token' => $row[5], 'address' => $row[6], 'created_at' => $row[7], 'updated_at' => $row[8]));
      }
      echo json_encode(array("value" => 1,"message" => "Success", "result" => $result));
    }else{
      $response ["value"] = 0;
      $response ["message"] = "Invalid Username and Password";
      echo json_encode($response);
    }
    mysqli_close($con);
  }
?>