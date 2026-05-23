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

#### History

* `git log` - Show the commit history, which displays a list of commits in the repository.
* `git log --graph --decorate --oneline` - Show a graphical representation of the commit history, which can help visualize branches and merges.
* `git show <commit_hash>` - Show details of a specific commit, including changes made and commit message.
* `git show <branch_name>` - Show details of the latest commit on a specific branch.
* `git show HEAD` - Show details of the latest commit on the current branch.
* `git show HEAD^` - Show details of the commit before the latest commit on the current branch.
* `git show HEAD^^` - Show details of the commit two commits before the latest commit on the current branch.
* `git show HEAD~3` - Show details of the commit three commits before the latest.
* `git show HEAD@{"1 month ago"}` - Show details of the commit from one month ago on the current branch.

* `git blame <file>` - Show who made changes to each line of a file, which can help identify the author of specific changes.
* `git diff HEAD~3 HEAD` - Show the differences between the current state of the repository and the state three commits ago, which can help identify changes made over a specific period of time.
* `git diff <branch_1> <branch_2>` - Show the differences between two branches, which can help identify changes made in one branch compared to another.

---

#### Submodules

* Think of a submoduile as a pointer to another project's commit.
* Submodules don't change unless you ask them to.
* If submodules become a chore, look for more powerful Git commands e.g. `git submodule update --remote --recursive` to update all submodules to the latest commit on their respective branches.

---

#### LFS (Large File Storage)

* Git LFS is an extension to Git that allows you to manage large files more efficiently by storing them outside of the main repository.

**Consider LFS if...**
    your binary files tend to stay in the repository, but no in the working area.