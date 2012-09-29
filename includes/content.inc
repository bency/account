<?php
$id = $_GET['id'];
$ua = $_SERVER['HTTP_USER_AGENT'];
if(preg_match('/.*(iPhone).*/',$ua))
	$agent = "mobile";
else
	$agent = "regular";
if($agent == "regular"){
	switch($id){
		case 1:
			$module = "modules/register.mod";
			$head_title = "會員註冊";
			break;
		case 2:
			$module = "modules/daily.mod";
			$head_title = "每日記帳";
			break;
		case 3:
			$module = "modules/login.mod";
			$head_title = "登入";
			break;
		case 4:
			$module = "modules/verify.mod";
			$head_title = "註冊成功";
			break;
		case 5:
			$module = "modules/overview.mod";
			$head_title = "記錄總覽";
			break;
		case 10:
			$module = "modules/find_me.mod";
			$head_title = "尋找班西";
			break;
		case 99:
			$module = "modules/temp.mod";
			$head_title = "測試頁面";
			break;
		default:
			$module = "modules/index.mod";
			$head_title = "首頁";
			break;
	}
}
else{
	switch($id){
		case 1:
			$module = "modules/register.mod";
			$head_title = "會員註冊";
			break;
		case 2:
			$module = "modules/mobile/daily.mod";
			$head_title = "每日記帳";
			break;
		case 3:
			$module = "modules/login.mod";
			$head_title = "登入";
			break;
		case 4:
			$module = "modules/verify.mod";
			$head_title = "註冊成功";
			break;
		case 5:
			$module = "modules/mobile/overview.mod";
			$head_title = "記錄總覽";
			break;
		case 10:
			$module = "modules/find_me.mod";
			$head_title = "尋找班西";
			break;
		case 99:
			$module = "modules/temp.mod";
			$head_title = "測試頁面";
			break;
		default:
			$module = "modules/index.mod";
			$head_title = "首頁";
			break;
	}
}
