<?php
$location = "www.jccf.com.tw";
$user = "db_account";
$passwd = "ddyoinejjmj";
$link = mysql_connect($location,$user,$passwd);
if(!$link){
	$location = "localhost";
	$link = mysql_connect($location,$user,$passwd);
	if(!$link){
		die('連線失敗'.mysql_error());
	}
}
mysql_select_db("db_account");
mysql_query("set names 'utf8'");
