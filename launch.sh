#!/bin/bash

cd /home/jovyan/
# git reflog requires a name and email if user is not in passwd
# even if you're only cloning
export GIT_COMMITTER_NAME=anonymous
export GIT_COMMITTER_EMAIL=anon@localhost

git clone https://github.com/master-repo-ai/AssignmentMaster.git
cd AssignmentMaster
rm launch.sh

cd ../
rmdir work
rm launch.sh