# Docker Logs

Ce projet met en place une plateforme de centralisation et de visualisation de logs basée sur **Rsyslog**, **MariaDB** et **LogAnalyzer**, le tout conteneurisé avec Docker.

## Fonctionnalités

- **Serveur Syslog** : Un conteneur `rsyslog` prêt à recevoir des logs via UDP sur le port 514.
- **Stockage en Base de Données** : Les logs sont stockés dans une base de données MariaDB (`syslog`).
- **Interface Web** : Une interface LogAnalyzer pour visualiser, filtrer et analyser les logs collectés.
- **Déploiement Facile** : Le tout est orchestré via un simple fichier `docker-compose.yml`.

-----

## Architecture

Le projet est composé de trois services principaux orchestrés par `docker-compose` :

1. **`db`** : Le service de base de données **MariaDB**. Il héberge deux bases :
      - `syslog` : Pour stocker les logs envoyés par `rsyslog`.
      - `loganalyzer` : Pour la configuration de l'interface LogAnalyzer.
2. **`rsyslog`** : Le serveur syslog qui écoute les logs entrants sur le port `514/udp` et les écrit dans la base de données `syslog`.
3. **`loganalyzer`** : Le service web qui fournit l'interface de visualisation. Il se connecte aux deux bases de données pour fonctionner.

-----

## Installation

### Prérequis

- [Docker](https://www.docker.com/) et [Docker Compose](https://docs.docker.com/compose/) installés sur votre machine.

### Étapes

1. Clonez ce dépôt :

    ```bash
    git clone https://github.com/manastria/docker_logs.git
    cd docker_logs
    ```

2. Construisez et lancez les conteneurs :

    ```bash
    docker compose up -d --build
    ```

-----

## Utilisation

### 1. Configuration de LogAnalyzer

Lors du premier accès à LogAnalyzer, il se peut qu'une étape d'installation soit requise.

1. Accédez à l'interface via **[http://localhost:8080](https://www.google.com/search?q=http://localhost:8080)**.
2. Si l'installeur se lance, suivez les étapes. Les informations de connexion à la base de données `loganalyzer` sont disponibles dans le fichier `docker-compose.yml` :
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

### 3. Envoyer des logs

Pour tester, vous pouvez envoyer un message de log au serveur `rsyslog` depuis votre machine hôte (si `logger` est installé) :

```bash
logger -n localhost -P 514 -d "Ceci est un test depuis ma machine" --priority user.info --tag test-local
```

Vous pouvez également utiliser la commande suivante pour envoyer des logs de test numérotés, utile pour le débogage :

```bash
i=$(test -f /tmp/syslog_counter && awk '{print $1+1}' /tmp/syslog_counter || echo 1); echo "$i" > /tmp/syslog_counter; MSG="TEST $i $(date +'%F %T') from $(hostname)"; echo "$MSG"; logger -n localhost -P 514 -d "$MSG" --priority user.info --tag test-log
```

Les logs devraient apparaître dans l'interface de LogAnalyzer quasi instantanément.

-----

## Configuration Avancée

- **Persistance des données** : Les données de la base MariaDB sont stockées dans un volume Docker nommé `db_data` pour garantir leur persistance.
- **Configuration `rsyslog`** : Le fichier `rsyslog/rsyslog.conf` définit comment les logs sont reçus et transférés à la base de données.
- **Configuration `LogAnalyzer`** : Le fichier de configuration principal est `loganalyzer/data/config.php`. Il est initialisé au premier lancement.

-----

## Nettoyage

Pour arrêter les conteneurs et supprimer les volumes (y compris les données des logs), utilisez :

```bash
docker compose down -v
```

-----

## Licence

Ce projet est sous licence MIT. Voir le fichier [LICENSE](LICENSE) pour plus de détails.
