-- ./db/init_syslog.sql
  CREATE DATABASE IF NOT EXISTS syslog;
  GRANT ALL PRIVILEGES ON syslog.* TO 'user'@'%';
  USE syslog;
  CREATE TABLE IF NOT EXISTS systemevents (
    ID                 INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ReceivedAt         TIMESTAMP NULL,
    DeviceReportedTime TIMESTAMP NULL,
    Facility           SMALLINT,
    Priority           SMALLINT,
    FromHost           VARCHAR(60),
    Message            TEXT,
    InfoUnitID         INT,
    SysLogTag          VARCHAR(60)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
  GRANT ALL PRIVILEGES ON syslog.* TO 'user'@'%';