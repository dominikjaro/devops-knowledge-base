# Challenge: The "SysAdmin Toolkit" Script

Your goal is to build a single script that acts as an administrative toolkit. You will build this in three phases.

---

## Part 1: The Authentication Loop

Password or user checks shouldn't just happen once; they should loop until correct.

### Your Task

Write the beginning of your script to prompt the user to enter a "security PIN".

### The Logic

Use a `WHILE` loop to check the input. If the PIN is incorrect, print an error message and prompt them again. The loop should continue indefinitely until the condition is no longer met (i.e., they enter the correct PIN).

> **Hint:** You will need to use concepts from "Prompting for user input" and "Implementing Script logic".

---

## Part 2: The Controlled Operator Menu

Once the user enters the correct PIN, they should be granted access to a BASH menu. Using a BASH menu allows you to present operators with a set list of controlled tasks.

### Your Task

Create a menu that loops continuously until the user specifically chooses to quit. The menu should have the following three options:

- **View OS Details:** When selected, this should run the command to display the Operating System details.
- **Generate Test Users:** When selected, this will run a loop to generate a list of dummy users.
- **Quit:** This should exit the script.

---

## Part 3: Streamlining with Functions and Iteration

Now, you will refactor the logic from option #2 in your menu to use functions and positional parameters.

### Your Task

- Create a function named `generate_users`. Call this function when the operator selects option #2 from your menu.
- When calling the function, pass it a custom prefix (e.g., `"testuser"` or `"admin"`) as a positional parameter (using `$1`).
- Inside the function, use a `FOR` loop to iterate through code. Use brace expansion (similar to `user{1..3}`) to loop exactly 3 times.
- During each iteration of the loop, print a message to the screen using your loop variable (e.g., `$u`) combined with your positional parameter so the output says something like:
  - `"Creating account: testuser1"`
  - `"Creating account: testuser2"`
  - etc.

---

**Bonus / Stretch Goal:** Your sources mention that you can add a menu script to `~/.bash_profile` to ensure it runs on login, and that using `exec <path-to-script>` will ensure the user is logged out when they exit the menu. Once your script is working perfectly, try configuring a test environment so that this script runs immediately when you log in!

Take your time scripting this out. Let me know if you want hints on syntax or if you want me to review your code once you are finished!
