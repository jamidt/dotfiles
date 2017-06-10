#!/bin/bash

# Modify bashrc for local c++ header files
mkdir -p ~/.local/include/cpp

echo "CPATH=$HOME/.local/include/cpp" >> .bashrc
echo "export CPATH" >> .bashrc
