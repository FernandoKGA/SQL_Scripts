-- https://stackoverflow.com/questions/190776/how-to-have-dynamic-sql-in-mysql-stored-procedure
-- https://dba.stackexchange.com/questions/99298/how-do-i-perform-a-query-on-a-dynamic-list-of-tables
-- https://stackoverflow.com/questions/8393550/mysql-drop-tables-with-wildcard-using-only-sql-statement
-- https://www.w3schools.com/sql/func_mysql_replace.asp
-- https://stackoverflow.com/questions/1524858/create-table-variable-in-mysql

DROP PROCEDURE IF EXISTS deleting_empty_tables;
DELIMITER ;;

CREATE PROCEDURE deleting_empty_tables(IN db_name varchar(255))

BEGIN

DECLARE n INT DEFAULT 0;
DECLARE i INT DEFAULT 1;

DROP TABLE IF EXISTS empty_tables;

CREATE TEMPORARY TABLE empty_tables(
	table_name varchar(255)
);

INSERT INTO empty_tables 
	SELECT t.table_name 
    FROM INFORMATION_SCHEMA.TABLES t 
    WHERE t.table_schema = db_name AND t.table_rows = 0;

SELECT COUNT(*) FROM empty_tables INTO n;

WHILE i<=n DO 
  SET @table_name = (SELECT et.table_name FROM empty_tables et LIMIT 1);
  SET @qr = (SELECT 'DROP TABLE db.tb');
  SET @qr = REPLACE(@qr,'db',db_name);
  SET @qr = REPLACE(@qr,'tb',@table_name);
  PREPARE statement FROM @qr;
  EXECUTE statement;
  DEALLOCATE PREPARE statement;
  DELETE FROM empty_tables WHERE table_name = @table_name;
END WHILE;

DROP TABLE empty_tables;

END;;

DELIMITER ;