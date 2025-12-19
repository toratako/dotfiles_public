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


def _read_setup_md() -> str:
    """Read the setup.md file once for all extractors."""
    filepath = Path(__file__).parent / 'setup.md'
    if not filepath.exists():
        return ""
    with open(filepath, 'r', encoding='utf-8') as f:
        return f.read()


def gather_cargo_packages(setup_content: str = None) -> List[str]:
    """Gather Cargo packages from setup.md."""
    if setup_content is None:
        setup_content = _read_setup_md()
    
    if not setup_content:
        return []
    
    # Find cargo install commands - allow dots and more characters in package names
    cargo_matches = re.findall(r'cargo install\s+(\S+)', setup_content)
    return cargo_matches


def gather_gem_packages(setup_content: str = None) -> List[str]:
    """Gather Ruby Gem packages from setup.md."""
    if setup_content is None:
        setup_content = _read_setup_md()
    
    if not setup_content:
        return []
    
    packages = []
    for line in setup_content.split('\n'):
        line = line.strip()
        if line.startswith('gem install'):
            # Extract package names after 'gem install'
            parts = line.split('gem install', 1)
            if len(parts) > 1:
                pkg_names = parts[1].strip().split()
                packages.extend(pkg_names)
    
    return packages


def gather_nimble_packages(setup_content: str = None) -> List[str]:
    """Gather Nimble packages from setup.md."""
    if setup_content is None:
        setup_content = _read_setup_md()
    
    if not setup_content:
        return []
    
    # Find nimble install commands - allow dots and more characters in package names
    nimble_matches = re.findall(r'nimble install\s+(\S+)', setup_content)
    return nimble_matches


def gather_uv_tools(setup_content: str = None) -> List[str]:
    """Gather uv tool packages from setup.md."""
    if setup_content is None:
        setup_content = _read_setup_md()
    
    if not setup_content:
        return []
    
    # Find uv tool install commands - match both regular packages and git URLs
    uv_matches = re.findall(r'uv tool install\s+(.+)', setup_content)
    return [match.strip() for match in uv_matches]


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
    
    # Read setup.md once for all extractors
    setup_content = _read_setup_md()
    
    # Gather Cargo packages
    print("[5/8] Gathering Cargo packages...")
    cargo = gather_cargo_packages(setup_content)
    all_packages['cargo'] = cargo
    print(f"  ✓ Found {len(cargo)} Cargo packages")
    
    # Gather Gem packages
    print("[6/8] Gathering Ruby Gem packages...")
    gems = gather_gem_packages(setup_content)
    all_packages['gem'] = gems
    print(f"  ✓ Found {len(gems)} Ruby Gem packages")
    
    # Gather Nimble packages
    print("[7/8] Gathering Nimble packages...")
    nimble = gather_nimble_packages(setup_content)
    all_packages['nimble'] = nimble
    print(f"  ✓ Found {len(nimble)} Nimble packages")
    
    # Gather uv tools
    print("[8/8] Gathering uv tool packages...")
    uv_tools = gather_uv_tools(setup_content)
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
    
    # Look for common themes using more precise matching
    if any('git' in pkg.lower() for pkg in all_package_names):
        interests.add("Git/Version Control")
    if len(pacman.get('ctf', [])) > 0 or any('pwn' in pkg.lower() or 'gdb' in pkg.lower() for pkg in all_package_names):
        interests.add("CTF/Security/Reverse Engineering")
    if any('docker' in pkg.lower() or 'podman' in pkg.lower() for pkg in all_package_names):
        interests.add("Containers/Virtualization")
    # More precise Python detection
    if len(python) > 0 or any(pkg.lower().startswith('python') or pkg.lower().startswith('py-') for pkg in all_package_names):
        interests.add("Python Development")
    if any('rust' in pkg.lower() or pkg.lower() == 'rustup' for pkg in all_package_names) or len(cargo) > 0:
        interests.add("Rust Development")
    # More precise Go detection - check for exact matches or specific packages
    if any(pkg.lower() in ['go', 'gopls'] or pkg.lower().startswith('go-') for pkg in all_package_names):
        interests.add("Go Development")
    # More precise editor detection using word boundaries
    if any(pkg.lower() in ['vim', 'neovim', 'helix'] for pkg in all_package_names):
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
