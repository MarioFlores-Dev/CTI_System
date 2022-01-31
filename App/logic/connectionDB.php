<?php

    $server = "localhost";
    $user = "root";
    $pwd = "";
    $db = "db_cti";

    $connection = mysqli_connect($server,$user,$pwd,$db) 
                    or die("Algo ha salido mal") ;

?>