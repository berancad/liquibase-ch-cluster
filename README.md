# liquibase-ch-cluster
Docker-compose for testing liquibase migrations and clickhouse cluster (1 shard with 2 replicas)
### settings
- clickhouse/ch01 - for first replica
- clickhouse/ch02 - for second replica
- liquibase/my_changelog - for liquibase
  - changelog.xml - add load migrations from folder
  - liquibase.properties - connection to clickhouse for liquibase
- liquibase/lib - jar and configuration file from https://github.com/MEDIARITHMICS/liquibase-clickhouse
- migrations - sql scripts for migration
### workflow
For run please `docker-compose up -d` from folder with repository files.

For end please `docker-compose down`

For liquibase command from CLI please use this sample
`docker run --rm -v .\liquibase\my_changelog:/liquibase/my_changelog 
-v .\liquibase\lib\clickhouse.jar:/liquibase/lib/clickhouse.jar 
-v .\liquibase\lib\liquibaseClickhouse.conf:/liquibase/lib/liquibaseClickhouse.conf 
-v .\migrations:/liquibase/scripts --network=liquibase-ch-cluster_default 
liquibase/liquibase 
--defaultsFile=/liquibase/my_changelog/liquibase.properties 
--changeLogFile=/my_changelog/changelog.xml 
--logLevel=debug 
history`
