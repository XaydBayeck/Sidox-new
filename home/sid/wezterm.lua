-- Add config folder to watchlist for config reloads.
local wezterm = require 'wezterm'
wezterm.add_to_config_reload_watch_list(wezterm.config_dir)

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices
config.font = wezterm.font 'Hurmit Nerd Font'
config.color_scheme = 'Tokyo Night Storm'
config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 0.85

config.launch_menu = {
  {
    args = { 'top' },
  },
  {
    label = 'Bash',
    args = { 'bash', '-l' },
  },
  {
    label = 'fish',
    args = { 'fish' },
  },
  {
    label = 'nushell',
    args = { 'nu' },
  },
  {
    label = 'nix repl',
    args = { 'nix', 'repl', '-I', 'nixpkgs=flake:nixpkgs' }
  },
  {
    label = 'julia',
    args = {'julia'},
  }
}

-- and finally, return the configuration to wezterm
return config
