# Docker Logs

Ce projet met en place une plateforme de centralisation et de visualisation de logs basée sur **Rsyslog**, **MariaDB** et **LogAnalyzer**, le tout conteneurisé avec Docker.

## Fonctionnalités

- **Serveur Syslog** : Un conteneur `rsyslog` prêt à recevoir des logs via UDP sur le port 514.
- **Stockage en Base de Données** : Les logs sont stockés dans une base de données MariaDB (`syslog`).
- **Interface Web** : Une interface LogAnalyzer pour visualiser, filtrer et analyser les logs collectés.
- **Déploiement Facile** : Le tout est orchestré via un simple fichier `docker compose.yml`.

-----

## Architecture

Le projet est composé de trois services principaux orchestrés par `docker compose` :

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

L'interface de LogAnalyzer vous permet de visualiser et d'analyser les logs collectés. Elle est accessible via le navigateur à l'adresse **[http://localhost:8080](http://localhost:8080)**.

Connectez-vous avec les identifiants par défaut :

- **Utilisateur**: `admin`
- **Mot de passe**: `netlab123`

### 3. Envoyer des logs

Pour tester, vous pouvez envoyer un message de log au serveur `rsyslog` depuis votre machine hôte (si `logger` est installé) :

```bash
logger -n localhost -P 514 -d "Ceci est un test depuis ma machine" --priority user.info --tag test-local
```

Les valeurs de priorité (_priority_) peuvent être ajustées selon vos besoins. Voici quelques exemples :

- `user.info` : Pour les logs informatifs.
- `user.warning` : Pour les avertissements.
- `user.error` : Pour les erreurs.

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
