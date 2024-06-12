#!/bin/bash

function git_cat_gitignores() {
    rm -f .gitignore # Remove the existing .gitignore file if it exists
    for file in $(ls .gitignore.d/*.gitignore | sort); do
        echo "################################################################################" >> .gitignore
        echo "## $(basename "$file")" >> .gitignore # Add the filename as a comment
        echo "################################################################################" >> .gitignore
        cat "$file" >> .gitignore
        echo "" >> .gitignore # Add a new line after the contents of each file
    done
}
git_cat_gitignores

## EOF
