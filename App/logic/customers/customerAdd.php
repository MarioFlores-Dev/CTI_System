<?php
    include("../connectionDB.php");

    $name = $_POST['name'];
    $lastname = $_POST['lastname'];
    $phoneNumber = $_POST['phonenumber'];
    $issue = $_POST['issue'];

    if(isset($name) || isset($phoneNumber)){
        $query = "INSERT INTO tbl_customers (name, lastname, issue , phone_number)
                    VALUES ('$name','$lastname', '$issue', $phoneNumber)";
        $result = mysqli_query($connection, $query);

        if(!$result){
            die("Query Failed".mysqli_error($connection));
        }
        else{
            echo('Cliente agregado satisfactoriamente');
        }
    }


?>