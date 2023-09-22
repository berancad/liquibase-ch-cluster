--liquibase formatted sql
--changeset andrei.b:create-table-test3 labels:crossweb2 context:DEV,PROD
--comment some comment
CREATE TABLE Test3 ON CLUSTER 'cluster_1S_2R' (
    Id int,
    Field1 varchar(255)
) ENGINE = ReplicatedMergeTree()
ORDER BY Id;
--rollback drop table Test3 ON CLUSTER 'cluster_1S_2R'