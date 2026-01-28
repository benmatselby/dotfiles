#!/usr/env/bin zsh

##
# Sync the codebases for a branch
#
function code-sync()
{
  for dir in */; do
    (
      echo "${dir}"
      cd "${dir}" > /dev/null 2>&1 || exit

      if [ -d .git ]; then
        git fetch -p origin && \
        git pull origin $(git rev-parse --abbrev-ref HEAD)
      else
        echo 'Not a git repo, skipping...'
      fi
      echo ""
    )
  done
}

##
# Delete all merged branches
#
function code-delete-merged-branches()
{
  for dir in */; do
    (
      echo "${dir}"
      cd "${dir}" > /dev/null 2>&1 || exit

      if [ -d .git ]; then
        LANG=C git branch --no-color -vv | grep ": gone\]" | cut -c 3- | awk '{print $1}' | xargs git branch -D
      else
        echo 'Not a git repo, skipping...'
      fi
      echo ""
    )
  done
}

##
# Run git clean for all the git repos
#
function code-clean()
{
  for dir in */; do
  (
    printf "${dir}\n"
    cd "${dir}" > /dev/null 2>&1 || exit

    if [ -d .git ]; then
      git clean -fX
    else
      printf "Not a git repo, skipping..."
    fi
    printf "\n"
  )
  done
}

##
# What branch is the codebase on and red/green depending if it's dirty or not
#
function code-branch()
{
  local reset=$'\e[0m'
  local red=$'\e[1;31m'
  local green=$'\e[1;32m'
  color=${red}

  for dir in */; do
  (
    cd "${dir}" > /dev/null 2>&1 || exit
    cmd=$(git status --short)
    if [ -z "${cmd}" ] ; then
      color=${green}
    fi
    printf "${dir} %s$(git rev-parse --abbrev-ref HEAD)%s\\n" "${color}" "${reset}"
  )
  done
}

##
# Create a new git worktree in current repo, and store in the parent folder.
#
# Create a tmux window with three panes:
# - Two columns
# - Left column split horizontally (2 panes)
# - Right column is a single pane
#
# Layout:
# +-------+-------+
# | pane1 | pane3 |
# +-------+       |
# | pane2 |       |
# +-------+-------+
#
function code-worktree-add() {
    local branch="${1:?Usage: tmux_three_pane <window-name>}"

    # Get just the name of the current folder
    local repo_name=$(basename "$(pwd)")

    # Build the worktree name now
    local worktree_name="${repo_name}-${branch}"

    # Create the worktree
    git worktree add -b "${branch}" ../"${worktree_name}"

    # Setup tmux how I like it
    tmux new-window -n "$worktree_name" -c "../${worktree_name}"
    tmux split-window -t "$worktree_name" -h -c "../${worktree_name}"
    tmux select-pane  -t "$worktree_name" -L
    tmux split-window  -t "$worktree_name" -v -c "../${worktree_name}"
}

##
# Delete a git worktree in current repo and then close tmux winwdow
#
function code-worktree-remove() {
    # Get just the name of the current folder
    local worktree_name=$(basename "$(pwd)")

    # Get the parent folder of this worktree
    local parent="$(git worktree list --porcelain | grep -m1 '^worktree ' | cut -d' ' -f2)"

    cd "${parent}" || return

    # Remove the worktree
    git worktree remove "${worktree_name}"

    # Close the current tmux window
    tmux kill-window -t "${worktree_name}"
}
