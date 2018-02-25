<?php
	/*include('base.php');
    $result = $myPDO->query("SELECT login_id FROM users;");

    echo print_r($result->fetchall(), true);*/
	#$myPDO = new PDO('mysql:host=127.0.0.1;dbname=bd', 'root', '');

	class dbconn{
		var $conn;

		public function __construct(){
			$this->$conn = new PDO('mysql:host=127.0.0.1;dbname=bd', 'root', '');
		}
	}
?>