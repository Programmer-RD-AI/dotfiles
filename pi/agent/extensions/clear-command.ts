import type { ExtensionAPI } from "@earendil-works/pi-coding-agent";

export default function (pi: ExtensionAPI) {
  pi.registerCommand("clear", {
    description: "Clear the conversation and start fresh",
    handler: async (_args, ctx) => {
      const parentSession = ctx.sessionManager.getSessionFile();
      await ctx.newSession({ parentSession });
    },
  });
}
