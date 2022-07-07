#!/bin/bash

echo "Copying DocC archives to doc_archives..."

mkdir public

$(xcrun --find docc) process-archive transform-for-static-hosting "doc_archives/TruePlan.doccarchive" --hosting-base-path DocC --output-path public

git config user.name "rahulnarang021"

git config user.email "rahulnarang021@gmail.com"

# Change the GitHub URL to your repository
git remote set-url origin https://rahulnarang021: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@github.com/rahulnarang021/DocC

git fetch

git stash push -u  -- public doc_archives

git checkout main

rm -rf public doc_archives

git stash apply

git add public doc_archives

git commit -m "Updated DocC documentation"

git push --set-upstream origin main
