#!/bin/bash
if [ "$#" -eq 1 ]
then
  student_id=$1
  git config --global user.email "master.repo.ai@gmail.com"
  git config --global user.name "Master Repo"
  cd ../
  key_file="AssignmentMaster/keys/$student_id"
  if [ -f $key_file ]
  then
    chmod 600 $key_file
    eval "$(ssh-agent -s)"
    ssh-add $key_file
    if [ ! -d ~/.ssh ]
    then
      mkdir ~/.ssh
    fi
    ssh-keyscan github.com >> ~/.ssh/known_hosts
    url="git@github.com:master-repo-ai/$student_id.git"
    if [ -d $student_id ]
    then
      cd $student_id
      GIT_SSH_COMMAND="ssh -i ../$key_file" git pull $url master
      cd ../
    else
      GIT_SSH_COMMAND="ssh -i $key_file" git clone $url
    fi
  else
    echo 'Key not found'
  fi
else
  echo 'Insufficient parameter'
fi