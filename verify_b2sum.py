#!/usr/bin/env python3

import hashlib
import sys
from pathlib import Path


def verify_b2sum(checkfile):
    failed = False

    with open(checkfile, "r", encoding="utf-8") as f:
        for line in f:
            line = line.strip()

            if not line:
                continue

            expected, filename = line.split(maxsplit=1)
            filename = filename.lstrip("*")

            path = Path(filename)

            if not path.exists():
                print(f"{filename}: MISSING")
                failed = True
                continue

            h = hashlib.blake2b()

            with open(path, "rb") as file:
                for chunk in iter(lambda: file.read(1024 * 1024), b""):
                    h.update(chunk)

            actual = h.hexdigest()

            if actual == expected:
                print(f"{filename}: OK")
            else:
                print(f"{filename}: FAILED")
                failed = True

    return not failed


if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: verify_b2sum.py B2SUM")
        sys.exit(1)

    sys.exit(0 if verify_b2sum(sys.argv[1]) else 1)