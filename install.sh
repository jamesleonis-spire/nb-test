#!/bin/sh

git_hooks=$(find . ! -path "*.git*" -iname "*.hook*")

for hook in $git_hooks; do
  target=$(echo $hook | sed -r "s:.*/(.*).hook.*$:./.git/hooks/\1:")
  echo "Installing $target..."
  rm -rf $target
  cp $hook $target
done
