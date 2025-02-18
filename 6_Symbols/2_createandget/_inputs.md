DATABASE="database.kdbx"
PASSWORD="xx"  # Replace with your actual password

for i in {1..10}; do
    RANDOM_NAME="Entry$i"
    RANDOM_PASS=$(openssl rand -base64 16)  # Generate a random password

    # Add entry with an interactive password prompt
    echo -e "$RANDOM_PASS\n$RANDOM_PASS" | keepassxc-cli add database.kdbx "$RANDOM_NAME" -g
done