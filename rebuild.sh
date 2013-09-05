#!/usr/bin/sh

function build
{
    reset
    pep8 ragelpyext
    pyflakes ragelpyext
    pip install -e .
    nosetests
}

build
while true; do
    find . -name '*.rl' -o -name '*.py' -o -name '*.c' -exec inotifywait -e MOVE_SELF {} +;
    build;
done
