<?php
require_once('includes/daily.inc');
?>
<div class="container-fluid">
	<div class="span3">
	<form class="well form-horizontal" method="post" action="#">
		<fieldset>
		<legend>今日開銷</legend>
			<label for="input01">日期</label>
				<input class="input-medium" type="text" id="cdate" name="buy_date" value="<?php echo $cur_date?>"/>
				<?php if(isset($error_buydate)){?>
				<p class="help-block"><?php echo $error_buydate?></p>
				<?php } ?>
			<label >消費類型</label>
				<input class="input-medium" type="text" name="type" id='type_name'/>
				<?php if(isset($error_type)){?>
				<p class="help-block"><?php echo $error_buydate?></p>
				<?php } ?>
			<label >品名</label>
				<input class="input-medium" type="text" name="name" id='item_name'/>
				<?php if(isset($error_name)){?>
				<p class="help-block"><?php echo $error_buydate?></p>
				<?php } ?>
				<div class="input-prepend">
				<span class="add-on">$</span>
				<input class="input-small" name="cost" placeholder="金額"/>
				<?php if(isset($error_cost)){?>
				<p class="help-block"><?php echo $error_buydate?></p>
				<?php } ?>
				</div>
		<label >購買人</label>
				<select class="span2" name="buyer" >
					<option value="bency" selected>林詠軒</option>
					<option value="karen">游怡萍</option>
				</select>
				<?php if(isset($error_buyer)){?>
				<p class="help-block"><?php echo $error_buydate?></p>
				<?php } ?>
		<label >所有人</label>
			<select class="span2" name="owner">
				<option value="bency" selected>林詠軒</option>
				<option value="karen">游怡萍</option>
				<option value="shared">共同</option>
			</select>
				<?php if(isset($error_owner)){?>
				<p class="help-block"><?php echo $error_buydate?></p>
				<?php } ?>
		<label >付款方式</label>
			<select class="span2" id="wtp" name="way_to_pay[]" onchange="new_other()">
				<?php echo $WTP_option ?>
			</select>
			<input class="input-medium" type="hidden" name="way_to_pay[]" id="other"/>
				<?php if(isset($error_wtp)){?>
				<p class="help-block"><?php echo $error_buydate?></p>
				<?php } ?>
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
		<tr><td></td><td>林詠軒</td><td>游怡萍</td></tr>
		<tr><td>實付</td><td><?php echo $pay['bency']['現金'];?></td><td><?php echo $pay['karen']?></td></tr>
		<tr><td>悠遊卡</td><td><?php echo $yoyo['bency'];?></td><td><?php echo $yoyo['karen']?></td></tr>
		<tr><td>信用卡</td><td><?php echo $credit['bency'];?></td><td><?php echo $credit['karen']?></td></tr>
		<tr><td>額外</td><td><?php echo $su_pay['bency'];?></td><td><?php echo $su_pay['karen']?></td></tr>
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
	function submit(id){
		var form=document.getElementById("modify");
		form.submit;
	}
	</script>
</div>
