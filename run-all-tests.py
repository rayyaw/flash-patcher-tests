#!/usr/bin/env python3

import subprocess
from pathlib import Path
import sys


def run_command(args, cwd=None):
    subprocess.run(args, cwd=cwd, check=True)


def main():
    root = Path.cwd()

    print("Flash Patcher Integration Test Runner.")

    # Super Mario 63 - MushROM
    print("Running Super Mario 63 - MushROM integration test.")

    mrom_dir = root / "gtcreyon-mario63-mrom"

    run_command(
        [sys.executable, "build.py"],
        cwd=mrom_dir,
    )

    print("Verifying Super Mario 63 - MushROM files.")

    run_command(
        [sys.executable, "../verify_b2sum.py", "B2SUM"],
        cwd=mrom_dir,
    )

    print("Super Mario 63 - MushROM patching was successful.")

    # Super Mario Flash - Fullgame Hack
    print("Running Super Mario Flash - Fullgame Hack integration test.")
    print("This test should take about 30 seconds.")

    fullgame_dir = root / "rayyaw-marioflash-fullgame"

    run_command(
        [sys.executable, "patch-all.py", "19"],
        cwd=fullgame_dir,
    )

    print("Verifying Super Mario Flash - Fullgame Hack files.")

    run_command(
        [sys.executable, "../verify_b2sum.py", "B2SUM"],
        cwd=fullgame_dir,
    )

    print("Super Mario Flash - Fullgame Hack patching was successful.")


if __name__ == "__main__":
    main()