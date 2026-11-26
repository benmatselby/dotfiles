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
# Take a folder and then load up tmux the way I like it.
#
# Layout:
# +-------+-------+
# | pane1 | pane2 |
# |       +-------+
# |       | pane3 |
# +-------+-------+
#
# pane1 runs nvim, pane2 and pane3 are shells in the project folder.
#
function code-load-project() {
  local project_path="${1:?Usage: code-load-project <folder-name>}"

  # Turn relative paths into absolute paths folder
  project_path=$(realpath "${project_path}")

  # Get the project name (assume repo)
  local project_name=$(basename "${project_path}")

  echo "${project_name} at ${project_path}"
  # Fire up tmux window; capture the left pane ID, start nvim in it
  local left_pane
  left_pane=$(tmux new-window -P -F '#{pane_id}' -n "${project_name}" -c "${project_path}")
  tmux send-keys -t "${left_pane}" "nvim" C-m

  # Right hand column
  local top_right
  top_right=$(tmux split-window -h -P -F '#{pane_id}' -t "${left_pane}" -c "${project_path}")

  # Split the right column vertically to give the bottom right pane
  tmux split-window -v -t "${top_right}" -c "${project_path}"

  # Leave focus on the editor
  tmux select-pane -t "${left_pane}"
}

##
# Create a new git worktree in current repo, and store in the parent folder.
#
# Calls code-load-project to load the worktree in a new tmux window.
#
function code-worktree-add() {
    local branch="${1:?Usage: code-worktree-add <branch-name>}"

    # Get just the name of the current folder
    local repo_name=$(basename "$(pwd)")

    # Build the worktree name now
    local worktree_name="${repo_name}-${branch}"

    # Create the worktree
    git worktree add -b "${branch}" ../"${worktree_name}"

    # Load tmux windowing
    code-load-project "../${worktree_name}"
}

##
# Pick a repo with fzf, ask for a branch name, then call code-worktree-add.
#
# Designed to run inside a tmux popup (see M-n in .tmux.conf).
#
function code-worktree-pick() {
    local repo
    repo=$(fd -HI -t d '^\.git$' ~/git --max-depth 4 -x dirname {} \
        | sort \
        | fzf --reverse --prompt 'repo> ') || return
    [[ -z "${repo}" ]] && return

    local name
    read -r "name?Branch name: "
    [[ -z "${name}" ]] && return

    cd "${repo}" || return
    code-worktree-add "${name}"
}

##
# Pick a repo with fzf and load it with code-load-project.
#
# Designed to run inside a tmux popup (see M-p in .tmux.conf).
#
function code-load-project-pick() {
    local repo
    repo=$(fd -HI -t d '^\.git$' ~/git --max-depth 4 -x dirname {} \
        | sort \
        | fzf --reverse --prompt 'project> ') || return
    [[ -z "${repo}" ]] && return

    code-load-project "${repo}"
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

    # Delete the branch. Branch name is ${parent} minus the ${worktree_name}
    # prefix and the hyphen
    local repo_name=$(basename "${parent}")
    local branch="${worktree_name#${repo_name}-}"
    git branch -D "${branch}"

    # Close the current tmux window
    tmux kill-window -t "${worktree_name}"
}
