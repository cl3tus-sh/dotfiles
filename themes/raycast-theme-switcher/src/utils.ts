import { homedir } from "os";
import { readdir, readFile, stat } from "fs/promises";
import { join, resolve } from "path";
import { Theme, ThemeConfig } from "./types";

const THEMES_DIR = join(homedir(), ".config", "themes");

export async function getAvailableThemes(): Promise<Theme[]> {
  const themes: Theme[] = [];

  try {
    const entries = await readdir(THEMES_DIR);

    for (const entry of entries) {
      const themePath = join(THEMES_DIR, entry);
      const themeJsonPath = join(themePath, "theme.json");

      try {
        const stats = await stat(themePath);
        if (!stats.isDirectory()) continue;

        const configContent = await readFile(themeJsonPath, "utf-8");
        const config: ThemeConfig = JSON.parse(configContent);

        const wallpaperPath = config.wallpaper.startsWith("/")
          ? config.wallpaper
          : resolve(themePath, config.wallpaper);

        themes.push({
          name: entry,
          path: themePath,
          config,
          wallpaperPath,
        });
      } catch (error) {
        console.error(`Failed to load theme ${entry}:`, error);
      }
    }
  } catch (error) {
    console.error("Failed to read themes directory:", error);
  }

  return themes.sort((a, b) => a.name.localeCompare(b.name));
}

export async function getCurrentTheme(): Promise<string | null> {
  // Could be enhanced to track current theme via a state file
  // For now, return null
  return null;
}
