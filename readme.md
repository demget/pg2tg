# Postgres 🔄 Telegram

Backup PostgresSQL to Telegram, based on [prodrigestivill/docker-postgres-backup-local](https://github.com/prodrigestivill/docker-postgres-backup-local). Backup multiple databases from the same host by setting the database names in `POSTGRES_DB` separated by commas or spaces.

## Compose 

```yaml
version: '3'

services:
  pg2tg:
    image: demget/pg2tg:12
    restart: always
    environment:
      - POSTGRES_HOST=postgres
      - POSTGRES_DB=database
      - POSTGRES_USER=username
      - POSTGRES_PASSWORD=password
      - SCHEDULE=@daily
      - BOT_TOKEN=token
      - CHAT_ID=123456789
```