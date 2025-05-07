-- ./db/init_syslog.sql
CREATE TABLE IF NOT EXISTS SystemEvents (
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
