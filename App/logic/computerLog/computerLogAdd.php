<?php
    include("../connectionDB.php");

    $marca = $_POST['marca'];
    $model = $_POST['model'];
    $processor = $_POST['processor'];
    $ram = $_POST['ram'];
    $disk = $_POST['disk'];
    $sizeDisk = $_POST['sizeDisk'];
    $state =$_POST['state'];

    if(isset($marca) || isset($model)){
        $query = "INSERT INTO tbl_computerlog (marca, model, processor , ram, disk, sizeDisk, state)
                    VALUES ('$marca','$model', '$processor', '$ram', '$disk', $sizeDisk, '$state')";
        $result = mysqli_query($connection, $query);

        if(!$result){
            die("Query Failed".mysqli_error($connection));
        }
        else{
            echo('Computadora agregada satisfactoriamente');
        }
    }
?>