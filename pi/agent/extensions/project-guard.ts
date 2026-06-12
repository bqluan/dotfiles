import type { ExtensionAPI } from "@earendil-works/pi-coding-agent";
import { isToolCallEventType } from "@earendil-works/pi-coding-agent";
import path from "node:path";

export default function (pi: ExtensionAPI) {
  // Directories approved in this session
  const approvedDirs = new Set<string>();

  function isInsideProject(filePath: string, cwd: string): boolean {
    const abs = path.resolve(cwd, filePath);
    const normalizedCwd = path.resolve(cwd);
    return abs.startsWith(normalizedCwd + path.sep) || abs === normalizedCwd;
  }

  function isApprovedDir(filePath: string): boolean {
    for (const dir of approvedDirs) {
      if (filePath.startsWith(dir + path.sep) || filePath === dir) {
        return true;
      }
    }
    return false;
  }

  async function checkPath(
    filePath: string,
    cwd: string,
    ctx: { ui: any }
  ): Promise<{ block?: true; reason?: string }> {
    if (isInsideProject(filePath, cwd)) return {};
    const abs = path.resolve(cwd, filePath);
    if (isApprovedDir(abs)) return {};

    const dir = path.dirname(abs);
    const ok = await ctx.ui.confirm(
      "External file edit",
      `Allow edits to ${dir}?`
    );
    if (!ok) {
      return { block: true, reason: `User denied edit to ${dir}` };
    }
    approvedDirs.add(dir);
    return {};
  }

  pi.on("tool_call", async (event, ctx) => {
    const cwd = ctx.cwd;

    if (isToolCallEventType("write", event)) {
      return await checkPath(event.input.path, cwd, ctx);
    }

    if (isToolCallEventType("edit", event)) {
      return await checkPath(event.input.path, cwd, ctx);
    }
  });
}
