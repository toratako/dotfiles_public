# Package Inventory

This directory contains comprehensive package lists that represent the repository author's interests and software preferences.

## 📦 Package Sources

### System Packages (Pacman)
Located in `pacman/` directory:
- **`packages.txt`** - Core system packages (120 packages)
- **`packages_external.txt`** - External/AUR packages (10 packages)
- **`packages_optional.txt`** - Optional packages (16 packages)
- **`packages_ctf.txt`** - CTF and security tools (37 packages)
- **`packages_gui.txt`** - GUI applications (36 packages)

### Programming Languages
- **`requirements.txt`** - Python packages (47 packages)
- **`npm/npm_global_packages.json`** - NPM global packages (23 packages)

### Development Tools
- **`vscode/extensions.txt`** - VSCode extensions (39 packages)
- **Cargo packages** - Listed in `setup.md` (1 package)
- **Ruby Gems** - Listed in `setup.md` (11 packages)
- **Nimble packages** - Listed in `setup.md` (1 package)
- **uv tools** - Listed in `setup.md` (3 packages)

## 🔍 Package Gatherer Tool

The `gather_packages.py` script consolidates all packages from different sources into a single, structured JSON file.

### Usage

Run the script to generate a complete package inventory:

```bash
python3 memo/gather_packages.py
```

This will:
1. Scan all package list files
2. Extract packages from various sources
3. Generate `all_packages.json` with the complete inventory
4. Display a summary with statistics and interest areas

### Output

The script generates `all_packages.json` containing:

```json
{
  "pacman": {
    "core": [...],
    "external": [...],
    "optional": [...],
    "ctf": [...],
    "gui": [...]
  },
  "python": [...],
  "npm": {...},
  "vscode_extensions": [...],
  "cargo": [...],
  "gem": [...],
  "nimble": [...],
  "uv_tools": [...]
}
```

### Statistics (as of last run)

- **Total packages**: 344
- **Pacman packages**: 219 (across 5 categories)
- **Python packages**: 47
- **NPM packages**: 23
- **VSCode extensions**: 39
- **Other tools**: 16

## 🎯 Interest Areas

Based on the package analysis, the main interest areas include:

- 🔒 **CTF/Security/Reverse Engineering** - Extensive security and reverse engineering toolkit
- 🐳 **Containers/Virtualization** - Docker, Podman, libvirt, QEMU
- 📝 **Document Typesetting** - LaTeX, Typst, pandoc
- 🔧 **Git/Version Control** - Multiple Git extensions and tools
- 🐹 **Go Development** - Go toolchain and language server
- 🐍 **Python Development** - Comprehensive Python ecosystem
- 🦀 **Rust Development** - Rust toolchain and related tools
- ✏️ **Text Editors/IDEs** - Vim, Helix, VSCodium
- 💻 **VSCode/VSCodium Development** - 39 extensions for enhanced productivity

## 📋 Installation

To install packages from specific lists:

### Pacman packages
```bash
yay --needed -S - < memo/pacman/packages.txt
```

### Python packages
```bash
uv pip install --system -r memo/requirements.txt
```

### NPM packages
```bash
cd memo/npm && ./npm_import.sh
```

### VSCode extensions
Install extensions listed in `memo/vscode/extensions.txt` using VSCode/VSCodium's extension manager.

## 🔄 Updating Package Lists

To update package lists:

### Export NPM packages
```bash
cd memo/npm && ./npm_export.sh
```

### Export Pacman packages
```bash
pacman -Qqe > memo/pacman/packages.txt
```

### Export Python packages
```bash
uv pip freeze > memo/requirements.txt
```

### Export VSCode extensions
```bash
codium --list-extensions > memo/vscode/extensions.txt
```

## 📚 References

For detailed setup instructions, see [`setup.md`](./setup.md).
