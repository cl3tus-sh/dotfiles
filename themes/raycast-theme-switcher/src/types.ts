export interface ThemeConfig {
  name: string;
  wallpaper: string;
  wallpaper_blurred?: string;
}

export interface Theme {
  name: string;
  path: string;
  config: ThemeConfig;
  wallpaperPath: string;
}
