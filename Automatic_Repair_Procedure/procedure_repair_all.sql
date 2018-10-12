/* DELETES THE PROCEDURE IF IT ALREADY EXISTS */
DROP PROCEDURE REPAIR_ALL;

/* CREATES THE PROCEDURE WITHIN THE DATABASE YOU WANT TO REPAIR */
DELIMITER $$
CREATE PROCEDURE REPAIR_ALL()
BEGIN
    
    /* DROP TEMPORARY TABLE DEFINED AS TEMP TO PREVENT ERRORS */
    DROP TABLE Temp;

    /* DECLARATION OF VARIABLES */
    DECLARE i int DEFAULT 1;
    DECLARE maximum int DEFAULT 0;

    /* temp_name MUST BE VARCHAR(64) TO MATCH information_schame.tables.table_name */
    DECLARE temp_name varchar(64) DEFAULT NULL;

    /* CREATES TEMPORARY TABLE TO GET THE TABLE NAMES */
    CREATE TEMPORARY TABLE Temp SELECT @n := @n + 1 n,a.table_name FROM information_schema.tables a , (SELECT @n := 0) m WHERE a.table_schema = 'mydatabase';
    SET maximum = (SELECT COUNT(*) FROM Temp);

    WHILE i <= maximum DO

        /* GET EACH TABLE NAME IN ORDER */
        SET temp_name = (SELECT Temp.table_name FROM Temp WHERE n = i);
        
        /* USE OF DYNAMIC SQL TO REPAIR THE TABLES */
        SET @sql_query = CONCAT('REPAIR TABLE ', temp_name ,' EXTENDED');
        PREPARE stmt FROM @sql_query;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;
        SET i = i + 1;

    END WHILE;
    
    /* AFTER FINISH, DROP TEMPORARY TABLE */
    DROP TABLE Temp;

END $$
DELIMITER ;
/* END OF SCRIPT */

/* 
    REMOVE THE PROCEDURE ONCE IT WON'T BE USED ANYMORE
    IF ANY ERRORS HAVE OCCURRED THAT WITHIN THE EXECUTION,
    CHECK THEM AND TRY TO RUN AGAIN.
*/
DROP PROCEDURE REPAIR_ALL;

/* CHECK TABLE PREPARED STATEMENT NOT SUPPORTED BY MYSQL YET */
SET @sql_query = (CONCAT('CHECK TABLE ', table_name ) from information_schema.tables where table_schema = 'mydatabase');
        SELECT @sql_query;
        PREPARE stmt FROM @sql_query;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;

/* 
   YOU CANNOT PARAMETRIZE THE NAME OF A TABLE IN SQL
   YOU SHOULD USE DYNAMIC SQL
*/
SET temp_name = (SELECT Temp.table_name FROM Temp WHERE n = i);
SET @sql_query = CONCAT('REPAIR TABLE ', temp_name ,' EXTENDED');
SELECT @sql_query;
PREPARE stmt FROM @sql_query;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

/* FUNCTIONS THAT REPAIR TABLES IN MYSQL - CHECK DOCUMENTATION */
REPAIR TABLE table;
REPAIR TABLE table QUICK;
REPAIR TABLE table EXTENDED;
REPAIR TABLE table USE_FRM;

/* CREATION OF TEMPORARY TABLE */
CREATE TEMPORARY TABLE Temp SELECT * FROM a.table;

/* QUERY FOR SEARCH INSIDE THE DATABASE YOU WANT TO RESTORE */
SELECT COUNT(*) FROM information_schema.tables a 
WHERE a.table_schema = 'mydatabase';

/* QUERY FOR SEARCH IN INFORMATION_SCHEMA */
SELECT COUNT(*) FROM tables a
WHERE a.table_schema = 'mydatabase';

/* QUERY FOR INSERTING AN IDENTIFIER FOR EACH TABLE NAME OF DATABASE*/
SELECT @n := @n + 1 n,a.table_name FROM information_schema.tables a ,
(SELECT @n := 0) m WHERE a.table_schema = 'mydatabase';

/* REFERENCES */
/*
https://stackoverflow.com/questions/37313983/how-to-loop-through-all-the-tables-on-a-database-to-update-columns

https://stackoverflow.com/questions/3974683/how-to-set-variable-from-a-sql-query

https://dev.mysql.com/doc/refman/8.0/en/while.html

https://dev.mysql.com/doc/refman/8.0/en/repair-table.html

https://www.w3schools.com/sql/sql_select_into.asp

https://stackoverflow.com/questions/16555454/how-to-generate-auto-increment-field-in-select-query

https://stackoverflow.com/questions/11491240/how-to-create-temp-table-with-select-into-temptable-from-cte-query

http://www.mysqltutorial.org/mysql-temporary-table/

https://dev.mysql.com/doc/refman/8.0/en/create-temporary-table.html

https://dev.mysql.com/doc/refman/8.0/en/declare-local-variable.html

https://stackoverflow.com/questions/26981901/mysql-insert-with-while-loop/26983030

https://dev.mysql.com/doc/refman/8.0/en/create-procedure.html

https://stackoverflow.com/questions/25124034/passing-a-table-name-as-a-parameter

https://www.sqlservercentral.com/Forums/485395/pass-table-name-as-a-parameter-in-stored-procedure

https://stackoverflow.com/questions/2754423/use-a-variable-for-table-name-in-mysql-sproc

https://dev.mysql.com/doc/refman/8.0/en/sql-syntax-prepared-statements.html

https://dev.mysql.com/doc/refman/8.0/en/prepare.html

https://stackoverflow.com/questions/4582832/repair-all-tables-in-one-go
*/