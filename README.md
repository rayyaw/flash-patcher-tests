# flash-patcher-tests
Integration tests for Flash Patcher. See https://github.com/rayyaw/flash-patcher

We use integration tests by taking a fixed snapshot of the patches, applying them to the SWFs, and verifying that the generated output and the reference output diff to the same value.

All reference SWFs were generated with Flash Patcher v4.1.3.

## Running locally

Steps to run integration tests locally:

1. Install Flash Patcher.
2. Run `run-all-tests.sh`.
3. If the exit code (query with `echo $?`) is zero, the test was successful.

## Used Patches

### Super Mario 63: MROM

MROM can be found at: https://gitlab.com/GTcreyon/mrom

MROM reference SWF was generated with Flash Patcher v4.1.3.

### Super Mario Flash: Fullgame Hack

SMF Fullgame Hack does not have an open-source home.

SMF Fullgame Hack reference SWF was generated with Flash Patcher v4.1.3.

## Onboarding

Please open an issue at https://github.com/rayyaw/flash-patcher. The issue name should contain the following information:

- Title: The title should start with "Integration Test Onboarding Request: [Your Patch Name]".
- Tags: You should tag your issue with `test`.
- Issue body: You should have a link to the GitHub/GitLab repository with your patches, a link to the base SWF, and instructions on how to run your buildscript if your repository does not already contain a README with this information.

## License

Unless explicitly stated in the dependency git repositories, all files have all rights reserved by their respective authors.
