SELECT * FROM synthea.yiyiW_providerUlti1;
###Create trigger
delimiter $$

CREATE TRIGGER DistrictEvaluation BEFORE INSERT ON yiyiW_providerUlti1
FOR EACH ROW
BEGIN
	IF NEW.ulitization >= 100 THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Conguraluation your district have a high provider utilization';
	END IF;
END; $$
delimiter ;

##Function
DELIMITER $$
CREATE FUNCTION ProUtil(cost DECIMAL(10,2))
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
DECLARE ProUtil VARCHAR(20);
IF cost > 100 THEN
SET ProUtil = ‘low’;

ELSEIF cost <= 100 THEN
SET ProUtil = 'high';
END IF;

RETURN (ProUtil);
END$$
DELIMITER ;