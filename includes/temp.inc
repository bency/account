<?php
$date = $_POST['buy_date'];
$year = substr($date,0,4);
$month = substr($date,5,2);
$day = substr($date,8,2);
$query = "insert into spend_record(buyer,owner,cost,name,buy_date,way_to_pay,project_id) values('".$_POST['buyer']."','".$_POST['owner']."','".$_POST['cost']."','".$_POST['name']."','".mktime(0,0,0,$day,$month,$year)."','".$_POST['way_to_pay']."','0000001')";
if(mysql_query($query))
	$message = "SAVE";
else
	$message = mysql_error();
