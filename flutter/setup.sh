#!/usr/bin/env bash
FLUTTER_VERSION="3.0.2"
FLUTTER_CHANNEL="stable"

if [[ "$OSTYPE" == "darwin"* ]]; then
    echo "MacOS detect"
    DOWNLOAD_PATH="https://storage.flutter-io.cn/flutter_infra_release/releases/$FLUTTER_CHANNEL/macos/flutter_macos_$FLUTTER_VERSION-$FLUTTER_CHANNEL.zip"
    ARCH=`uname -m`
    if [ "$ARCH" = "arm64" ]; then
        echo "arm64 detect"
        DOWNLOAD_PATH="https://storage.flutter-io.cn/flutter_infra_release/releases/$FLUTTER_CHANNEL/macos/flutter_macos_arm64_$FLUTTER_VERSION-$FLUTTER_CHANNEL.zip"
    fi
    SDK_DOWNLOADED_PATH="$HOME/Downloads/flutter_sdk.tar.xz"
    echo "download flutter sdk to $SDK_DOWNLOADED_PATH"
    curl -o $SDK_DOWNLOADED_PATH $DOWNLOAD_PATH
    RAW_PATH=$HOME/Development
    mkdir $RAW_PATH
    unzip $SDK_DOWNLOADED_PATH -d $RAW_PATH
    rm $SDK_DOWNLOADED_PATH
    echo "setting up env"
    echo "export PUB_HOSTED_URL=\"https://pub.flutter-io.cn\"">>$HOME/.zprofile
    echo "export FLUTTER_STORAGE_BASE_URL=\"https://storage.flutter-io.cn\"">>$HOME/.zprofile
    echo "export PATH=\"\$PATH:$RAW_PATH/flutter/bin\"">>$HOME/.zprofile
    echo "export PATH=\"\$PATH:$RAW_PATH/flutter/.pub-cache/bin\"">>$HOME/.zprofile
    echo "export PATH=\"\$PATH:$RAW_PATH/flutter/bin/cache/dart-sdk/bin\"">>$HOME/.zprofile
    echo "export NO_PROXY=localhost,127.0.0.1">>$HOME/.zprofile
elif [[ "$OSTYPE" == "linux-gnu"*  ]]; then
    echo "Linux detect"
    DOWNLOAD_PATH="https://storage.flutter-io.cn/flutter_infra_release/releases/$FLUTTER_CHANNEL/linux/flutter_linux_$FLUTTER_VERSION-$FLUTTER_CHANNEL.tar.xz"
    SDK_DOWNLOADED_PATH="$HOME/Downloads/flutter_sdk.tar.xz"
    echo "download flutter sdk to $SDK_DOWNLOADED_PATH"
    curl -o $SDK_DOWNLOADED_PATH $DOWNLOAD_PATH
    RAW_PATH=$HOME/Development
    mkdir $RAW_PATH
    tar xf $SDK_DOWNLOADED_PATH $RAW_PATH
    rm $SDK_DOWNLOADED_PATH
    echo "setting up env"
    echo "export PUB_HOSTED_URL=\"https://pub.flutter-io.cn\"">>$HOME/.bashrc
    echo "export FLUTTER_STORAGE_BASE_URL=\"https://storage.flutter-io.cn\"">>$HOME/.bashrc
    echo "export PATH=\"\$PATH:$RAW_PATH/flutter/bin\"">>$HOME/.bashrc
    echo "export PATH=\"\$PATH:$RAW_PATH/flutter/.pub-cache/bin\"">>$HOME/.bashrc
    echo "export PATH=\"\$PATH:$RAW_PATH/flutter/bin/cache/dart-sdk/bin\"">>$HOME/.bashrc
    echo "export NO_PROXY=localhost,127.0.0.1">>$HOME/.bashrc
    source $HOME/.bashrc
else
    echo "unknow platform"
fi



flutter doctor -v
flutter precache
flutter --version
