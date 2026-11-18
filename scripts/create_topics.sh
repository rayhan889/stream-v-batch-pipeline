#!/usr/bin/env bash
set -euo pipefail
for t in x-stream-bbca x-stream-bumi x-stream-dssa; do
  docker exec kafka /opt/kafka/bin/kafka-topics.sh \
    --bootstrap-server localhost:9092 --create --if-not-exists \
    --topic "$t" --partitions 3 --replication-factor 1 \
    --config message.timestamp.type=LogAppendTime \
    --config retention.ms=604800000
done
docker exec kafka /opt/kafka/bin/kafka-topics.sh --bootstrap-server localhost:9092 --describe