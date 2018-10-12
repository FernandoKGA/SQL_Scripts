# Automatic Repair Procedure - v0.2

Languages:

* [English](##English)
* [Português](##Português)

## English

**IMPORTANT: I AM NOT RESPONSIBLE FOR ANY DATA OR DATABASE WHICH HAS BEEN INCORRECTLY REPAIRED OR CORRUPTED COMPLETELY!**

This is a simple procedure that I used to repair a large database with hundreds of tables. Doing it manually would be absolutely exhaustive and insane, so keeping that in mind, I've created a procedure that automates this process by taking the name of every table in the especific database that you want to restore and runs the restore command.

Although it's simple it uses the concept of Dynamic SQL so that it is possible to execute queries through the Prepared Statements, because it isn't possible to pass the name of tables through normal queries as parameters to a system function. The CHECK TABLE function is not yet supported by the Prepared Statements in **MySQL Server 8**.

*Any error or wrong information please contact.*

## Português

**IMPORTANTE: NÃO ME RESPONSABILIZO POR QUALQUER DADO OU BANCO DE DADOS QUE FORA REPARADO INCORRETAMENTE OU SE CORROMPEU POR COMPLETO!**

Essa é um procedimento simples que utilizei para reparar um banco de dados grande com centenas de tabelas. Fazê-lo manualmente seria absolutamente exaustivo e insano, então tendo isso em mente, criei um procedimento que automatiza esse processo pegando o nome de cada tabela no banco de dados especificado que você quer restaurar e executa o comando de restauração.

Apesar de ser simples ele utiliza o conceito de SQL Dinâmico para que seja possível executar as consultas através das *Prepared Statements*, pois não é possível passar o nome de tabelas através de consultas normais para uma função do sistema. A função de checar as tabelas (CHECK TABLE) ainda não é suportada pelas *Prepared Statements* no **MySQL Server 8**.

*Qualquer erro ou informação incorreta por favor contatar.*

## References

REPAIR TABLE:

* [Repair all tables in one go - Stack Overflow](https://stackoverflow.com/questions/4582832/repair-all-tables-in-one-go)
* [REPAIR TABLE Syntax- MySQL Documentation](https://dev.mysql.com/doc/refman/8.0/en/repair-table.html)

TEMPORARY TABLE:

* [TEMPORARY TABLE - MySQLTutorial](http://www.mysqltutorial.org/mysql-temporary-table/)
* [CREATE TEMPORARY TABLE Syntax- MySQL Documentation](https://dev.mysql.com/doc/refman/8.0/en/create-temporary-table.html)
* [How to create Temporary Table with SELECT INTO - Stack Overflow](https://stackoverflow.com/questions/11491240/how-to-create-temp-table-with-select-into-temptable-from-cte-query)

VARIABLES:

* [How to set variable from a SQL Query](https://stackoverflow.com/questions/3974683/how-to-set-variable-from-a-sql-query)
* [Local Variable DECLARE Syntax- MySQL Documentation](https://dev.mysql.com/doc/refman/8.0/en/declare-local-variable.html)
* [Use a variable for table name - Stack Overflow](https://stackoverflow.com/questions/2754423/use-a-variable-for-table-name-in-mysql-sproc)

WHILE LOOP:

* [WHILE LOOP Syntax- MySQL Documentation](https://dev.mysql.com/doc/refman/8.0/en/while.html)
* [INSERT with WHILE LOOP - Stack Overflow](https://stackoverflow.com/questions/26981901/mysql-insert-with-while-loop/26983030)
* [SELECT INTO - W3Schools](https://www.w3schools.com/sql/sql_select_into.asp)
* [Looping through all tables on a database - Stack Overflow](https://stackoverflow.com/questions/37313983/how-to-loop-through-all-the-tables-on-a-database-to-update-columns)

AUTO_INCREMENT:

* [How to generate Auto-increment field in SELECT query - Stack Overflow](https://stackoverflow.com/questions/16555454/how-to-generate-auto-increment-field-in-select-query)

PARAMETERS:

* [Passing table names as parameters - Stack Overflow](https://stackoverflow.com/questions/25124034/passing-a-table-name-as-a-parameter)
* [Passing table name as a parameter in stored procedure - SQL SERVER CENTRAL](https://www.sqlservercentral.com/Forums/485395/pass-table-name-as-a-parameter-in-stored-procedure)

PROCEDURE:

* [CREATE PROCEDURE Syntax- MySQL Documentation](https://dev.mysql.com/doc/refman/8.0/en/create-procedure.html)

PREPARED STATEMENTS:

* [Prepared SQL Statement Syntax - MySQL Documentation](https://dev.mysql.com/doc/refman/8.0/en/sql-syntax-prepared-statements.html)
* [PREPARE Syntax - MySQL Documentation](https://dev.mysql.com/doc/refman/8.0/en/prepare.html)