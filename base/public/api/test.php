<?php

	include('/testnest.php');
	set_include_path('/opt/lampp/lib/php');

	$user = "phillip";
	$type = "vendor";
	$pwd = "k3w1k1d5";
	$phill = new member($user, $type, $pwd);
	$result = $phill->getUser;
	echo $result;