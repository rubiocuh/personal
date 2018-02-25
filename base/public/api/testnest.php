<?php

include('../connect/base.php');

 class member{
	protected $type;
	protected $pwd;
	
	public function __construct($user, $type, $pwd)
	{
		$this->user = $user;
		$this->type = $type;
		$this->pwd = $pwd;
	}

	public function getUser($user){
		return $this->user;
	}

	public function addNewUser($user, $type){

		$stmt = $myPDO->prepare("CALL bd.addNewUser($login, $type)");
		$stmnt->execute();
		$result = $stmnt->fetchAll(\PDO::FETCH_ASSOC);
		return $result;
	}
	 public function regNewUser($user, $pwd){

		$stmt = $myPDO->prepare("CALL bd.regNewUser($login, $pwd)");
		$stmnt->execute();
		$result = $stmnt->fetchAll(\PDO::FETCH_ASSOC);
		return $result;
	}
	public function addAddress(){

		$stmt = $myPDO->prepare("CALL bd.addNewUser()");
		$stmnt->execute();
		$result = $stmnt->fetchAll(\PDO::FETCH_ASSOC);
		return $result;
	}
	public function editAcctInfo(){

		$stmt = $myPDO->prepare("CALL bd.addNewUser()");
		$stmnt->execute();
		$result = $stmnt->fetchAll(\PDO::FETCH_ASSOC);
		return $result;

	}

}

?>