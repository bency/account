<?php require_once('includes/overview.inc');?>
		<div class='span3'>
			<form action='#' method='post'>
			<legend>日期範圍</legend>
			<?php if(isset($_POST['start'])){?>
			<label>起始</label>
			<input class='span2' id='date_start' name='start' type='text' value='<?php echo $_POST['start'] ?>'/>
			<label>為止</label>
			<input class='span2' id='date_end' name='end' type='text' value='<?php echo $_POST['end']?>'/>
			<?php }else{ ?>
			<label>起始</label>
			<input class='span2' id='date_start' name='start' type='text' value='<?php echo date("Y-m-d",mktime(0,0,0,date('m')-1,1,date("Y")))?>'/>
			<label>為止</label>
			<input class='span2' id='date_end' name='end' type='text' value='<?php echo date('Y-m-d',mktime(0,0,0,date('m'),0,date('Y')))?>'/>
			<?php }?>
			<input class='btn btn-primary' name='query' type='submit' value='查詢' />
			</form>
		</div>
		<div class="span3">
			<table class="table table-striped">
			<tr><td></td><td>Bency</td><td>Karen</td></tr>
		<?php	foreach($record as $key => $value){ ?>
		<tr><td><?php echo $key?></td><td><?php echo $value['bency']?></td><td><?php echo $value['karen']?></td></tr>
		<?php } ?>
			<tr><td>總和</td><td><?php echo $pay['bency'] ?></td><td><?php echo $pay['karen'] ?></td></tr>
			<tr><td>額外</td><td><?php echo $su_pay['bency'];?></td><td><?php echo $su_pay['karen']?></td></tr>
			</table>
		</div>
		<div class='span3'>
			<table class="table table-striped">
				<?php echo $result ?>
			</table>
		</div>
