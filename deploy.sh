#!/bin/sh

echo "Deleting old publication"
rm -rf public
mkdir public
git worktree prune
rm -rf .git/worktrees/public/

echo "Checking out gh-pages branch into public"
git worktree add -B gh-pages public upstream/gh-pages

echo "Removing existing files"
rm -rf public/*

echo "Generating site"
hugo -t loveit

echo "Updating gh-pages branch"
cd public && git add --all && git commit -m "Publishing to gh-pages"

echo "Pushing to github"
git push --all
