### 1. Configuration de LogAnalyzer

Lors du premier accès à LogAnalyzer, il se peut qu'une étape d'installation soit requise.

1. Accédez à l'interface via **[http://localhost:8080](https://www.google.com/search?q=http://localhost:8080)**.
2. Si l'installeur se lance, suivez les étapes. Les informations de connexion à la base de données `loganalyzer` sont disponibles dans le fichier `docker compose.yml` :
      - **Host**: `db`
      - **Database**: `loganalyzer`
      - **User**: `user`
      - **Password**: `syslogpass`
3. Une fois l'installation terminée, connectez-vous avec les identifiants par défaut :
      - **Utilisateur**: `admin`
      - **Mot de passe**: `netlab123`

### 2. Configuration de la source de logs

Pour que LogAnalyzer affiche les logs, vous devez configurer une source de données.

1. Dans l'interface de LogAnalyzer, allez dans la section d'administration pour ajouter une nouvelle source.
2. Remplissez les champs comme suit (ou selon vos préférences) :
      - **Name of the Source**: `Syslog via rsyslog`
      - **Source Type**: `MYSQL Native`
      - **Table Type**: `MonitorWare`
      - **Database Host**: `db`
      - **Database Name**: `syslog`
      - **Database Tablename**: `systemevents`
      - **Database User**: `user`
      - **Database Password**: `syslogpass`
