from pathlib import Path

home = Path.home()
curr = Path.cwd()

# files going into ~/.config
config = [
    'clangd',
    'eza',
    'fastfetch',
    'hypr',
    'kitty',
    'nvim',
    'starship',
    'waybar',
    'swaync',
    'wofi',
    'yazi',
]

# custom ones
custom: dict[Path | str, Path | str] = {
    './zsh/config/.zshenv': home / '.zshenv'
}

configDir = home / '.config'
configDir.mkdir(exist_ok=True)

# _from -> _to
def symlink(_from: Path, _to: Path):
    if not _from.exists():
        print(f"WARNING: {_from} doesn't exist")
        return

    if _to.exists():
        print(f"WARNING: {_to} already exists", "(already a symlink)" if _to.is_symlink() else "")
        return

    _to.symlink_to(_from, _from.is_dir())
    print(f'{_from} -> {_to}')

for config_dir in config:
    curr_dir = curr / config_dir
    config_dir = configDir / config_dir
    
    symlink(curr_dir, config_dir)

for (_from, _to) in custom.items():
    if not isinstance(_from, Path):
        _from = Path(_from)
    if not isinstance(_to, Path):
        _to = Path(_to)
    
    symlink(_from, _to)
