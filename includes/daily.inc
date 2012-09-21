<?php

// Get the option of way_to_pay
$menu = array();
$error = "";
$er_count = 0;
if(isset($_POST['submit'])){
	$date = $_POST['buy_date'];
	$year = substr($date,0,4);
	$month = substr($date,5,2);
	$day = substr($date,8,2);
	if(($_POST['buyer']) == ''){
		$error_buyer = "購買人沒填</br>";
		$er_count++;
	}
	if(($_POST['owner']) == ''){
		$error_owner .= "所有人沒填</br>";
		$er_count++;
	}
	if(!isset($_POST['cost']) || $_POST['cost'] == 0){
		$error_cost .= "金額沒填</br>";
		$er_count++;
	}
//	if(($_POST['type']) == ''){
//		$error_type.= "消費類型沒填</br>";
//		$er_count++;
//}
	if(($_POST['name']) == ''){
		$error_name .= "品名沒填</br>";
		$er_count++;
	}
	if(($_POST['buy_date']) == ''){
		$error_buydate .= "日期沒填</br>";
		$er_count++;
	}
	if(!isset($_POST['way_to_pay'])){
		$error_wtp .= "購買方式沒填</br>";
		$er_count++;
	}
	/*
	if(!isset($_POST['project_id'])){
		$error .= "專案沒填</br>";
	}
	*/
	if($er_count == 0){
		$cur_date = $_POST['buy_date'];
		if($_POST['way_to_pay'][0] == 'new'){
			$new_wtp = $_POST['way_to_pay'][1];
			$query_wtp = "insert into WTP(way_name) values('$new_wtp')";
			if($result = mysql_query($query_wtp)){
				$query_wtp = "select way_id from WTP where way_name='$new_wtp'";
				$row = mysql_fetch_assoc(mysql_query($query_wtp));
				$query = "insert into spend_record(buyer,owner,cost,type,name,buy_date,way_to_pay,project_id) values('".$_POST['buyer']."','".$_POST['owner']."','".$_POST['cost']."','".$_POST['type']."','".$_POST['name']."','".mktime(0,0,0,$month,$day,$year)."','".$row['way_id']."','0000001')";
			}
			else
				echo mysql_error();
		}
		else{
			$query = "insert into spend_record(buyer,owner,cost,type,name,buy_date,way_to_pay,project_id) values('".$_POST['buyer']."','".$_POST['owner']."','".$_POST['cost']."','".$_POST['type']."','".$_POST['name']."','".mktime(0,0,0,$month,$day,$year)."','".$_POST['way_to_pay'][0]."','0000001')";
		}

		if(mysql_query($query))
			$message = "SAVE";
		else
			$message = mysql_error();
		$query = mysql_query("select * from spend_record left join WTP on way_to_pay=way_id where buy_date='".mktime(0,0,0,$month,$day,$year)."' order by spend_record.buy_date desc,buyer desc");
		$cur_date = $date;
	}
}
else if(isset($_POST['choose_day'])){
	$date = $_POST['buy_date'];
	$year = substr($date,0,4);
	$month = substr($date,5,2);
	$day = substr($date,8,2);
	$query = mysql_query("select * from spend_record left join WTP on way_to_pay=way_id where buy_date='".mktime(0,0,0,$month,$day,$year)."' order by spend_record.buy_date desc,buyer desc");
	$cur_date = $date;
	$tomorrow = mktime(0,0,0,$month,$day,$year) + 86400;
	$yesterday = mktime(0,0,0,$month,$day,$year) - 86400;
}
else if(isset($_GET['date'])){
	$query = mysql_query("select * from spend_record left join WTP on way_to_pay=way_id where buy_date='".$_GET['date']."' order by spend_record.buy_date desc,buyer desc");
	$cur_date = date('Y-m-d',$_GET['date']);
	$tomorrow = $_GET['date'] + 86400;
	$yesterday = $_GET['date'] - 86400;
}
else if($_POST['delete'] == "yes"){
	$date = $_POST['mod_date'];
	$year = substr($date,0,4);
	$month = substr($date,5,2);
	$day = substr($date,8,2);
	$query = "delete from spend_record where id=".$_POST['id'];
	if(mysql_query($query))
		$error="SAVE";
	else
		$result = mysql_error();
	$query = mysql_query("select * from spend_record left join WTP on way_to_pay=way_id where buy_date='".mktime(0,0,0,$month,$day,$year)."' order by spend_record.buy_date desc,buyer desc");
}
else if($_POST['modify'] == "yes"){
	$date = $_POST['mod_date'];
	$year = substr($date,0,4);
	$month = substr($date,5,2);
	$day = substr($date,8,2);
	$query = "update spend_record set buy_date='".mktime(0,0,0,$month,$day,$year)."',type='".$_POST['mod_type']."',name='".$_POST['mod_name']."',cost='".$_POST['mod_cost']."',way_to_pay='".$_POST['way_to_pay']."' where id=".$_POST['id'];
	if(mysql_query($query))
		$error="SAVE";
	else
		$result = mysql_error();
	$query = mysql_query("select * from spend_record left join WTP on way_to_pay=way_id where buy_date='".mktime(0,0,0,$month,$day,$year)."' order by spend_record.buy_date desc,buyer desc");
}
else if($_POST['modify'] == "no"){
	$date = $_POST['mod_date'];
	$year = substr($date,0,4);
	$month = substr($date,5,2);
	$day = substr($date,8,2);
	$query = mysql_query("select * from spend_record left join WTP on way_to_pay=way_id where buy_date='".mktime(0,0,0,$month,$day,$year)."' order by spend_record.buy_date desc,buyer desc");
}
else{

	$date = $_POST['date'];
	$year = substr($date,0,4);
	$month = substr($date,5,2);
	$day = substr($date,8,2);
	if($_POST['date'] != ''){
		$query = mysql_query("select * from spend_record left join WTP on way_to_pay=way_id where buy_date='".mktime(0,0,0,$month,$day,$year)."' order by spend_record.buy_date desc,buyer desc");
	}
	else
		$query = mysql_query("select * from spend_record join WTP on way_to_pay=way_id where buy_date='".mktime(0,0,0,date('m'),date('d'),date('Y'))."' order by spend_record.buy_date desc,buyer desc limit 0,8");
	$tomorrow = mktime(0,0,0,date('m'),date('d'),date('Y')) + 86400;
	$yesterday = mktime(0,0,0,date('m'),date('d'),date('Y')) - 86400;
}
$wtp_query = mysql_query("select * from WTP order by way_id");
$WTP_option = '';
$num_row = mysql_num_rows($wtp_query);
if($num_row > 0){

	while($res = mysql_fetch_array($wtp_query,MYSQL_ASSOC)){
		if($_POST['way_to_pay'][0] == $res['way_id'])
		$WTP_option .= '<option value="'.$res['way_id'].'" selected>'.$res['way_name'].'</option>';
		else
		$WTP_option .= '<option value="'.$res['way_id'].'">'.$res['way_name'].'</option>';
	}
		$WTP_option .='<option value="new">其他</option>';
}
else{
		$WTP_option ='<option>請選擇</option>';
		$WTP_option .='<option value="new">其他</option>';
}
$num_row = mysql_num_rows($query);

