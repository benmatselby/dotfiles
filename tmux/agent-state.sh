#!/usr/bin/env sh

##
# Record what a coding agent is doing as a tmux pane option (@agent).
#
# Per pane, not per window, so a window with several panes can hold several
# agents, each with its own state.
#
# Agent-neutral: any agent can call this from its own hooks/plugins, mapping its
# events to one of the states. Usage:
#   agent-state.sh working|waiting|done|idle|clear
#
#   working  A turn is in progress
#   waiting  Blocked on you (a permission prompt or a question)
#   done     Finished its turn
#   idle     The agent is sitting at its prompt. Only clears a stale "working"
#            (e.g. after you interrupted a turn, which fires no "done"); it
#            leaves "done" and "waiting" alone.
#   clear    The agent has gone (session ended): remove the marker.
#
# Currently wired up for claude (see claude/settings.json, which is JSON and so
# cannot carry comments):
#   Hook                             -> state    When claude fires it
#   UserPromptSubmit                 -> working  You send a prompt
#   PostToolUse                      -> working  A tool ran, so a prompt was answered
#   Notification (permission_prompt, -> waiting  Needs a decision from you
#                 elicitation_dialog)
#   Notification (idle_prompt)       -> idle     Sat at the prompt for a while
#   Stop                             -> done     Finished its turn
#   SessionEnd                       -> clear    claude exited
#
# And for opencode, by agents/plugins/tmux-agent-state.js.
#
# Pane detection in the M-c popup (get-agent-tmux-panes) takes the agent names
# as a regex argument.
#
# The state is read back by:
#   - window-status-format and window-status-current-format in .tmux.conf (the
#     status bar markers)
#   - get-agent-tmux-panes in functions.zsh (the M-c popup)
# and "done" is cleared by the tmux hooks in .tmux.conf when you visit the pane.
#
# If you are already looking at the pane (it is the active pane of the active
# window, and a client attached to the session has terminal focus) there is
# nothing to be told: "done" is dropped
# and "waiting" is recorded as "working", as the agent is still mid-turn. Being on
# the window but in a different pane does not count: you would miss the signal.
##

# tmux exports TMUX_PANE into every pane. It is how we know which pane this
# agent is running in, even if you are looking at a different one. If it is
# empty we are not inside tmux, so there is nothing to do.
[ -n "${TMUX_PANE}" ] || exit 0

state="${1}"

case "${state}" in
    working | waiting | done | idle | clear) ;;
    *)
        echo "usage: ${0##*/} working|waiting|done|idle|clear" >&2
        exit 2
        ;;
esac

# set -u unsets the option, so no stale marker is left behind.
unset_state() {
    tmux set -p -u -t "${TMUX_PANE}" @agent 2>/dev/null || true
}

# set -p: a pane option, so each pane has its own state.
# -t:     target our own pane.
# @agent: user options must start with @; tmux stores any value we give it.
set_state() {
    tmux set -p -t "${TMUX_PANE}" @agent "$1"
}

case "${state}" in
    clear)
        unset_state
        ;;
    idle)
        # show -pv prints just the value of the pane option (and errors if unset).
        if [ "$(tmux show -pv -t "${TMUX_PANE}" @agent 2>/dev/null)" = "working" ]; then
            unset_state
        fi
        ;;
    working)
        # Fires on every tool call; skip the writes when nothing changes.
        if [ "$(tmux show -pv -t "${TMUX_PANE}" @agent 2>/dev/null)" != "working" ]; then
            set_state working
        else
            exit 0
        fi
        ;;
    waiting | done)
        # pane_active:      1 if this is the selected pane within its window
        # window_active:    1 if this is the window selected in its session
        # session_attached: number of clients attached to the session (0 = detached)
        # #{&&:a,b} is true when both are non-zero, so all three must hold for you
        # to be able to see this pane right now ("1" if so, "0" if not).
        visible=$(tmux display -p -t "${TMUX_PANE}" '#{&&:#{&&:#{pane_active},#{window_active}},#{session_attached}}')
        # An attached client is not enough: with the terminal in the background you
        # are not looking. client_flags includes "focused" (needs focus-events on)
        # for a client whose terminal has focus.
        if [ "${visible}" = "1" ] && ! tmux list-clients -t "${TMUX_PANE}" -F '#{client_flags}' 2>/dev/null | grep -q focused; then
            visible=0
        fi
        if [ "${visible}" != "1" ]; then
            set_state "${state}"
        elif [ "${state}" = "waiting" ]; then
            # You can see the prompt; the agent carries on once you answer.
            set_state working
        else
            unset_state
        fi
        ;;
esac

# The status bar only redraws on its interval or a client event. Ask for a redraw
# now; there may be no client to refresh (detached), which is fine.
tmux refresh-client -S 2>/dev/null || true
