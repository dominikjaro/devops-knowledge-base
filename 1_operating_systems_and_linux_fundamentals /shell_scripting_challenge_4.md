# Challenge: The "Interactive CI/CD Runner" Script

## Part 1: The "Pre-Flight" Dependency Check

Before a CI/CD pipeline runs, it must ensure the server actually has the tools it needs.

- **Your Task:** Check if the tar command is installed on the system before showing the menu.
- **The Logic:** Use command -v tar > /dev/null 2>&1.
- **The Output:** Use an if statement. If it exists ($? -eq 0), print "System Check: READY". If it fails, print "System Check: FAILED - tar is missing" and exit 1 to stop the script.

## Part 2: The Pipeline Menu

Create a `while true` menu representing the stages of a pipeline:

1. **Code Linter:** (Simulated check)

2. **Build Artifact:** (Calls a function)

3. **Deploy Artifact:** (Calls a function)

4. **Quit:** Exit the runner.

## Part 3: The "Build Artifact" Function

When the user selects Option 2, we need to create a versioned package.

- **Function Name:** `build_artifact`
- **The Logic:** * Ask the user: `"Enter build version (e.g., 1.0.0): "`
  - Create a temporary directory named `build_workspace`.
  - Create a dummy file inside it named `source_code.bin`.
  - Compress the workspace into a tarball named `app-release-[VERSION].tar.gz` (using the version they typed).
  - Print `"Artifact built successfully!"`.

## Part 4: The "Deploy" Function (The Gatekeeper)

When the user selects Option 3, the script must verify an artifact actually exists before trying to deploy it.

- **Function Name:** `deploy_artifact`
- **The Logic:**
  - Ask the user: `"Which version do you want to deploy?: "`
  - Validation: Use an if statement with `[ -f "app-release-[VERSION].tar.gz" ]` to check if that specific file exists.
  - If it does not exist, print `"Error: Artifact not found. Did you run the Build stage first?"`

If it does exist, print `"Deploying app-release-[VERSION].tar.gz to Production..."` and move the file into a `/tmp/production_server/` directory.

**💡 Senior DevOps Tips for Challenge 4**
File vs. Directory check: In Challenge 3, you used `[ -d ]` to check if a directory exists. In Part 4 of this challenge, you are looking for a file, so you must use `[ -f filename ]`!

Silent directory creation: When moving files to `/tmp/production_server/` during deployment, remember to use `mkdir -p /tmp/production_server/` first, just in case the folder doesn't exist yet!