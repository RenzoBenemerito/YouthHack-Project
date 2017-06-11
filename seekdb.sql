use seekdb;

DELIMITER //
CREATE PROCEDURE usp_registerSpeaker (
	IN fname VARCHAR(45),
    IN lname VARCHAR(45),
    IN age INT,
    IN jobtitle VARCHAR(45),
    IN contact VARCHAR(45),
    IN email VARCHAR(45),
    IN username VARCHAR(45),
    IN pass VARCHAR(45)
)
BEGIN
	INSERT INTO user_account(user_username,user_password) VALUES (username,pass);
	SET id = (SELECT user_id FROM user_account WHERE user_username=username);
    INSERT INTO user_speakers(user_id,first_name,last_name,age,jobtitle,email,contact)
    VALUES (id,fname,lname,age,jobtitle,contact,email);
	
	
END //
<<<<<<< HEAD
DELIMITER ;

DELIMITER //
CREATE PROCEDURE usp_registerOrg (
	IN orgname VARCHAR(45),
    IN contact VARCHAR(45),
    IN representative VARCHAR(45),
    IN email VARCHAR(45),
    IN username VARCHAR(45),
    IN pass VARCHAR(45)
)
BEGIN
	DECLARE id INT;
	INSERT INTO user_account(user_username,user_password) VALUES (username,pass);
	SET id = (SELECT user_id FROM user_account WHERE user_username=username);
    INSERT INTO user_organizations(user_account_user_id,organization_name,contact_number,representative,email)
    VALUES (id,orgname,contact,representative,email);
	
	
END //
DELIMITER ;

# DROP PROCEDURE usp_registerOrg;
=======
DELIMITER ;
>>>>>>> f91a6bcda4c5a29558a97c4547e3bf6b5f323155
