<?php require_once('includes/overview.inc');?>
<div class='span3'>
<form action='#' method='post'>
<legend>日期範圍</legend>
<label>起始</label>
<input class='span2' id='date_start' name='start' type='text' value='<?php echo date("Y-m-d",mktime(0,0,0,date('m')-1,1,date("Y")))?>'/>
<label>為止</label>
<input class='span2' id='date_end' name='end' type='text' value='<?php echo date('Y-m-d',mktime(0,0,0,date('m'),0,date('Y')))?>'/>
<input class='btn btn-primary' name='query' type='submit' value='查詢' />
</form>
</div>
	<div class="span8">
		<table class="table table-striped">
		<tr><td></td><td>Bency</td><td>Karen</td></tr>
	<?php	foreach($record as $key => $value){ ?>
<tr> <td><?php echo $key?></td><td><?php echo $value['bency']?></td><td><?php echo $value['karen']?></td></tr>
<?php } ?>
		<tr><td>總和</td><td><?php echo $pay['bency'] ?></td><td><?php echo $pay['karen'] ?></td></tr>
		</table>
	</div>
<div class="span8">
	<table class="table table-striped">
	<tr><td></td><td>林詠軒</td><td>游怡萍</td></tr>
	<tr><td>實付</td><td><?php echo $pay['bency'];?></td><td><?php echo $pay['karen']?></td></tr>
	<tr><td>悠遊卡</td><td><?php echo $yoyo['bency'];?></td><td><?php echo $yoyo['karen']?></td></tr>
	<tr><td>信用卡</td><td><?php echo $credit['bency'];?></td><td><?php echo $credit['karen']?></td></tr>
	<tr><td>額外</td><td><?php echo $su_pay['bency'];?></td><td><?php echo $su_pay['karen']?></td></tr>
	</table>
</div>
<table class="table table-striped">
<?php echo $result ?>
</table>
