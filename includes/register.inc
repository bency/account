<?php
require_once('includes/function.inc');
if(isset($_POST['register'])){
	$registered = false;
	$error = false;
	if(!preg_match("/^[\x{4e00}-\x{9fa5}]+$/u",$_POST['name'])){
		$error_name = "姓名請用中文";
		$error = true;
	}
	if(preg_match("/[!@#$%^&*()_+\[\]\{\}\\\/\.\,\~\`]/",$_POST['nick_name'])){
		$error_nick = "請不要包含任何符號";
		$error = true;
	}
	if($_POST['pwd']  != $_POST['cfn_pwd']){
		$error_pwd = "密碼兩次都不一樣喔";
		$error = true;
	}
	if(!preg_match("/^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*$/",$_POST['email'])){
		$error_email = "信箱格式不正確會收不到認證信喔";
		$error = true;
	}
	if($_POST['sex'] != "男" && $_POST['sex'] != "女"){
		echo $_POST['sex'];
		$error_sex = "性別沒選喔";
		$error = true;
	}
	if(!$error){
		$query_username = "select id from login_table where email='".$_POST['email']."'";
		$result = mysql_query($query_username);
		if(mysql_num_rows($result) == 0){
			$query_login = "insert into login_table(nick_name,email,password,ip) values('".$_POST['nick_name']."','".$_POST['email']."','".sha1($_POST['pwd'])."','".Get_Client_Ip()."')";
			$query_member = "insert into member(name,nick_name,email,sex) values('".$_POST['name']."','".$_POST['nick_name']."','".$_POST['email']."','".$_POST['sex']."')";
			if(mysql_query($query_login)){
				if(mysql_query($query_member)){
					$registered = true;
				}
				else{
					echo "member table error";
				}
			}
			else{
				echo "login table error";
			}
		}
		else
			$error_email = "這個信箱已經註冊過了";

	}
}
