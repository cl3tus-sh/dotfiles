import { Action, ActionPanel, List, showToast, Toast, Icon, Color } from "@raycast/api";
import { useEffect, useState } from "react";
import { exec } from "child_process";
import { promisify } from "util";
import { homedir } from "os";
import { join } from "path";
import { Theme } from "./types";
import { getAvailableThemes, getCurrentTheme } from "./utils";

const execAsync = promisify(exec);

export default function Command() {
  const [themes, setThemes] = useState<Theme[]>([]);
  const [isLoading, setIsLoading] = useState(true);
  const [currentTheme, setCurrentTheme] = useState<string | null>(null);

  useEffect(() => {
    async function loadThemes() {
      try {
        const [availableThemes, current] = await Promise.all([getAvailableThemes(), getCurrentTheme()]);
        setThemes(availableThemes);
        setCurrentTheme(current);
      } catch (error) {
        showToast({
          style: Toast.Style.Failure,
          title: "Failed to load themes",
          message: error instanceof Error ? error.message : "Unknown error",
        });
      } finally {
        setIsLoading(false);
      }
    }

    loadThemes();
  }, []);

  async function switchTheme(theme: Theme) {
    const toast = await showToast({
      style: Toast.Style.Animated,
      title: `Switching to ${theme.name}...`,
    });

    try {
      const scriptPath = join(homedir(), ".local", "bin", "set-theme");
      await execAsync(`"${scriptPath}" "${theme.name}"`);

      toast.style = Toast.Style.Success;
      toast.title = `Theme switched to ${theme.name}`;
      setCurrentTheme(theme.name);
    } catch (error) {
      toast.style = Toast.Style.Failure;
      toast.title = "Failed to switch theme";
      toast.message = error instanceof Error ? error.message : "Unknown error";
    }
  }

  return (
    <List isLoading={isLoading} searchBarPlaceholder="Search themes...">
      {themes.map((theme) => {
        const isCurrent = currentTheme === theme.name;
        return (
          <List.Item
            key={theme.name}
            icon={{
              source: theme.wallpaperPath,
              fallback: Icon.Image,
            }}
            title={theme.name}
            accessories={
              isCurrent
                ? [
                    {
                      tag: { value: "Current", color: Color.Green },
                    },
                  ]
                : []
            }
            actions={
              <ActionPanel>
                <Action title="Switch Theme" onAction={() => switchTheme(theme)} icon={Icon.CheckCircle} />
                <Action.ShowInFinder path={theme.path} />
                <Action.CopyToClipboard
                  title="Copy Wallpaper Path"
                  content={theme.wallpaperPath}
                  shortcut={{ modifiers: ["cmd"], key: "c" }}
                />
              </ActionPanel>
            }
          />
        );
      })}
    </List>
  );
}
