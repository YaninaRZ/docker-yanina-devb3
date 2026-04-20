#!/bin/bash
source .env
echo "Vérif conteneur MongoDB..."

USER_CHECK=$(docker exec mongo-blog whoami)

if [ "$USER_CHECK" = "root" ]; then
    echo "ERR: MongoDB tourne en root"
    exit 1
else
    echo "OK: User = $USER_CHECK (pas root)"
fi

DB_CHECK=$(docker exec mongo-blog mongosh --quiet \
  -u "$MONGO_INITDB_ROOT_USERNAME" \
  -p "$MONGO_INITDB_ROOT_PASSWORD" \
  --eval "db.getSiblingDB('blog_db').posts.countDocuments()")

if [ "$DB_CHECK" -gt 0 ]; then
    echo "OK: $DB_CHECK docs trouvés dans posts"
else
    echo "ERR: rien de trouver dans blog_db"
    exit 1
fi

echo "Youpi yeay MongoDB est opérationnel"