# 🛠️ Challenge 3: The "Network & Backup Specialist"

## Part 1: The "Environment Check" (Network)

Before the menu even starts, your script should check if the server has an internet connection.

- **Your Task:** Use the `ping` command to check connectivity to a reliable site (like `google.com` or `8.8.8.8`).
- **The Logic:** Run the ping only once (`-c 1`). Use an `if` statement to check the exit status (`$?`) of the ping.
  - If it succeeds, print `"Network: ONLINE"`.
  - If it fails, print `"Network: OFFLINE"` but let the script continue.

---

## Part 2: The Disaster Recovery Menu

Add a new menu loop (or update your existing one) with these three specific options:

1. **Network Map:** Show the current IP address of the machine (`ip addr`) and all active listening ports (`ss -tulpn` or `netstat -plnt`).
2. **Project Backup:** This will call a function (see Part 3).
3. **Process Watcher:** Ask the user for a process name (e.g., `"ssh"` or `"vmware"`). Use `ps aux | grep` to show if that process is running.

---

## Part 3: The "Archive" Function (Disaster Recovery)

This is the most important part. You will build a function that "packages" a folder so it can be moved or saved.

- **Function Name:** `backup_project`
- **The Logic:**
  - Ask the user: `"Which directory do you want to backup?"`
  - **Validation:** Check if the directory actually exists using `[ -d "$dir_name" ]`. If it doesn't exist, print an error and return to the menu.
  - **Compression:** If it exists, use the `tar` command to create a compressed file.
  - **Naming:** The backup file name must include a timestamp.
    > **Hint:** Use `$(date +%Y-%m-%d_%H-%M-%S)` in the filename.
    >
    > **Example output:** `backup_myproject_2026-05-07.tar.gz`

---

## 💡 Senior DevOps Tips for Challenge 3

- **Exit Codes (`$?`):** In Linux, every command returns a number when it finishes. `0` means success, anything else means failure. Checking `if [ $? -eq 0 ]` after a ping is a very "Senior" way to handle errors.

- **The `tar` command:** It can be confusing. Use these flags: `tar -czf [filename.tar.gz] [folder_to_backup]`.

  - `c` = create
  - `z` = compress (gzip)
  - `f` = file

- **Permissions:** You might need to use `sudo` for the Network Map (`ss`) to see all the details.

---

## ANSWER: Script

```bash
#!/bin/bash

ping -c 1 8.8.8.8 > /dev/null 2>&1

if [ $? -eq 0 ]; then
    echo "Network: ONLINE"
else
    echo "Network: OFFLINE"
fi

sleep 2;

backup_project() {
  timestamp=$(date +%Y-%m-%d_%H-%M-%S)
  read -p "Which directory do you want to backup? " dir_name
  if [ ! -d "$dir_name" ]; then
    echo "Error: Directory $dir_name does not exist."
    return 1
  fi
  echo "Directory found! Starting tar compression..."
  sleep 1;
  tar -czf "backup_${dir_name}_${timestamp}.tar.gz" --one-file-system ${dir_name}
}

while true; do
    echo "1) Network Map"
    echo "2) Project Backup"
    echo "3) Process Watcher"
    echo "4) Quit"
    read -sn1 -p "Choose an option: "
    case "$REPLY" in
        1) echo "" && ip addr && ss -tulpn ;;
        2) backup_project ;;
        3) echo "" && read -p "Enter process name: " proc_name &&  ps aux | grep -i "$proc_name" ;;
        4) echo "Exiting..." && exit 0 ;;
        *) echo "Invalid option, try again." ;;
    esac
    echo ""
    read -n1 -p "Press any key to continue..."
done
```