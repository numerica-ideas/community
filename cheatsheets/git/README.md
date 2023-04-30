# Git Cheat Sheet&nbsp;[![Hits](https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fgithub.com%2Fnumerica-ideas%2Fcommunity%2Ftree%2Fmaster%2Fcheatsheets%2Fgit&count_bg=%2379C83D&title_bg=%23555555&icon=&icon_color=%23E7E7E7&title=hits&edge_flat=false)](https://blog.numericaideas.com/git-cheat-sheet)

**This document was originally published by "Orleando Dassi & Romuald Oumbe" on the blog**: https://blog.numericaideas.com/git-cheat-sheet

**Git** is a free and open-source distributed version control system that's responsible for tracking file changes to facilitate collaborative work with others. This cheat sheet features the most important and commonly used **Git Commands** for easy reference.

Click here to access the [PDF format](./git-cheat-sheet.pdf).

![GitCheatSheetThumbnail](./thumbnail.png)

## Setup
Configuring user information used across all repositories:
- `git config --global user.name "[firstname lastname]"`: Sets a name that is identifiable for credit or ownership of change within the version history
- `git config --global user.email "[valid-email]"`: Sets an email address that will be associated with each history marker

The same configs can be done for a specific project with the `"--local"` option that applies for the current repository only.

## Basic Git Commands
- `git init`: Initializes a new Git repository
- `git clone <url>`: Clones an existing repository into a new directory
- `git add <file>`: Adds changes to the staging area
- `git commit -m "<message>"`: Commits changes to the local repository with a message
- `git push`: Pushes committed changes to a remote repository
- `git pull`: Pulls changes from a remote repository
- `git fetch`: Fetches changes from a remote repository

## Branching and Merging
- `git branch`: Lists all branches in the repository
- `git branch <name>`: Creates a new branch with the given name
- `git checkout <branch>`: Switches to the specified branch
- `git merge <branch>`: Merges the specified branch into the current branch
- `git rebase <branch>`: Rebase current branch onto specified branch

## Viewing History
- `git log`: Shows a log of all commits
- `git log --oneline`: Shows a compact log of all commits
- `git diff <commit>..<commit>`: Shows the differences between two commits
- `git blame <file>`: Shows who last modified each line of a file

## Undoing Changes
- `git reset <file>`: Unstages changes in the given file
- `git reset <commit>`: Resets the current branch to the specified commit
- `git revert <commit>`: Creates a new commit that undoes the changes in the specified commit

## Collaborating with Others
- `git remote add <name> <url>`: Adds a new remote repository with the given name and URL
- `git remote -v`: Lists all remote repositories
- `git pull --rebase`: Pulls changes from a remote repository and rebases local changes on top of them
- `git push <remote> <branch>`: Pushes the specified branch to the specified remote repository

![GitCheatSheetCTA](./cta.png)

Thanks for reading this article, recommend and share if you enjoyed it. Follow us on [Facebook](https://www.facebook.com/numericaideas), [Twitter](https://twitter.com/numericaideas), and [LinkedIn](https://www.linkedin.com/company/numericaideas) for more content.

By [NumericaIdeas Network](https://numericaideas.com)
