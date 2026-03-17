/**
 * sound-on-question plugin
 *
 * Plays a macOS system sound when OpenCode asks the user a question
 * (i.e. the "question.asked" event fires).
 *
 * Only runs on macOS (process.platform === "darwin").
 */
export const SoundOnQuestionPlugin = async ({ $ }) => {
  if (process.platform !== "darwin") {
    return {};
  }

  return {
    event: async ({ event }) => {
      if (event.type === "question.asked") {
        try {
          await $`osascript -e 'display notification "AI needs an answer" with title "opencode"'`;
          await $`afplay /System/Library/Sounds/Funk.aiff`;
        } catch (error) {
        }
      }
    },
  };
};
