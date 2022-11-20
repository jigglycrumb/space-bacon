#!/bin/sh

PROJECT_PATH="/Users/hpcodecraft/Projects/Github/space-bacon/Space Bacon/project.godot"

# update project
git checkout website
git merge main

# build
/Applications/Godot.app/Contents/MacOS/Godot $PROJECT_PATH --export HTML5

# commit & push
git add all
git commit -m 'website update'
git push
