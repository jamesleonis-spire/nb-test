#!/bin/sh

[ -z $ZEPPELIN_GITHUB_REPO ] && ZEPPELIN_GITHUB_REPO="git@github.com:jamesleonis-spire/nb-test.git"
[ -z $GIT_LOG_FILE ] && GIT_LOG_FILE="/var/data/zeppelin/logs/zeppelin-git-output.log"

# Redirect output to a log file. This allows us to debug this script in production.
touch $GIT_LOG_FILE
exec 1>$GIT_LOG_FILE
exec 2>&1

echo "--- $(date) ---"
echo "Starting GIT push from commit"

# If the Remote Origin is missing, we set it here.
if [ -z "$(git remote)" ]; then
  echo "Remote GIT repository not initialized. Establishing..."
  git remote add origin $ZEPPELIN_GITHUB_REPO
  echo "Remote established to: $ZEPPELIN_GITHUB_REPO"
fi

echo "Pushing changes to Github..."

git push origin master

echo "Finished pushing to Github."
