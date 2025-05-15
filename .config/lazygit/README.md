# Lazygit Configuration (`.config/lazygit`)

This folder contains configuration for [Lazygit](https://github.com/jesseduffield/lazygit), a simple terminal UI for git commands.

## Main File

- `config.yml`: Main configuration file for Lazygit.

## Key Features

- **GUI**: Customizes fonts, icons, and theme colors.
- **Git**: Sets up paging and custom pager (e.g., delta).
- **OS**: Sets default editor (e.g., nvim) and open command.
- **Custom Commands**: Add your own shortcuts and actions. Example:
  - Press `C` in the files view to create a commit with a custom message prompt.

## Example Key Bindings

- `C` (in files view): Create commit with message prompt
- All other keymaps can be customized in `config.yml` under `customCommands`

## Usage

- Run `lazygit` in your terminal.
- Edit `config.yml` to tweak appearance, editor, or add custom commands.

---

**Tip:** See the [Lazygit documentation](https://github.com/jesseduffield/lazygit/blob/master/docs/Config.md) for all available options and key bindings!
