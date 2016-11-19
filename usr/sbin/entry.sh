#! /bin/bash

NAME=$1

if [ -z $NAME ]; then
    echo "Syntax: $0 [name]" 1>&2
    exit 1
fi

ls -l /usr/local/factorio


bin=/usr/local/factorio/bin/x64/factorio

savename=/usr/local/factorio/saves/$NAME.zip

if [ -f "$savename" ]; then
    echo "Save $savename already exists, skipping creation..."
else
    echo "Couldnt find save file $savename.."
    echo "Creating world $NAME..."
    $bin --create $NAME
fi

echo "Starting server factorio $NAME with the following save:"
ls -lh $savename
echo "Rest of the saves:"
ls -lt /usr/local/factorio/saves

echo "Starting..."
set -x
$bin --start-server $NAME
