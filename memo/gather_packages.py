#!/usr/bin/env python3
"""
Package Gatherer Script
This script gathers all packages that the repository author is interested in
from various package managers and outputs them in a structured format.
"""

import json
import os
import re
from pathlib import Path
from typing import Dict, List, Set


def read_lines(filepath: Path) -> List[str]:
    """Read non-empty lines from a file, stripping whitespace."""
    if not filepath.exists():
        return []
    with open(filepath, 'r', encoding='utf-8') as f:
        return [line.strip() for line in f if line.strip() and not line.strip().startswith('#')]


def gather_pacman_packages() -> Dict[str, List[str]]:
    """Gather all pacman packages from various package lists."""
    base_path = Path(__file__).parent / 'pacman'
    
    packages = {
        'core': read_lines(base_path / 'packages.txt'),
        'external': read_lines(base_path / 'packages_external.txt'),
        'optional': read_lines(base_path / 'packages_optional.txt'),
        'ctf': read_lines(base_path / 'packages_ctf.txt'),
        'gui': read_lines(base_path / 'packages_gui.txt'),
    }
    
    return packages


def gather_python_packages() -> List[str]:
    """Gather Python packages from requirements.txt."""
    filepath = Path(__file__).parent / 'requirements.txt'
    return read_lines(filepath)


def gather_npm_packages() -> Dict[str, str]:
    """Gather NPM packages from npm_global_packages.json."""
    filepath = Path(__file__).parent / 'npm' / 'npm_global_packages.json'
    
    if not filepath.exists():
        return {}
    
    with open(filepath, 'r', encoding='utf-8') as f:
        data = json.load(f)
    
    packages = {}
    if 'dependencies' in data:
        for pkg, info in data['dependencies'].items():
            if isinstance(info, dict) and 'version' in info:
                packages[pkg] = info['version']
            else:
                packages[pkg] = str(info)
    
    return packages


def gather_vscode_extensions() -> List[str]:
    """Gather VSCode extensions from extensions.txt."""
    filepath = Path(__file__).parent / 'vscode' / 'extensions.txt'
    return read_lines(filepath)


def gather_cargo_packages() -> List[str]:
    """Gather Cargo packages from setup.md."""
    filepath = Path(__file__).parent / 'setup.md'
    
    if not filepath.exists():
        return []
    
    packages = []
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # Find cargo install commands
    cargo_matches = re.findall(r'cargo install\s+([a-zA-Z0-9_-]+)', content)
    packages.extend(cargo_matches)
    
    return packages


def gather_gem_packages() -> List[str]:
    """Gather Ruby Gem packages from setup.md."""
    filepath = Path(__file__).parent / 'setup.md'
    
    if not filepath.exists():
        return []
    
    packages = []
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # Find gem install commands
    gem_matches = re.findall(r'gem install\s+([a-zA-Z0-9_-]+(?:\s+[a-zA-Z0-9_-]+)*)', content)
    for match in gem_matches:
        packages.extend(match.split())
    
    return packages


def gather_nimble_packages() -> List[str]:
    """Gather Nimble packages from setup.md."""
    filepath = Path(__file__).parent / 'setup.md'
    
    if not filepath.exists():
        return []
    
    packages = []
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # Find nimble install commands
    nimble_matches = re.findall(r'nimble install\s+([a-zA-Z0-9_-]+)', content)
    packages.extend(nimble_matches)
    
    return packages


def gather_uv_tools() -> List[str]:
    """Gather uv tool packages from setup.md."""
    filepath = Path(__file__).parent / 'setup.md'
    
    if not filepath.exists():
        return []
    
    tools = []
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # Find uv tool install commands
    # Match both regular packages and git URLs
    uv_matches = re.findall(r'uv tool install\s+(.+)', content)
    for match in uv_matches:
        tools.append(match.strip())
    
    return tools


