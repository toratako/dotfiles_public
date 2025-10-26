#!/usr/bin/env python3

from pwn import *
import os
import struct

REMOTE_SERVER = None
REMOTE_PORT = None
X86 = False

{bindings}

context.binary = {bin_name}
context.terminal = ["tmux", "splitw", "-h"]
# context.log_level = "debug"

# rop = ROP(context.binary)
# rop_libc = ROP(libc)

# --------------------


def attack(r, **kwargs):
    pass


# --------------------


def conn():
    if args.X86 or X86:
        context.arch = "i386"
    else:
        context.arch = "amd64"

    if args.REMOTE:
        r = remote(
            os.environ.get("HOST", REMOTE_SERVER),
            int(os.environ.get("PORT", REMOTE_PORT)),
        )
    else:
        print(f"\033[31m!!!WARNING!!!\nRUNNING ON LOCAL\033[0m")
        r = process({proc_args})
        if args.GDB:
            gdbscript = """
            b main
            c
            """
            gdb.attach(r, gdbscript=gdbscript)
    return r


def main():
    r = conn()
    attack(r)
    context.log_level = "info"
    r.interactive()


if __name__ == "__main__":
    main()
