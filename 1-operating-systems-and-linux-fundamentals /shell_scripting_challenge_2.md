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
