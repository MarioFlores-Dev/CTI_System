<?php
    include('../connectionDB.php');

    $query = "SELECT * FROM tbl_customers";
    $result = mysqli_query($connection, $query);

    if(!$result){
        die('Query Failed'.mysqli_error($connection));
    }
    
    $json = array();
    while($row = mysqli_fetch_array($result)){
        $json[] = array(
            'name' => $row['name'],
            'lastname' => $row['lastname'],
            'phonenumber' => $row['phone_number'],
            'id' => $row['id']
        );
    }

    $jsonString = json_encode($json);
    echo $jsonString;

?>