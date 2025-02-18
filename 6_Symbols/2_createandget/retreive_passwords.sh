#!/bin/bash
# chmod +x retrieve_entries.sh
# ./retrieve_entries.sh

DATABASE="database.kdbx"

echo "Retrieving entries from $DATABASE..."

for i in {1..10}; do
    ENTRY="Entry$i"
    PASSWORD=$(keepassxc-cli show -q -s -p "$DATABASE" "$ENTRY")
    echo "Entry: $ENTRY | Password: $PASSWORD"
done