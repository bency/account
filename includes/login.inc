<?php
if(isset($_POST['login'])){
$username = $_POST['username'];
$login_modify = "select * from login_table where (email='".$username."' or nick_name='".$username."') and password='".substr(sha1($_POST['password']),0,30)."'";
$result = mysql_query($login_modify);
if(mysql_num_rows($result) == 1){
	echo "登入成功";
	$result = mysql_query("select * from member where email='".$username."' or nick_name='".$username."'");
	$res = mysql_fetch_assoc($result);
	setcookie("login",true);
	setcookie("name",$res['name']);
	setcookie("nick_name",$res['nick_name']);
}
else
	echo "失敗";
}
if(isset($_POST['logout'])){
	setcookie("nick_name",null,-1);
	setcookie("name",null,-1);
	setcookie("login",null,-1);
	unset($_COOKIE['name']);
	unset($_COOKIE['nick_name']);
	unset($_COOKIE['login']);
}
?>
