<?php
include('includes/temp.inc'); 
echo date("U")."</br>";
echo "Year:".$year."</br>";
echo "Mon:".$month."</br>";
echo "Day:".$day."</br>";
echo mktime(0,0,0,$day,$month,$year)."</br>";
var_dump($_POST);
echo $message;
?>
