-- ./db/init_loganalyzer.sql
  CREATE DATABASE IF NOT EXISTS loganalyzer;
  GRANT ALL PRIVILEGES ON loganalyzer.* TO 'user'@'%';
  -- Ajoutez ici les tables nécessaires pour LogAnalyzer si besoin
