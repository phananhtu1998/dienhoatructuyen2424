#!/bin/sh

echo "💡 Waiting for MySQL to be ready..."
while ! nc -z mysql 3306; do   
  sleep 1
done

echo "✅ MySQL is ready. Running Goose migrations..."

# Chạy migration
/goose -dir=/app/sql/schema mysql "user:root1234@tcp(mysql:3306)/parkingdevgo" up

echo "🚀 Starting Go application..."
exec /crm.gobackend.com config/local.config
