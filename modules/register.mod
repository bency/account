<?php require_once('includes/register.inc');
if(!$registered){
?>
<form class="form-horizontal register-form-center" action="#" method="post">
	<div class="control-group">
		<label class="control-label" for="inputEmail">姓名</label>
		<div class="controls">
			<input type="text" name="name" required placeholder="姓名" value="<?php echo $_POST['name']?>">
			<span class="help-block"><?php echo $error_name?></span>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label" for="inputEmail">膩稱</label>
		<div class="controls">
			<input type="text" name="nick_name" required placeholder="ID" value="<?php echo $_POST['nick_name']?>">
			<span class="help-block"><?php echo $error_nick ?></span>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label" for="inputEmail">信箱</label>
		<div class="controls">
			<input type="email" name="email" required placeholder="Email" value="<?php echo $_POST['email']?>">
			<span class="help-block"><?php echo $error_email?></span>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label" for="inputPassword">密碼</label>
		<div class="controls">
			<input type="password" name="pwd" required placeholder="Password">
			<span class="help-block"><?php echo $error_pwd?></span>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label" for="cfn_pwd">確認密碼</label>
		<div class="controls">
			<input type="password" name="cfn_pwd" required placeholder="Repeat Password">
			<span class="help-block"><?php echo $error_cfn?></span>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label" for="sex">性別</label>
		<div class="controls">
			<label class="radio inline">
				<input type="radio" required name="sex" value="男" <?php if($_POST['sex'] == "男") echo "checked"?>> 男
			</label>
			<label class="radio inline">
				<input type="radio" required name="sex" value="女" <?php if($_POST['sex'] == "女") echo "checked"?>> 女
			</label>
			<span class="help-block"><?php echo $error_sex?></span>
		</div>
	</div>
	<div class="control-group">
		<div class="controls">
		<button type="submit" class="btn btn-primary" name="register">註冊</button>
		</div>
	</div>
</form>
<?php }
else{
?>
<div class="hero-unit">
<h1>註冊成功啦！！！！</h1>
</div>
<?php
var_dump($_POST);
}
