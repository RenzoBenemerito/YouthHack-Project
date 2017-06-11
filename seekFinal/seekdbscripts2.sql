use seekdb;

# DROP PROCEDURE usp_registerSpeaker;

DELIMITER //
CREATE PROCEDURE usp_registerSpeaker (
	IN fname VARCHAR(45),
    IN lname VARCHAR(45),
    IN username VARCHAR(45),
    IN pass VARCHAR(45),
    IN email VARCHAR(45),
    IN age VARCHAR(45),
    IN contact VARCHAR(45),
    IN jobtitle VARCHAR(45),
    IN category INT
)
BEGIN
	DECLARE id int;
	INSERT INTO user_account(username,password) VALUES 
    (username,pass);
    SET id=(SELECT user_id FROM user_account WHERE 
    user_username=username);
    INSERT INTO user_speakers 
    VALUES (id,fname,lname,age,jobtitle,contact,email,category);

END //
DELIMITER ;
