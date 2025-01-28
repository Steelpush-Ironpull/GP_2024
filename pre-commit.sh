#!/bin/bash

# Find all staged .ipynb files
STAGED_FILES=$(git diff --cached --name-only --diff-filter=ACM | grep '\.ipynb$')

if [ -n "$STAGED_FILES" ]; then
    for FILE in $STAGED_FILES; do
        # Remove output from the notebook
        jupyter nbconvert --ClearOutputPreprocessor.enabled=True --inplace "$FILE"
        # Add the modified file back to the staging area
        git add "$FILE"
    done
fi
