#!/bin/bash

echo "Copying DocC archives to doc_archives..."

mkdir docs

$(xcrun --find docc) process-archive transform-for-static-hosting "doc_archives/TruePlan.doccarchive" --hosting-base-path DocC --output-path docs

git config user.name "rahulnarang021"

git config user.email "rahulnarang021@gmail.com"

# Change the GitHub URL to your repository
git remote set-url origin https://rahulnarang021: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@github.com/rahulnarang021/DocC

git fetch

git stash push -u  -- docs

git checkout main

rm -rf docs

git stash apply

git add docs

git commit -m "Updated DocC documentation"

git push --set-upstream origin main
