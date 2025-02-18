# 🔐 KeePassXC Random Entry Generator

## Database Configuration
```bash
DATABASE="database.kdbx"
PASSWORD="XXX"  # Replace with your actual password (⚠️ for testing only - don't store passwords in scripts!)
```

## 🎲 Random Entry Generation Script
```bash
for i in {1..10}; do
    RANDOM_NAME="Entry$i"                       # 📝 Creates sequential entry names
    RANDOM_PASS=$(openssl rand -base64 16)      # 🎲 Generates secure random password
    
    # 🔐 Add entry with password piped to stdin (repeats for confirmation)
    echo -e "$RANDOM_PASS\n$RANDOM_PASS" | keepassxc-cli add database.kdbx "$RANDOM_NAME" -g
done
```

## 🚀 Improved Script with Username and URL
```bash
# 🔐 Securely prompt for the database password
read -s -p "Enter database password: " DB_PASSWORD
echo  # Add newline after password input

# 🔄 Loop to create 10 random entries
for i in {1..10}; do
  # 🎲 Generate random data for each field
  RANDOM_USERNAME="user_$(openssl rand -hex 4)"   # Creates username with random suffix
  RANDOM_PASSWORD="$(openssl rand -base64 12)"    # Creates secure 16-character password
  RANDOM_URL="https://example-$(openssl rand -hex 3).com"  # Creates random website URL
  
  echo "Adding entry $i: Entry$i with username $RANDOM_USERNAME"
  
  # 🔐 Pipe both database password and entry password to keepassxc-cli
  (echo "$DB_PASSWORD"; echo "$RANDOM_PASSWORD") | keepassxc-cli add \
    /workspaces/LocalPasswordManagement/6_Symbols/2_createandget/database.kdbx \
    "Entry$i" \
    -u "$RANDOM_USERNAME" \
    --url "$RANDOM_URL"
done
```

## 📋 Verifying Entries in the Database
```bash
keepassxc-cli ls /workspaces/LocalPasswordManagement/6_Symbols/2_createandget/database.kdbx
# Output will show all entries after entering the database password:
# TestEntry
# Entry1
# Entry2
# ...and so on
```

## 💡 Tips
- Use `-g` flag instead of providing a password to have KeePassXC generate one for you
- Never store real passwords in script files 
- Consider using environment variables for sensitive data during automation
- For better security, avoid piping passwords when possible

## 🛑 Security Warning
This script is for educational purposes. In production environments:
- Don't store database passwords in scripts
- Consider using key files or hardware keys for automation
- Implement proper secret management for credentials