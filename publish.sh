#!/bin/bash

if [[ $(git status -s) ]]
then
    echo "Stopping on account of uncommitted changes in the working directory."
    exit 1;
fi

echo "Clean up worktree/index."
rm -rf public
mkdir public
git worktree prune
rm -rf .git/worktrees/public/

echo "Checking out branch 'gh-pages'"
git worktree add -B gh-pages public origin/gh-pages

echo "Removing existing files."
rm -rf public/*

echo "Generating site w/ Hugo."
hugo

echo "Updating remote."
cd public && git add --all && git commit -m "publish to gh-pages w/ publish.sh"
git push origin gh-pages
