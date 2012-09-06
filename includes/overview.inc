<?php
$query = mysql_query("select * from spend_record left join WTP on way_to_pay=way_id order by spend_record.buy_date desc,buyer desc");
$num_row = mysql_num_rows($query);
if($num_row > 0){

	while($res = mysql_fetch_array($query,MYSQL_ASSOC)){
		$result.= "<tr>";
		$result.= "<td class=\"span4\">".date("m-d",$res['buy_date'])."</td>";
		$result.= "<td class=\"span4\">".$res['name']."</td>";
		$result.= "<td class=\"span1\">".$res['cost']."</td>";
		$result.= "<td class=\"span2\">".$res['buyer']."</td>";
		$result.= "<td class=\"span2\">".$res['owner']."</td>";
		$result.= "<td class=\"span2\">".$res['way_name']."</td>";
		$result.= "</tr>";
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
		if($res['way_id'] == 0)
			$pay[$res['buyer']] += $res['cost'];
		else if($res['way_id'] == 1)
			$yoyo[$res['buyer']] += $res['cost'];
		else if($res['way_id'] == 2)
			$credit[$res['buyer']] += $res['cost'];
	}
}
?>
