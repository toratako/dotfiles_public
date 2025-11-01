#!/usr/bin/env python3

import os
import struct
import subprocess

from pwn import *

REMOTE_SERVER = None
REMOTE_PORT = None
X86 = False

CONTAINER_NAME = ""
CONTAINER_CHALL_BINARY = ""
CONTAINER_SOCAT_PORT = 12300

{bindings}

context.binary = {bin_name}
context.terminal = ["tmux", "splitw", "-h"]
# context.terminal = ["tmux", "new-window"]
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
        L_REMOTE_SERVER = os.environ.get("REMOTE_SERVER", REMOTE_SERVER)
        L_REMOTE_PORT = os.environ.get("REMOTE_PORT", REMOTE_PORT)
        r = remote(
            L_REMOTE_SERVER,
            int(L_REMOTE_PORT),
        )
    elif CONTAINER_NAME:
        L_CONTAINER_NAME = os.environ.get("CONTAINER_NAME", CONTAINER_NAME)

        L_CONTAINER_CHALL_BINARY = os.environ.get(
            "CONTAINER_CHALL_BINARY", CONTAINER_CHALL_BINARY
        )
        L_CONTAINER_SOCAT_PORT = os.environ.get(
            "CONTAINER_SOCAT_PORT", CONTAINER_SOCAT_PORT
        )

        warn(
            "\033[31m!!!WARNING!!!\nCONNECTING TO CONTAINER SERVICE (LOCAL)\033[0m"
        )
        # socat forks every attach
        r = remote("localhost", int(L_CONTAINER_SOCAT_PORT))

        if args.GDB:
            # Check PID
            pid_cmd = (
                "docker exec "
                + L_CONTAINER_NAME
                + " pidof "
                + L_CONTAINER_CHALL_BINARY
            )
            try:
                pid = (
                    subprocess.check_output(pid_cmd, shell=True)
                    .decode()
                    .strip()
                )
                info("Target PID:", pid)
            except:
                warn("Failed to get PID")
                exit(1)

            # Start gdbserver in container
            command = (
                "docker exec -d -u root "
                + L_CONTAINER_NAME
                + " "
                + "gdbserver :9090 --attach "
                + str(pid)
            )
            _ = os.system(command)

            # Attach gdb from host
            pid = gdb.attach(
                ("0.0.0.0", 9090),
                exe=context.binary.path,
                gdbscript="init-pwndbg",
            )
            info("Container GDB attached.")
            pause()
        return r
    else:  # LOCAL
        warn("\033[31m!!!WARNING!!!\nRUNNING ON LOCAL\033[0m")
        r = process({proc_args})
        if args.GDB:
            # already running cuz we use process(). not gdb.debug (async)
            gdbscript = """
            init-pwndbg
            b main
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
