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
# Open the applications I use
##
start-day() {
  open -a Mail
  open -a Safari
  open -a Slack
  open -a Obsidian
  open -a "Visual Studio Code"
  open -a Music
}

##
# Sync dependabot config from repo to all repos
##
function sync-dependabot()
{
  local from=$1
  local msg=$2
  local dependabot=".github/dependabot.yml"
  local branch="dependabot-sync"
  local usage="Usage: sync-dependabot <from> <msg>"

  if [ -z "${from}" ]; then
    printf "Please specify a repo to sync from\n"
    printf "${usage}\n"
    return
  fi

  if [ -z "${msg}" ]; then
    printf "Please specify a commit message\n"
    printf "${usage}\n"
    return
  fi

  for dir in */; do
  (
    repo="${dir/\//}"
    if [[ "${repo}" == "${from}" ]]; then
      return
    fi

    echo "\n\n${repo}"
    echo "Synching ${from}/${dependabot} to ${repo}/${dependabot}"

    cp "${from}/${dependabot}" "${repo}/${dependabot}" || exit

    cd "${repo}" > /dev/null 2>&1 || exit

    if ! $(git status --porcelain); then

      git checkout -b "${branch}" || exit
      git add "${dependabot}"

      if git commit -am "${msg}"; then
        gh pr create --body "${msg}" --title "${msg}"
      else
        echo "Failed to raise PR for ${repo}"
      fi

      if ! git checkout main; then
        echo "Failed to checkout main"
      fi

      if ! git branch -D "${branch}"; then
        echo "Failed to remove branch: ${branch}"
      fi
    else
      echo "Nothing to sync 👏🏻"
    fi

    echo ""
  )
  done
}
