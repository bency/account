<?php require_once('includes/overview.inc');?>
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
