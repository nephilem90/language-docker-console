#!/bin/bash

if  ! hash docker 2>/dev/null
then
    echo "docker is not installed, you must install docker!"
    exit
fi

if [[ "$1" == "" ]]
then
    echo "accepted language:"
    echo "  php"
    echo "  python"
    echo "  node"
    exit
fi

if [[ "$1" == "php" ]]
then
    image="php"
elif [[ "$1" == "composer" ]]
then
    image="composer"
elif [[ "$1" == "node" ]] || [[ "$1" == "npm" ]]  || [[ "$1" == "tsc" ]]
then
    image="node"
elif [[ "$1" == "python" ]] || [[ "$1" == "pip" ]]
then
    image="python"
else
    image="bash"
fi

command=""
for var in $@
do
    command="$command $var"
done

docker run --rm -it --name "$USER" --user 1000 -v $(pwd):/home/app "$image" bash -c "cd /home/app && $command"