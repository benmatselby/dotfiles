#!/usr/bin/env zsh

##
# Pick from the tmux panes running an agent, and jump to the one chosen.
#
# Usage: get-agent-tmux-panes [pattern]
#   pattern  Regex matched against the pane's process and its children, so a
#            single agent ("claude") or several ("claude|opencode") work.
#            Defaults to "claude|opencode".
#
# Each pane shows the state set by tmux/agent-state.sh (waiting, done, working), or idle.
#
# Designed to run inside a tmux popup (see M-c in .tmux.conf).
#
function get-agent-tmux-panes() {
    # Declared here, not inside the loop: re-running "local" on an already-set
    # variable makes zsh print "icon=..." into the pipeline.
    local pick icon
    local pattern="${1:-claude|opencode}"

    # @agent is a pane option, so each pane reports its own state.
    # Format fields: pane id, pane pid, agent state, then session:window_name,
    # the same label the M-/ window picker shows, so both popups read alike.
    # #{?#{@agent},#{@agent},idle} falls back to "idle" when the option is
    # unset, otherwise the empty field would shift the label into "state".
    # The label goes last as the window name can contain spaces; read puts the
    # remainder of the line in the final variable.
    # fzf --with-nth=2.. hides the pane id (field 1) but still returns it, which
    # is what we jump to at the end.
    pick=$(tmux list-panes -a -F '#{pane_id} #{pane_pid} #{?#{@agent},#{@agent},idle} #{session_name}:#{window_name}' \
        | while read -r id pid state label; do
            # Keep panes where the agent is the pane's process or a child of it.
            # pgrep -f and grep -E both treat the pattern as an extended regex.
            if pgrep -P "${pid}" -f "${pattern}" >/dev/null || ps -o command= -p "${pid}" | grep -qE "${pattern}"; then
                # Map the state from tmux/agent-state.sh to a coloured label. The
                # colours match the status bar markers in .tmux.conf. $'\e[38;2;R;G;Bm'
                # is an ANSI truecolor foreground, $'\e[0m' resets it; fzf needs
                # --ansi below to render them rather than print the codes.
                case "${state}" in
                    waiting) icon=$'\e[38;2;235;111;146m● waiting\e[0m' ;;  # #eb6f92
                    done)    icon=$'\e[38;2;156;207;216m✓ done\e[0m' ;;     # #9ccfd8
                    working) icon=$'\e[38;2;246;193;119m… working\e[0m' ;;  # #f6c177
                    *)       icon=$'\e[2m- idle\e[0m' ;;                     # dim
                esac
                print -r -- "${id} ${label}  ${icon}"
            fi
        done \
        | fzf --ansi --reverse --with-nth=2..) || return
    [[ -z "${pick}" ]] && return

    local id="${pick%% *}"
    tmux switch-client -t "${id}" && tmux select-pane -t "${id}"
}
