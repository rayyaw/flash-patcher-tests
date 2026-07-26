#!/usr/bin/env python3

import subprocess
import sys
from pathlib import Path

INPUT_SWF = "sm63.swf"


def run_command(args):
    subprocess.run(args, check=True)


def main():
    cache_dir = Path(".mrom-cache")
    output_dir = Path("output")

    # Create directories if they don't exist
    cache_dir.mkdir(exist_ok=True)
    output_dir.mkdir(exist_ok=True)

    print("Patching base SWF...")
    run_command([
        "flash-patcher",
        "--inputswf",
        INPUT_SWF,
        "--folder",
        "patches",
        "--stagefile",
        "base.stage",
        "--output",
        str(cache_dir / "base.swf"),
        "--xml",
    ])

    print("Building core script...")
    run_command([
        sys.executable,
        "build_core.py",
        "-o",
        str(cache_dir / "core.as"),
        "-d",
        str(output_dir / "help.md"),
    ])

    print("Patching in MROM code...")
    run_command([
        "flash-patcher",
        "--inputswf",
        str(cache_dir / "base.swf"),
        "--folder",
        "patches",
        "--stagefile",
        "inject.stage",
        "--output",
        str(output_dir / "MushROM.swf"),
    ])

    print("Build complete! SWF saved to output/MushROM.swf")


if __name__ == "__main__":
    main()