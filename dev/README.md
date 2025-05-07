You are now about to create the initial LogAnalyzer User Account.
This will be the first administrative user, which will be needed to login into LogAnalyzer and access the Admin Center!

admin/netlab123




```bash
i=$(test -f /tmp/syslog_counter && awk '{print $1+1}' /tmp/syslog_counter || echo 1); echo "$i" > /tmp/syslog_counter; MSG="TEST $i $(date +'%F %T') from $(hostname)"; echo "$MSG"; logger -n 192.168.1.26 -P 514 -d "$MSG" --priority user.info --tag test-log
```




```
docker compose exec db mysqldump -uuser -psyslogpass --no-data loganalyzer > db_structure.sql
```

```
docker compose exec db mysqldump -uuser -psyslogpass loganalyzer > db_dump.sql
docker compose exec db mysqldump -uuser -psyslogpass --databases syslog loganalyzer > db_dump.sql
```

```
$ docker compose exec db mysql -uroot -prootpass mysql
```

```
docker compose exec db mysql -uuser -psyslogpass syslog -e "SELECT ID, ReceivedAt, FromHost, SysLogTag, Message FROM systemevents ORDER BY ID DESC LIMIT 10;"
```

```
docker compose down -v && docker volume prune --force && sudo rm data/*
docker compose up -d --build --force-recreate
```



Host :     db
Database : loganalyzer
User :     user
Password : syslogpass





### Step 7 - Create the first source for syslog messages

First syslog source
| Champ                  | Valeur à saisir                          |
| ---------------------- | ---------------------------------------- |
| **Name of the Source** | `Syslog via rsyslog` (ou ce que tu veux) |
| **Source Type**        | `MYSQL Native`                           |
| **Select View**        | `Syslog Fields`                          |

Database Type Options
| Champ                  | Valeur à saisir                          |
| ---------------------- | ---------------------------------------- |
| **Table Type**         | `MonitorWare`                            |
| **Database Host**      | `db`                                   |
| **Database Name**      | `syslog`                                   |
| **Database Tablename** | `systemevents` Attention à la casse      |


