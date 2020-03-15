#!/bin/sh
#
# devcrate
# Base image dockerfile
# entrypoint script
#

# configure git
if [ -n "$GIT_FULLNAME" ]
then
    git config --global user.name "$GIT_FULLNAME"
fi

if [ -n "$GIT_EMAIL" ]
then
    git config --global user.name "$GIT_EMAIL"
fi

# run command
exec "$@"
