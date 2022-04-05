#!/bin/sh

sed -i "s|bind 127.0.0.1 -::1|#bind 127.0.0.1 -::1|g" /etc/redis.conf
sed -i "s|protected-mode yes|protected-mode no|g" /etc/redis.conf

echo "maxmemory 256mb" >> /etc/redis.conf
echo "maxmemory-policy allkeys-lru" >> /etc/redis.conf

# Run & stay in the foreground 
/usr/bin/redis-server /etc/redis.conf