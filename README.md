Zeppelin Auto-Push
==================

Allows for GIT-backed Zeppelin notebooks to push their changes to Github.

## Install

Simply run the provided `install.sh` script. It will find all scripts with the `*.hook*` and copy them into the correct place in the repository git folder.

Note that files will have their `hook` and extensions stripped. They are provided for your editor's convenience.

## Running

Runs after every successful commit and pushes the new commit to github.

Optionally, you can provide the following environment variables

* `ZEPPELIN_GITHUB_REPO` - The SSH URL for the Github repository.
* `GIT_LOG_FILE` - The full path of the logging file.

To run manually, simply invoke the script. To invoke with environment variables

    GIT_LOG_FILE="./log.txt" ./post-commit.hook.sh
