#!/bin/bash
# Push to both GitLab and GitHub remotes

echo "Pushing to GitLab..."
git push gitlab main

echo "Pushing to GitHub..."
git push github main

echo "Done! Pushed to both remotes."
