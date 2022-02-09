<?php
    include('../connectionDB.php');

    $query = "SELECT * FROM tbl_customers";
    $result = mysqli_query($connection, $query);

    if(!$result){
        die('Query Failed'.mysqli_error($connection));
    }
    
    $json = array();
    while($row = mysqli_fetch_array($result)){
        if($row['status'] == 1 ){
            $json[] = array(
                'name' => $row['name'],
                'lastname' => $row['lastname'],
                'phonenumber' => $row['phone_number'],
                'createdate' => $row['create_date'],
                'issue' => $row['issue'],
                'id' => $row['id']
            );  
        }
    }

    $jsonString = json_encode($json);
    echo $jsonString;

?>