if($num_row > 0){

	while($res = mysql_fetch_array($query,MYSQL_ASSOC)){
		$result.= "<tr><form id='modify' action='#' method='post'>";
		$result.= "<input type='hidden' name='id' value='".$res['id']."'/>";
		if($_POST['id']==$res['id'] && $_POST['modify']=="no"){
			$result.= "<td class=\"span4\"><input value=".date("Y-m-d",$res['buy_date'])." name='mod_date' id='mod_date' class='input-small'/></td>";
			$result.= "<td class=\"span4\"><input value='".$res['type']."' name='mod_type' id='mod_type' class='input-medium'/></td>";
			$result.= "<td class=\"span4\"><input value='".$res['name']."' name='mod_name' id='mod_item' class='input-medium'/></td>";
			$result.= "<td class=\"span1\"><input value='".$res['cost']."' name='mod_cost' class='input-mini'></td>";
		$result.= "<td class=\"span2\">".$res['buyer']."</td>";
		$result.= "<td class=\"span2\">".$res['owner']."</td>";
			$result.= "<td class=\"span2\"><select class=\"span2\" name=\"way_to_pay\">".$WTP_option."</select></td>";
			$result.= "<td><button type='submit' name='modify' value='yes'><i class=\"icon-ok\"></i></button></td><td><button class=\"close\" type='submit' name='delete' value='yes'>&times;</button></td>";
		}
		else{
			$result.= "<td class='span2'>".date("m-d",$res['buy_date'])."</td>";
			$result.= "<td class='span2'>".$res['type']."</td>";
			$result.= "<td class='span2'>".$res['name']."</td>";
			$result.= "<input type='hidden' name='mod_date' value='".date("Y-m-d",$res['buy_date'])."'/>";
			$result.= "<td class='span1'>".$res['cost']."</td>";
			$result.= "<td class='span2'>".$res['buyer']."</td>";
			$result.= "<td class='span2'>".$res['owner']."</td>";
			$result.= "<td class='span2'>".$res['way_name']."</td>";
			$result.= "<td><button type'submit' name='modify' value='no'><i class=\"icon-pencil\"></i></button></td><td><button class=\"close\" type='submit' name='delete' value='yes'>&times;</button></td>";
		}
		$result.= "</tr></form>";
		if($res['owner'] == 'shared'){
			if($res['buyer'] == 'karen'){
				$su_pay['bency'] += $res['cost']/2;
				$su_pay['karen'] -= $res['cost']/2;
			}
			else{
				$su_pay['bency'] -= $res['cost']/2;
				$su_pay['karen'] += $res['cost']/2;
			}
		}
		else if($res['owner'] != $res['buyer']){
			if($res['buyer'] == 'karen'){
				$su_pay['bency'] += $res['cost'];
				$su_pay['karen'] -= $res['cost'];
			}
			else{
				$su_pay['bency'] -= $res['cost'];
				$su_pay['karen'] += $res['cost'];
			}
		}
		/*
		if($res['way_id'] == 0)
			$pay[$res['buyer']] += $res['cost'];
		else if($res['way_id'] == 1)
			$yoyo[$res['buyer']] += $res['cost'];
		else if($res['way_id'] == 2)
			$credit[$res['buyer']] += $res['cost'];
			*/
		//$record[$res['way_name']][$res['buyer']] += $res['cost'];
		$record[$res['way_name']][$res['buyer']] += $res['cost'];
		if($res['cash'] == 'yes')
			$pay[$res['buyer']] += $res['cost'];
	}
}
?>
