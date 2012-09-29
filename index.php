<?php
include('connect.php');
include_once('includes/function.inc');
require_once('includes/content.inc');
require_once('includes/index.inc');
$cur_date = date("Y-m-d");
?>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><?php echo $head_title?> - 小萍與阿軒的記帳本</title>
    <link rel="stylesheet" type="text/css" href="/includes/jquery.autocomplete.css">
</head>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
    <script type="text/javascript" src="/includes/jquery.autocomplete.js"></script>
    <script type="text/javascript">

$(function() {
    $("#mod_item").autocomplete({
        url: '/includes/item_search.php',
        useCache: false,
        filterResults: false
    });
    $("#mod_type").autocomplete({
        url: '/includes/type_search.php',
        useCache: false,
        filterResults: false
    });
    $("#item_name").autocomplete({
        url: '/includes/item_search.php',
        useCache: false,
        filterResults: false
    });
    $("#type_name").autocomplete({
        url: '/includes/type_search.php',
        useCache: false,
        filterResults: false
    });
});
    </script>
<!-- 日曆選單-->                                                                                                                                               
<link rel="stylesheet" href="/includes/jquery.datepick.css" type="text/css" />
<link rel="stylesheet" href="/bootstrap/css/bootstrap.css" type="text/css" />
<link rel="stylesheet" href="/bootstrap/css/bootstrap-responsive.css" type="text/css" />
<script type="text/javascript" src="/includes/jquery.datepick.js"></script>
<script type="text/javascript" src="/includes/jquery.datepick-zh-TW.js"></script>
<script type="text/javascript">
$(function() {
	$('#cdate').datepick($.extend({
		showTrigger: '#calImg',
		altField: '#l10nAlternate2', altFormat: ' yyyy年MM d日 DD'},
		$.datepick.regional['zh-TW']));
	$('#date_start').datepick($.extend({
		showTrigger: '#calImg',
		altField: '#l10nAlternate2', altFormat: ' yyyy年MM d日 DD'},
		$.datepick.regional['zh-TW']));
	$('#date_end').datepick($.extend({
		showTrigger: '#calImg',
		altField: '#l10nAlternate2', altFormat: ' yyyy年MM d日 DD'},
		$.datepick.regional['zh-TW']));
	$('#l10nLanguage').change(function() {
		var language = $(this).val();
		$.localise('/includes/jquery.datepick', language);
		$('#l10nPicker').datepick('option', $.datepick.regional[language]);
		$.datepick.setDefaults($.datepick.regional['']); 
	});

	$('#mod_date').datepick($.extend({
		showTrigger: '#calImg',
		altField: '#l10nAlternate2', altFormat: ' yyyy年MM d日 DD'},
		$.datepick.regional['zh-TW']));
	$('#l10nLanguage').change(function() {
		var language = $(this).val();
		$.localise('/includes/jquery.datepick', language);
		$('#l10nPicker').datepick('option', $.datepick.regional[language]);
		$.datepick.setDefaults($.datepick.regional['']); 
	});
});
function showDate(date) {
    alert('The date chosen is ' + date);
}
</script>
<!-- 日曆選單-->   

<body>
<div class="main-content">
	<?php if($agent == "regular" || $_GET['id'] == 0){?>
	<div class="navbar navbar-fixed-top">
		<div class="navbar-inner">
			<?php if($agent == "regular"){?>
			<div class='container'>
			<?php }?>
				<a href="/" class="brand">首頁</a>
				<ul class="nav nav-pills">
					<li <?php if($_GET['id'] == 2) echo "class =\"active\""; ?>><a href="/daily">當日記錄</a></li>
					<li <?php if($_GET['id'] == 5) echo "class =\"active\""; ?>><a href="/overview">記錄總覽</a></li>
					<li <?php if($_GET['id'] == 10) echo "class =\"active\""; ?>><a href="/find-me">尋找班西</a></li>
				</ul>
			<?php if($agent == "regular"){?>
				<form class="pull-right navbar-form" method="post" action="/login?from=<?php echo $_SERVER['REQUEST_URI']?>">
				<?php if(!$login){ ?>
					<input type="text" name="username" class="input-small" placeholder="Email">
					<input type="password" name="password" class="input-small" placeholder="Password">
					<button type="submit" name="login" class="btn">登入</button>
					<a type="submit" name="logout" href="/register" class="btn btn-info">註冊</a>
				<?php }else{?>
					<button type="submit" name="logout" class="btn">登出</button>
				<?php }?>
				</form>
			<?php }?>
			<?php if($agent == "regular"){?>
			</div>
			<?php }?>
		</div>
	</div>
	<?php }?>
	<?php include($module); ?>
</div>
<hr/>
			<?php if($agent == "regular"){?>
<div class="container">
<footer><?php echo Get_Client_Ip();?><p><?php echo $_SERVER["REQUEST_URI"]?></p></footer>
</div>
			<?php }?>
<script src="/bootstrap/js/bootstrap.js"></script>
</body>
</html>
