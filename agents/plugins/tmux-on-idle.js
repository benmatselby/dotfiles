/**
 * tmux-on-idle plugin
 *
 * Fires a tmux display-message when an OpenCode session becomes idle
 * (i.e. the "session.idle" event fires), so it's clear which session
 * is waiting for input.
 *
 * Only runs when inside a tmux session (process.env.TMUX is set).
 */
export const TmuxOnIdlePlugin = async ({ client, $ }) => {
  if (!process.env.TMUX) {
    return {};
  }

  return {
    event: async ({ event }) => {
      if (event.type !== "session.idle") {
        return;
      }

      try {
        const sessionID = event.properties.sessionID;
        const session = await client.session.get({ path: { id: sessionID } });
        const title = session?.data?.title || sessionID;

        await $`tmux display-message ${`opencode idle: "${title}" (session ${sessionID})`}`;
      } catch (error) {
      }
    },
  };
};
