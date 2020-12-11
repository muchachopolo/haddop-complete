/sqoop/sqoop-1.4.7.bin__hadoop-2.6.0/bin/sqoop import --connect "jdbc:sqlserver://mssql-db:1433;database=TestData;username=sa;password=password!1" --table customers
/sqoop/sqoop-1.4.7.bin__hadoop-2.6.0/bin/sqoop import --connect "jdbc:sqlserver://mssql-db:1433;database=metastore;username=sa;password=password!1" --table ROLES
hadoop fs -ls /user/root/