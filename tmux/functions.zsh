#!/usr/env/bin zsh

##
# Pick from the tmux panes running claude, and jump to the one chosen.
#
# Designed to run inside a tmux popup (see M-c in .tmux.conf).
#
function get-claude-tmux-panes() {
    local pick
    pick=$(tmux list-panes -a -F '#{pane_id} #{pane_pid} #{session_name}:#{window_index}.#{pane_index} #{window_name}' \
        | while read -r id pid target name; do
            if pgrep -P "${pid}" -f claude >/dev/null || ps -o command= -p "${pid}" | grep -q claude; then
                echo "${id} ${target} ${name}"
            fi
        done \
        | fzf --reverse --with-nth=2.. --prompt 'claude> ') || return
    [[ -z "${pick}" ]] && return

    local id="${pick%% *}"
    tmux switch-client -t "${id}" && tmux select-pane -t "${id}"
}
