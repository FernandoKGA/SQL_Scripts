DROP PROCEDURE REPAIR_ALL;

DELIMITER $$
CREATE PROCEDURE REPAIR_ALL()
BEGIN
    
    DECLARE i int DEFAULT 1;
    DECLARE maximum int DEFAULT 0;
    DECLARE temp_name varchar(64) DEFAULT NULL;
    CREATE TEMPORARY TABLE Temp SELECT @n := @n + 1 n,a.table_name FROM information_schema.tables a , (SELECT @n := 0) m WHERE a.table_schema = 'Resimapinv';
    SET maximum = (SELECT COUNT(*) FROM Temp);
    WHILE i <= maximum DO
        SET temp_name = (SELECT Temp.table_name FROM Temp WHERE n = i);
        SET @sql_query = CONCAT('REPAIR TABLE ', temp_name ,' EXTENDED');
        SELECT @sql_query;
        PREPARE stmt FROM @sql_query;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;
        SET i = i + 1;
    END WHILE;
    DROP TABLE Temp;

END $$
DELIMITER ;

/* PREPARED STATEMENT NAO SUPORTADO PELA API DO MYSQL */
SET @sql_query = (CONCAT('CHECK TABLE ', table_name ) from information_schema.tables where table_schema = 'Resimapinv');
        SELECT @sql_query;
        PREPARE stmt FROM @sql_query;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;


/* 
   NAO SE PODE PARAMETRIZAR O NOME DE UMA TABELA VIA SQL NORMAL
   DEVE SE UTILIZAR O SQL DINAMICO PARA TAL FEITO!
*/

/* FUNCAO QUE REPARA A TABELA DO BANCO DE DADOS */
REPAIR TABLE table;
REPAIR TABLE table QUICK;
REPAIR TABLE table EXTENDED;

/* CRIACAO DE TABLE TEMPORARIA */
CREATE TEMPORARY TABLE Temp SELECT * FROM a.table;

/* QUERY PARA A BUSCA DE DENTRO DA TABELA QUE
VOCE VAI RESTAURAR */
SELECT COUNT(*) FROM information_schema.tables a 
WHERE a.table_schema = 'Resimapinv';

/* QUERY PARA A BUSCA DE DENTRO DA INFORMATION_SCHEMA */
SELECT COUNT(*) FROM tables a
WHERE a.table_schema = 'Resimapinv';

/* QUERY PARA COLOCAR UM IDENTIFICADOR EM CADA NOME DE TABELA AUTOMATICO*/
SELECT @n := @n + 1 n,a.table_name FROM information_schema.tables a ,
(SELECT @n := 0) m WHERE a.table_schema = 'Resimapinv';