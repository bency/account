<?php
$location = "localhost";
$user = "root";
$passwd = "ddyoinejjmj";
$link = mysql_connect($location,$user,$passwd);
if(!$link){
	die('連線失敗'.mysql_error());
}
mysql_select_db("db_account");
mysql_query("set names 'utf8'");
