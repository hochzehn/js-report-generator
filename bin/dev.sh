#!/usr/bin/env bash

echo ""

mkdir -p "public"

# Generate report
echo ""
echo "1 Generating report."
bin/generate.sh > public/index.html

# Update local nginx
echo ""
echo "2 Restarting container."
docker-compose build > /dev/null
docker-compose up -d

echo ""
echo "3 Done."