def main():
    """Main function to gather and display all packages."""
    print("=" * 80)
    print("PACKAGE GATHERER - Repository Author's Interests")
    print("=" * 80)
    print()
    
    all_packages = {}
    
    # Gather Pacman packages
    print("[1/8] Gathering Pacman packages...")
    pacman = gather_pacman_packages()
    all_packages['pacman'] = pacman
    total_pacman = sum(len(pkgs) for pkgs in pacman.values())
    print(f"  ✓ Found {total_pacman} Pacman packages across {len(pacman)} categories")
    
    # Gather Python packages
    print("[2/8] Gathering Python packages...")
    python = gather_python_packages()
    all_packages['python'] = python
    print(f"  ✓ Found {len(python)} Python packages")
    
    # Gather NPM packages
    print("[3/8] Gathering NPM packages...")
    npm = gather_npm_packages()
    all_packages['npm'] = npm
    print(f"  ✓ Found {len(npm)} NPM packages")
    
    # Gather VSCode extensions
    print("[4/8] Gathering VSCode extensions...")
    vscode = gather_vscode_extensions()
    all_packages['vscode_extensions'] = vscode
    print(f"  ✓ Found {len(vscode)} VSCode extensions")
    
    # Gather Cargo packages
    print("[5/8] Gathering Cargo packages...")
    cargo = gather_cargo_packages()
    all_packages['cargo'] = cargo
    print(f"  ✓ Found {len(cargo)} Cargo packages")
    
    # Gather Gem packages
    print("[6/8] Gathering Ruby Gem packages...")
    gems = gather_gem_packages()
    all_packages['gem'] = gems
    print(f"  ✓ Found {len(gems)} Ruby Gem packages")
    
    # Gather Nimble packages
    print("[7/8] Gathering Nimble packages...")
    nimble = gather_nimble_packages()
    all_packages['nimble'] = nimble
    print(f"  ✓ Found {len(nimble)} Nimble packages")
    
    # Gather uv tools
    print("[8/8] Gathering uv tool packages...")
    uv_tools = gather_uv_tools()
    all_packages['uv_tools'] = uv_tools
    print(f"  ✓ Found {len(uv_tools)} uv tool packages")
    
    print()
    print("=" * 80)
    print("SUMMARY")
    print("=" * 80)
    print()
    
    # Calculate total packages
    total = (
        total_pacman +
        len(python) +
        len(npm) +
        len(vscode) +
        len(cargo) +
        len(gems) +
        len(nimble) +
        len(uv_tools)
    )
    
    print(f"Total packages across all package managers: {total}")
    print()
    
    # Save to JSON file
    output_file = Path(__file__).parent / 'all_packages.json'
    with open(output_file, 'w', encoding='utf-8') as f:
        json.dump(all_packages, f, indent=2, ensure_ascii=False)
    
    print(f"✓ Package list saved to: {output_file}")
    print()
    
    # Display breakdown
    print("Package breakdown by manager:")
    print(f"  • Pacman (core):      {len(pacman.get('core', []))}")
    print(f"  • Pacman (external):  {len(pacman.get('external', []))}")
    print(f"  • Pacman (optional):  {len(pacman.get('optional', []))}")
    print(f"  • Pacman (CTF):       {len(pacman.get('ctf', []))}")
    print(f"  • Pacman (GUI):       {len(pacman.get('gui', []))}")
    print(f"  • Python (pip/uv):    {len(python)}")
    print(f"  • NPM (global):       {len(npm)}")
    print(f"  • VSCode extensions:  {len(vscode)}")
    print(f"  • Cargo (Rust):       {len(cargo)}")
    print(f"  • Gem (Ruby):         {len(gems)}")
    print(f"  • Nimble (Nim):       {len(nimble)}")
    print(f"  • uv tools:           {len(uv_tools)}")
    print()
    
    # Display top categories
    print("Main interest areas based on packages:")
    interests = set()
    
    # Analyze package names for interests
    all_package_names = []
    for category in pacman.values():
        all_package_names.extend(category)
    all_package_names.extend(python)
    all_package_names.extend(npm.keys())
    all_package_names.extend(cargo)
    all_package_names.extend(gems)
    
    # Look for common themes
    if any('git' in pkg.lower() for pkg in all_package_names):
        interests.add("Git/Version Control")
    if len(pacman.get('ctf', [])) > 0 or any('pwn' in pkg.lower() or 'gdb' in pkg.lower() for pkg in all_package_names):
        interests.add("CTF/Security/Reverse Engineering")
    if any('docker' in pkg.lower() or 'podman' in pkg.lower() for pkg in all_package_names):
        interests.add("Containers/Virtualization")
    if any('python' in pkg.lower() or 'py' in pkg.lower() for pkg in all_package_names):
        interests.add("Python Development")
    if any('rust' in pkg.lower() or 'cargo' in pkg.lower() for pkg in all_package_names):
        interests.add("Rust Development")
    if any('go' in pkg.lower() or 'golang' in pkg.lower() for pkg in all_package_names):
        interests.add("Go Development")
    if any('vim' in pkg.lower() or 'neovim' in pkg.lower() or 'helix' in pkg.lower() for pkg in all_package_names):
        interests.add("Text Editors/IDEs")
    if any('latex' in pkg.lower() or 'tex' in pkg.lower() or 'typst' in pkg.lower() for pkg in all_package_names):
        interests.add("Document Typesetting")
    if len(vscode) > 0:
        interests.add("VSCode/VSCodium Development")
    
    for interest in sorted(interests):
        print(f"  ⭐ {interest}")
    
    print()
    print("=" * 80)


if __name__ == '__main__':
    main()
