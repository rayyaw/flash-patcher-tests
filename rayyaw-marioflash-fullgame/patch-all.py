#!/usr/bin/env python3

import subprocess
import sys
from pathlib import Path

PATCHER = "flash-patcher"
SWF_FILE_PATH = Path(".")


def main():
    if len(sys.argv) != 2:
        print(f"Usage: {Path(sys.argv[0]).name} [build number]")
        sys.exit(1)

    build_number = sys.argv[1]

    patch_file = Path("noncheat") / "add-build-number.patch"

    # Recreate the patch file
    if patch_file.exists():
        patch_file.unlink()

    patch_file.write_text(
        "\n".join([
            "# Add the build number to the hack. Required for speedrun timer and input display.",
            "add frame_1/DoAction.as end",
            "begin-patch",
            f"_root.build_number = {build_number};",
            "end-patch",
            "",
        ]),
        encoding="utf-8",
    )

    output_swf = f"SMF-Fullgame-Build-{build_number}.swf"

    subprocess.run(
        [
            PATCHER,
            "--inputswf",
            str(SWF_FILE_PATH / "SMF_Base_Hack.swf"),
            "--folder",
            ".",
            "--stagefile",
            "fullgame.stage",
            "--outputswf",
            output_swf,
            "--invalidateCache",
        ],
        check=True,
    )

    print("Patched SMF Fullgame hack")


if __name__ == "__main__":
    main()