#!/bin/sh
set -e



# Créer le fichier config.php s'il n'existe pas
if [ ! -f /data/config.php ]; then
    touch /data/config.php
    chown 1000:33 /data/config.php
fi

CMD="$1"

case "$CMD" in
    "" )
        echo "CMD IS NULL!!!"
        ;;
    "start" )
        exec /run_service.sh
        ;;
    * )
        exec "$@"
        ;;
esac
