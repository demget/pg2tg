for v in 10 11 12; do
    docker buildx build --platform linux/amd64,linux/arm64 -t demget/pg2tg:$v --build-arg PG_VERSION=$v --push .
done