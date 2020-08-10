#!/bin/bash

systempath=$1
thispath=`cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd`

rm -rf $1/recovery-from-boot.p
# We have chrome for webview. so 100mb less size
rm -rf $1/app/WebViewGoogle
rm -rf $1/app/Bridge
rm -rf $1/app/Camera
rm -rf $1/app/MzPay
rm -rf $1/app/PrintSpooler
rm -rf $1/app/WallpaperBackup
rm -rf $1/app/Drive
rm -rf $1/app/Duo
rm -rf $1/app/Maps
rm -rf $1/app/YouTube
rm -rf $1/app/talkback
rm -rf $1/app/CalendarGoogle
rm -rf $1/app/Photos
rm -rf $1/app/GooglePay
rm -rf $1/app/Music2
rm -rf $1/app/Gmail2
rm -rf $1/app/GoogleTTS
rm -rf $1/app/AppCenterIntl
rm -rf $1/app/Camera
rm -rf $1/app/IntlNews
rm -rf $1/app/NotePaper
rm -rf $1/app/Videos
rm -rf $1/priv-app/Email
rm -rf $1/priv-app/Browser
rm -rf $1/priv-app/Feedback
rm -rf $1/priv-app/Gallery
rm -rf $1/priv-app/MeizuPay
rm -rf $1/priv-app/SoundRecorder
rm -rf $1/priv-app/Music
rm -rf $1/priv-app/Search
rm -rf $1/priv-app/SoundRecorder
rm -rf $1/priv-app/ToolBox
rm -rf $1/priv-app/Velvet
rm -rf $1/priv-app/Video
rm -rf $1/app/MzUpdate*
rm -rf $1/MzApp/Game*
rm -rf $1/MzApp/Life
rm -rf $1/MzApp/Reader
rm -rf $1/MzApp/VideoClips
rm -rf $1/MzApp/Calender
rm -rf $1/MzApp/DsGame
rm -rf $1/MzApp/Email
rm -rf $1/MzApp/NotePaper
rm -rf $1/MzApp/Pedometer
rm -rf $1/MzApp/Reader
rm -rf $1/MzApp/Weather

