from pathlib import Path

home = Path.home()
curr = Path.cwd()

# files going into ~/.config
config: list[str] = [
    'clangd',
    'eza',
    'fastfetch',
    'nvim',
    'starship',
]

# custom ones
custom: dict[Path | str, Path | str] = {
    curr / '/zsh/config/.zshenv': home / '.zshenv'
}

configDir = home / '.config'
configDir.mkdir(exist_ok=True)

# _from -> _to
def symlink(src: Path, dst: Path):
    if not src.exists():
        print(f"WARNING: {src} doesn't exist")
        return

    if dst.exists():
        print(f"WARNING: {dst} already exists", "(already a symlink)" if dst.is_symlink() else "")
        return

    dst.symlink_to(src, src.is_dir())
    print(f'{src} -> {dst}')

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
