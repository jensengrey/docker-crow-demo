#!/bin/bash

set -eux;

# apt install libboost-dev -y
if [ "$(uname)" == "Darwin" ]; then
    g++ -std=c++20 -g -O2 -fno-omit-frame-pointer -fno-inline hello-crow.cpp -lpthread -I/opt/homebrew/include -o hello-crow
elif [ "$(uname)" == "Linux" ]; then
    g++ -std=c++20 -g -O2 -fno-omit-frame-pointer -fno-inline hello-crow.cpp -lpthread -o hello-crow
else
    echo "trying the linux build on: $(uname), might work"
    g++ -std=c++20 -g -O2 -fno-omit-frame-pointer -fno-inline hello-crow.cpp -lpthread -o hello-crow
fi

if command -v docker >/dev/null 2>&1; then
    docker build -t hello-crow -f crow.df .
fi


