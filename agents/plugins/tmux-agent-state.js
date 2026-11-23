/**
 * tmux-agent-state plugin
 *
 * Reports what an OpenCode session is doing to tmux, by calling
 * tmux/agent-state.sh (installed at ~/.config/tmux/agent-state.sh), so the status
 * bar markers and the M-c agent popup work for opencode as they do for claude.
 *
 *   session.status (busy)                  -> working
 *   permission.asked / question.asked      -> waiting
 *   permission.replied / question.replied  -> working
 *   session.idle                           -> done
 *   process exit                           -> clear
 *
 * Only runs when inside a tmux pane (process.env.TMUX_PANE is set).
 */
import { spawn, spawnSync } from "node:child_process";

const script = `${process.env.HOME}/.config/tmux/agent-state.sh`;

// Best effort: a missing script or tmux must never break the session.
const setState = (state) => {
  spawn(script, [state], { stdio: "ignore" }).on("error", () => {}).unref();
};

// On exit the event loop is going away, so this one must be synchronous.
const clearState = () => {
  spawnSync(script, ["clear"], { stdio: "ignore" });
};

export const TmuxAgentStatePlugin = async ({ client }) => {
  if (!process.env.TMUX_PANE) {
    return {};
  }

  process.on("exit", clearState);

  // Subagent and auxiliary sessions emit status/idle events too; only the root
  // session reflects whether you are being waited on.
  const rootCache = new Map();
  const isRoot = async (sessionID) => {
    if (!sessionID) return true;
    if (!rootCache.has(sessionID)) {
      try {
        const session = await client.session.get({ path: { id: sessionID } });
        rootCache.set(sessionID, !session?.data?.parentID);
      } catch {
        return true;
      }
    }
    return rootCache.get(sessionID);
  };

  return {
    event: async ({ event }) => {
      if (!(await isRoot(event.properties?.sessionID))) {
        return;
      }

      switch (event.type) {
        case "session.status":
          if (event.properties?.status?.type === "busy") {
            setState("working");
          }
          break;
        case "permission.asked":
        case "question.asked":
          setState("waiting");
          break;
        case "permission.replied":
        case "question.replied":
          setState("working");
          break;
        case "session.idle":
          setState("done");
          break;
      }
    },
  };
};
