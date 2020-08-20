#!bin/bash
# Funtouch OS Debloat script by JamieH aka henloboi

systempath=$1
thispath=`cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd`

rm -rf $1/app/BBKCalculator
rm -rf $1/app/BBKFMRadio
rm -rf $1/app/BBKLOG
rm -rf $1/app/BBKMusic
rm -rf $1/app/BBKNotes
rm -rf $1/app/BBKSoundRecorder
rm -rf $1/app/BBKWeather
rm -rf $1/app/BBKWeatherProvider
rm -rf $1/app/Backup
rm -rf $1/app/Compass
rm -rf $1/app/Coral
rm -rf $1/app/Drive
rm -rf $1/app/Duo
rm -rf $1/app/EWarranty
rm -rf $1/app/Gmail2
rm -rf $1/app/Maps
rm -rf $1/app/Music2
rm -rf $1/app/Photos
rm -rf $1/app/VLife_vivo
rm -rf $1/app/Video*
rm -rf $1/app/VivoAssistant
rm -rf $1/app/VivoCalendar
rm -rf $1/app/VivoCamera
rm -rf $1/app/VivoDreamClockApp 
rm -rf $1/app/VivoDreamMusicApp
rm -rf $1/app/VivoDreamWeatherApp
rm -rf $1/app/VivoGallery
rm -rf $1/app/VivoSmartMultiWindow
rm -rf $1/app/VivoTips
rm -rf $1/app/VivoUnionPayEx
rm -rf $1/app/VivoWebsite
rm -rf $1/app/YouTube
rm -rf $1/app/facebook-appmanager
rm -rf $1/app/vivoCollage
rm -rf $1/app/vivoDemoVideo

rm -rf $1/priv-app/Email
rm -rf $1/priv-app/FloatingCamera
rm -rf $1/priv-app/GoogleRestore
rm -rf $1/priv-app/SetupWizard
rm -rf $1/priv-app/VivoSetupWizard
rm -rf $1/priv-app/VivoBrowser
rm -rf $1/priv-app/facebook-installer
rm -rf $1/priv-app/facebook-services
