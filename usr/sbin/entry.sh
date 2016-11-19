#! /bin/bash

#set -x

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

$bin --start-server $NAME --no-auto-pause

exit

cat <<EOF 
General options:

  -h [ --help ]               display help
  --version                   show version information
  -c [ --config ] PATH        config file to use

Running options:
  -s [ --map2scenario ] arg   map to scenario conversion
  --apply-update arg          immediately apply update package
  --create SAVE               create a new map
  --start-server SAVE         start a multiplayer server

Server options:
  --latency N                 multiplayer server latency, in ticks
  --latency-ms N              multiplayer server latency, in milliseconds
  --autosave-interval N (=2)  server autosave interval, in minutes
  --autosave-slots N (=3)     server autosave slots
  --disallow-commands         disallow use of the command console
  --peer-to-peer              use peer-to-peer communication
  --no-auto-pause             don't automatically pause when no players are 
                              connected
EOF

