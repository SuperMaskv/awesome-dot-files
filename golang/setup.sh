#!/usr/bin/env bash

if [[ "$OSTYPE" == "darwin"* ]]; then
    echo "export GOPROXY=\"https://mirrors.aliyun.com/goproxy/\"">>$HOME/.zprofile
    source $HOME/.zprofile
elif [[ "$OSTYPE" == "linux-gnu"*  ]]; then
    echo "export GOPROXY=\"https://mirrors.aliyun.com/goproxy/\"">>$HOME/.bashrc
    source $HOME/.bashrc
else
    echo "unknow platform"
fi