#!/usr/bin/env bash
FLUTTER_VERSION="2.8.0"
FLUTTER_CHANNEL="stable"
DOWNLOAD_PATH="https://storage.flutter-io.cn/flutter_infra_release/releases/$FLUTTER_CHANNEL/macos/flutter_macos_$FLUTTER_VERSION-$FLUTTER_CHANNEL.zip"
SDK_DOWNLOADED_PATH="$HOME/Downloads/flutter_sdk.zip"
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

source $HOME/.zprofile
flutter doctor -v
flutter precache
flutter --version
