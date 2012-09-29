<?php
require_once('includes/daily.inc');
?>
	<div class="span3">
	<form id='new_record' class="well form-horizontal" method="post" action="#">
		<fieldset>
		<legend><a class='btn' href='/daily/<?php echo $yesterday?>'><i class='icon-arrow-left'></i></a>今日開銷<a class='btn' href='/daily/<?php echo $tomorrow?>'><i class='icon-arrow-right'></i></a></legend>
			<label for="input01">日期</label>
				<input class="input-medium" type="text" id="cdate" name="buy_date" value="<?php echo $cur_date?>"/>
				<button class='btn btn-mini' type='submit' name='submit'>選這天</button>
				<?php if(isset($error_buydate)){?>
				<span class="label label-important"><?php echo $error_buydate?></span>
				<?php } ?>
			<label >消費類型</label>
				<div class="input-prepend">
				<input class="input-medium" type="text" name="type" id='type_name'/>
				<?php if(isset($error_type)){?>
				<span class="label label-important"><?php echo $error_type?></span>
				<?php } ?>
				</div>
			<label >品名</label>
				<div class="input-prepend">
				<input class="input-medium" type="text" name="name" id='item_name'/>
				<?php if(isset($error_name)){?>
				<span class="label label-important"><?php echo $error_name?></span>
				<?php } ?>
				</div>
				<div class="input-prepend">
				<span class="add-on">$</span>
				<input class="input-small" name="cost" placeholder="金額"/>
				<?php if(isset($error_cost)){?>
				<span class="label label-important"><?php echo $error_cost?></span>
				<?php } ?>
				</div>
		<label >購買人</label>
				<select class="span2" name="buyer" >
					<option value="bency" <?php if($_POST['buyer'] == 'bency') echo 'selected'?>>林詠軒</option>
					<option value="karen" <?php if($_POST['buyer'] == 'karen') echo 'selected'?>>游怡萍</option>
				</select>
		<label >所有人</label>
			<select class="span2" name="owner">
				<option value="bency" <?php if($_POST['owner'] == 'bency') echo 'selected'?>>林詠軒</option>
				<option value="karen" <?php if($_POST['owner'] == 'karen') echo 'selected'?>>游怡萍</option>
				<option value="shared">共同</option>
			</select>
		<label >付款方式</label>
			<select class="span2" id="wtp" name="way_to_pay[]" onchange="new_other()">
				<?php echo $WTP_option ?>
			</select>
			<input class="input-medium" type="hidden" name="way_to_pay[]" id="other"/>
		<button type="submit" name="submit" value="送出" class="btn btn-primary">送出</button>
		</fieldset>
	</form>
	</div>
	<div class="span8">
		<table class="table table-striped">
			<?php echo $result; ?>
		</table>
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
	
	<script type="text/javascript">
	function new_other(){
		var selection=document.getElementById("wtp");
		if(wtp.options[wtp.selectedIndex].value=='new')
			document.getElementById("other").type="text";
		else
			document.getElementById("other").type="hidden";
	}
	</script>
