#!/bin/bash

# This script adds a new index page for a tag named by the first argument
# to the script. This is done by copying the template folder and renaming
# the tag variable in it.

#Make sure we have an argument:
if [ -z "$1" ]; then
    echo usage: $0 TAG_NAME
    exit
fi

# copy the folder:
cp -R template "$1"

# fix the tag name in index.html to the new tag name
# serch for "changethis" and replace with argument
sed -i -e "s/changethis/${1}/g" "$1/index.html"

echo "Added an index page for the new tag '$1'"

# Ideas for expanding script:
#  - make it remove all tags, generate a list for all tags on site
#    and make index pages for all of them. See if jekyll runtime
#    can provide such a list
