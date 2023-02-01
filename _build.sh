#!/bin/bash

set -eux;

# apt install libboost-dev -y
g++ -std=c++20 -g -O2 -fno-omit-frame-pointer -fno-inline hello-crow.cpp -lpthread -o hello-crow

docker build -t hello-crow -f crow.df .
