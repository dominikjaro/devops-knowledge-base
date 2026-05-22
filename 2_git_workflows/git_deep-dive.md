#### Basics

* `git status` - Check the status of your repository, including staged and unstaged changes.
* `git diff` - Show the differences between your working directory and the index (staging area).
* `git diff --cached` - Show the differences between the index (staging area) and the repository.

#### Moving Datato the Left (Staging Changes)

* `git add <file>` - Stage changes to a specific file. (moving changes to the index)
* `git commit -m "message"` - Commit staged changes with a message describing the changes. (from the index to the repository)

#### Moving Data to the Right (Unstaging Changes)

* `git diff <branch_1> <branch_2>` - Show the differences between your current branch and another branch.
* `git rm --cached <file>` - Unstage a file, removing it from the index but keeping it in the working directory.
* `git switch/checkout <branch>` - Switch to a different branch, which may involve moving changes back to the working directory if they are not committed.

#### Commands that move branches

* `git merge <branch>` - Merge another branch into the current branch, which may involve moving changes from the other branch to the current branch.
* `git rebase <branch>` - Reapply commits on top of another base branch.
* ` git commit -m "message"` - Commit changes to the current branch, which may involve moving changes from the index to the repository.
* `git pull` - Fetch and integrate changes from a remote repository.
*  ... and other commands that involve moving changes between branches or repositories.

* `git reset --hard <commit>` - Reset the current branch to a specific commit, discarding all changes in the working directory and index.
* `git reset --soft <commit>` - Reset the current branch to a specific commit, but keep changes in the index and working directory.
* `git reset --mixed <commit>` - Reset the current branch to a specific commit, keeping changes in the working directory but unstaging them from the index.

`git reset` moves the current branch, and optionally copies data from the Repo to the other areas.

* `git reset HEAD` - Unstage all changes, moving them from the index back to the working directory.(Repo -> Index, but the changes remain in the working directory)
* `git reset --hard HEAD` - Discard all changes in the working directory and index, resetting to the last commit. (Repo -> Index -> Working Directory, discarding changes)

#### Advanced Commands

* `git stash --include-untracked` - Stash changes, including untracked files, which moves them from the working directory and index (staged)to the stash -- and it also checks out the current commit so our working directory is clean.
* `git stash list`. - List all stashed changes, which shows the stashes that have been created and can be applied later.
* `git stash apply` - Apply stashed changes back to the working directory and index. (if you don't specify a stash, it applies the most recent one)
* `git stash clear` - Clear all stashed changes, which removes them from the stash and cannot be recovered.

* `git add --patch <file>` - Interactively stage changes in a file, allowing you to choose which changes to stage. (moving specific changes from the working directory to the index)