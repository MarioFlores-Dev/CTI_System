<?php
    include('../connectionDB.php');

    $query = "SELECT * FROM tbl_computerlog";
    $result = mysqli_query($connection, $query);

    if(!$result){
        die('Query Failed'.mysqli_error($connection));
    }
    
    $json = array();
    while($row = mysqli_fetch_array($result)){
        if($row['status'] == 1 ){
            $json[] = array(
                'marca' => $row['marca'],
                'model' => $row['model'],
                'processor' => $row['processor'],
                'createdate' => $row['create_date'],
                'ram' => $row['ram'],
                'id' => $row['id'],
                'disk' => $row['disk'],
                'sizeDisk' => $row['sizeDisk'],
                'state' => $row['state'],
            );  
        }
    }

    $jsonString = json_encode($json);
    echo $jsonString;

?>