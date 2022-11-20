#!/bin/sh

PROJECT_PATH="/Users/hpcodecraft/Projects/Github/space-bacon/Space Bacon"

# update project
cd $PROJECT_PATH
git checkout website
git merge main --commit --no-edit

# build
cd /Applications/Godot.app/Contents/MacOS/
./Godot "$PROJECT_PATH/project.godot" --export HTML5

# commit & push
cd $PROJECT_PATH
cd ..
git add all
git commit -m 'website update'
git push
