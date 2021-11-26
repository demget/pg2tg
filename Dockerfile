ARG PG_VERSION=12

FROM prodrigestivill/postgres-backup-local:$PG_VERSION

COPY pg2tg.py /pg2tg.py

COPY entrypoint.sh /entrypoint.sh

ENV BOT_TOKEN='' CHAT_ID=0

RUN apt update && \
    apt install -y python3 python3-pip && \
    python3 -m pip install pyrogram tgcrypto

ENTRYPOINT ["/bin/sh", "-c"]

CMD ["exec /usr/local/bin/go-cron -s \"$SCHEDULE\" -p \"$HEALTHCHECK_PORT\" -- /entrypoint.sh"]

HEALTHCHECK --interval=5m --timeout=3s CMD curl -f "http://localhost:$HEALTHCHECK_PORT/" || exit 1