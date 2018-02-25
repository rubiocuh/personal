CREATE PROCEDURE ec.sp_distributor(
argLoginId VARCHAR(128),
argPageId VARCHAR(128),
argPageType VARCHAR(32),
argMode VARCHAR(32),
argFieldId VARCHAR(64),
argFieldValue VARCHAR(2000))
BEGIN

	DECLARE l_login_id VARCHAR(128);
	DECLARE l_user_seq INT;
	DECLARE l_user_type VARCHAR(10);
	
	SELECT a.user_seq, a.login_id, b.user_type
	  INTO l_user_seq, l_login_id, l_user_type
	  FROM ec.USER a, ec.user_attr b
	 WHERE a.login_id = argLoginId
	   AND a.user_seq = b.user_seq
	   AND b.attr_type = 'user_type';

	IF argPageType = 'CATEGORY' THEN
		
		CALL ec.sp_category_handler(l_user_seq, l_login_id, l_user_type, argPageId, argMode, argFieldId, argFieldValue);
	
	ELSEIF argPageType = 'FORM' THEN

		CALL ec.sp_form_handler(l_user_seq, l_login_id, l_user_type, argPageId, argMode, argFieldId, argFieldValue);
	
	ELSEIF argPageType = 'LIST' THEN

		CALL ec.sp_list_handler(l_user_seq, l_login_id, l_user_type, argPageId, argMode, argFieldId, argFieldValue);

	ELSEIF argPageType = 'GRID' THEN

		CALL ec.sp_grid_handler(l_user_seq, l_login_id, l_user_type, argPageId, argMode, argFieldId, argFieldValue);

	END IF;
	
END
