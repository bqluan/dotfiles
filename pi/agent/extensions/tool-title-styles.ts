import type { ExtensionAPI, Theme, ThemeColor } from "@earendil-works/pi-coding-agent";
import { Text } from "@earendil-works/pi-tui";

const toolStyles: readonly [tool: string, style: ThemeColor | "plain"][] = [
	["bash", "plain"],
	["powershell", "plain"],
	["find", "plain"],
	["grep", "plain"],
	["ls", "plain"],
	["edit", "success"],
	["write", "success"],
	["read", "mdLink"],
];

// Bash uses the shared theme directly, so remove bold from its rendered title text.
class CommandTitle extends Text {
	override setText(text: string): void {
		super.setText(text.replace(/\x1b\[(?:1|22)m/g, ""));
	}
}

function titleTheme(theme: Theme, title: ThemeColor, plain: boolean): Theme {
	return Object.create(theme, {
		fg: {
			value(color: ThemeColor, text: string) {
				if (color === "toolTitle" || (plain && (color === "accent" || color === "toolOutput"))) {
					return theme.fg(title, text);
				}
				return theme.fg(color, text);
			},
		},
	});
}

export default function (pi: ExtensionAPI) {
	pi.registerToolRenderer((name, next) => {
		const renderer = next();
		const style = toolStyles.find(([tool]) => tool === name)?.[1];
		if (!renderer?.renderCall || !style) return renderer;
		const plain = style === "plain";
		const title = plain ? "toolTitle" : style;
		const { renderCall, renderResult } = renderer;

		return {
			...renderer,
			renderCall(args, theme, context) {
				if (plain && !(context.lastComponent instanceof CommandTitle)) {
					context = { ...context, lastComponent: new CommandTitle("", 0, 0) };
				}
				return renderCall.call(renderer, args, titleTheme(theme, title, plain), context);
			},
			// Edit can rebuild the header when its diff arrives.
			...(name === "edit" && renderResult && {
				renderResult(result, options, theme, context) {
					return renderResult.call(renderer, result, options, titleTheme(theme, title, false), context);
				},
			}),
		};
	});
}
