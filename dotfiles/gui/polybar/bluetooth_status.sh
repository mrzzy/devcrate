if [ $(rfkill | grep bluetooth | head -n 1 | awk '{print $4}') = 'unblocked' ]
then
    echo ''
else
    echo ''
fi
