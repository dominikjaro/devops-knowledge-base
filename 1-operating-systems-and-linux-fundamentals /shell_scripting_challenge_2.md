# 🛠️ Challenge 2: The "Platform Health & Log Explorer"

## Part 1: The "Secret Key" Access

Instead of a PIN, this time we want to check for a Secret Keyword to enter the toolkit.

- **Your Task:** Prompt the user for an "Access Key".
- **The Logic:** Use a `WHILE` loop. The loop should keep asking `"Access Denied. Enter Key: "` until the user types the word `devops2026`.
- **Bonus:** Use `read -s` so the key isn't visible when they type it.

---

## Part 2: The Health Menu

Once they are in, create a `while true` menu with the following options:

1. **System Vitals:** Run `hostnamectl`, `lscpu`, and `lsmem` all at once to give a full server snapshot.
2. **Search Logs:** Prompt the user for a word (e.g., `"error"` or `"critical"`), then use `grep` to search for that word in `/var/log/syslog`.
   > **Note:** You might need `sudo` for this.
3. **Bulk Folder Generator:** This will call a function (see Part 3).
4. **Quit:** Exit the script gracefully.

---

## Part 3: Advanced Function & Positional Parameters

Refactor the Bulk Folder Generator (Option #3) to be a separate function.

- **Function Name:** `make_folders`
- **The Logic:** When the user selects Option 3, ask them: `"What is the project name?"`.
- **The Call:** Pass that project name into the function as a positional parameter (`$1`).
- **The Loop:** Inside the function, use a `FOR` loop and Brace Expansion to create 5 directories named: `[ProjectName]_source`, `[ProjectName]_config`, `[ProjectName]_logs`, etc.
- **The Output:** Print a message for each folder created: `"Created directory: project1_source"`.

---

## 💡 Senior DevOps Tips for this Challenge

- **The grep challenge:** In Part 2, Option 2, remember that `grep` works best if you tell it which file to look in.

  ```bash
  grep "$search_term" /var/log/syslog | tail -n 10
  ```

  *(This shows only the last 10 matches.)*

- **The mkdir safety:** Inside your function, use `mkdir -p`. This is "best practice" because the script won't crash if the folders already exist.

- **Cleanliness:** Use the `clear` command at the start of your menu loop so the screen doesn't get cluttered with old text.

---

## ANSWER: THE SCRIPT

```bash
#!/bin/bash
secret_keyword="devops2026" #For practices only, in any envrionment this value would be referenced from an .env file or secret
project_name_suffixes=("config" "logs" "sources")

search_logs () {
  read -p "Enter search term (e.g. error, critical, sudo): " search_term
  echo "Searching for '$search_term' in syslog..."
  sudo grep -i "$search_term" /var/log/syslog | tail -n 10
}

make_folders () {
  read -p "$1" project_name_prefix
  for s in "${project_name_suffixes[@]}" ; do
    echo "Created directory: ${project_name_prefix}_$s"
    # mkdir -p "${project_name_prefix}_$s"
  done
}

read -sp "Enter the Secret Keyword: " secret_keyword_check

while [ "$secret_keword" != "$secret_keyword_check" ] ; do
  echo -e "\nAccess Denied. Try again!"
  read -sp "Enter the Secret Keyword: " secret_keyword_check
done

while true ; do
  clear
  echo "1: System CPU info"
  echo "2: Search Logs"
  echo "3: Bulk Folder Generator"
  echo "4: Quit"
  read -sn1 -p "Choose an option: "
  case "$REPLY" in
    1) lscpu ;;
    2) search_logs ;;
    3) make_folders "What os the project name? " ;;
    4) echo -e "\nExiting..."; exit 0 ;;
    *) echo -e "\nSelection not recognized." ;;
  esac
  echo ""
  read -n1 -p "Press any key to continue"
done
```