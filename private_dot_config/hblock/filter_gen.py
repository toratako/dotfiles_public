KDROIDWIN_UBLACKLIST_FILTER_URL = "https://raw.githubusercontent.com/Kdroidwin/uBlacklist-filter-by-kdroidwin/refs/heads/main/uBlacklist.txt"


def download_kdroidwin_filter():
    import urllib.request

    print("[*] Downloading uBlacklist filter by Kdroidwin...")
    response = urllib.request.urlopen(KDROIDWIN_UBLACKLIST_FILTER_URL)
    data = response.read().decode("utf-8")
    with open("./plsignorethx_ublacklist_kdroidwin.txt", "w") as f:
        _ = f.write(data)
    print("[*] uBlacklist filter by Kdroidwin has been saved.")


def create_krdoidwin_filter():
    print("[*] Creating Kdroidwin DNS blocklist...")
    with open("./plsignorethx_ublacklist_kdroidwin.txt", "r") as f:
        data = f.read()

    new_filter = []
    lines = data.splitlines()
    for line in lines:
        if not line.startswith("*://") or not line.endswith("/*"):
            continue
        pattern = line[len("*://") : -len("/*")]
        # Check valid domain pattern (not a glob pattern) and not path
        ignores = ["*", "?", "[", "]", "/"]
        if any(char in pattern for char in ignores):
            continue
        domain = pattern.split("/")[0]
        new_filter.append(f"0.0.0.0 {domain}")

    # remove dupes
    new_filter_final = "# Based on: https://github.com/Kdroidwin/uBlacklist-filter-by-kdroidwin/tree/main\n# LICENSE: AGPL-3.0\n\n"
    new_filter_final += "\n".join(sorted(set(new_filter))) + "\n"

    with open("./plsignorethx_kdroidwin_dns_blocklist.txt", "w") as f:
        _ = f.write(new_filter_final)

    print("[*] Kdroidwin DNS blocklist has been created.")


def create_final_filter():
    import os

    print("[*] Creating final combined DNS blocklist...")
    input_files = [
        "./deny_base.list",
        "./deny_personal.list",
        "./plsignorethx_kdroidwin_dns_blocklist.txt",
    ]
    final_filter = "# Combined DNS Blocklist.\n# Search `LICENSE` to see individual licenses.\n\n"
    for file in input_files:
        if not os.path.exists(file):
            continue
        with open(file, "r") as f:
            data = f.read()
            final_filter += data + "\n"
    with open("./deny.list", "w") as f:
        _ = f.write(final_filter)
    print("[*] Final combined DNS blocklist has been created.")


def main():
    download_kdroidwin_filter()
    create_krdoidwin_filter()
    create_final_filter()


if __name__ == "__main__":
    main()
