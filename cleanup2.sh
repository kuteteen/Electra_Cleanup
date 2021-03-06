###################################################################
#                                                                 #
# Cleanup.sh                                                      #
#                                                                 #
# This script will remove all traces of the Electra jailbreak     #
# from an iOS device.                                             #
#                                                                 #
# DIRECTIONS for use                                              #
#                                                                 #
# 1) In Cydia, un-install all tweaks that you can.                #
# 2) Respring                                                     #
# 3) Run this script.                                             #
# 4) Pray                                                         #
#                                                                 #
# Usage tips:                                                     #
# rm -rf /DT/test/*                                               #
# This command will delete all files and directories inside of    #
# the /DT/test directory, but, will not delete the test directory #
# itself that resides in /DT                                      #
#                                                                 #
# rm -rf /DT/test                                                 #
# rm -rf /DT/test/                                                #
# Either of these command will delete all files and directories   #
# inside of the /DT/test directory.  AND, it will also delete the #
# test directory inside of the /DT directory.  Be careful         #
#                                                                 #
# Manual deletions:                                               #
# You will need to look through some directories on your own to   #
# find some more files and directories to delete.  These are:     #
#                                                                 #
# /private/var/containers                                         #
# /private/var/mobile/Containers/Data                             #
# /private/var/mobile/Containers/Shared                           #
#                                                                 #
###################################################################

# Ensure the user is logged in as root.
if [ "$EUID" -ne 0 ]; then
	echo "ERROR!!!!!  You MUST be logged in as root.  Please"
	echo "logoff and then re-login as root." 
	exit
fi

# Confirm user wishes to continue.
echo "WARNING!!!!  This script will attempt to remove the Electra jailbreak"
echo "from this device.  Please think long and hard before continuing since it"
echo "could cause you to loose your jailbreak!!!"
echo ""
echo "WARNING!!!!! Be sure you fill in the section just below to delete the"
echo "directories related to the bundles.  These will need to be deleted"
echo "for completeness."
echo ""
read -p "Press enter to continue, or, press Control + C to exit"

# Ensure Cydia is not running.
killall Cydia

########################################################################
#                                                                      #
# Delete the directories that contain data for the bundles of the apps #
# that are installed.  These are most likely going to be the apps      #
# installed via Impactor or tweaks that install apps.                  #
#                                                                      #
########################################################################

# /var/containers/Bundle/Application (Appears to be only app store apps & those installed via Impactor.)
rm -rf /var/containers/Bundle/Application/F766716D-477B-412E-B044-2E86980D8A64 # This is electra on my device
rm -rf /var/containers/Bundle/Application/B69DBC41-AB6A-42BC-AE0E-293128D3B0C2 # This is Filzaescaped on my device

# /var/mobile/Containers/Data/Application (Appears to be only app store apps & those installed via Impactor.)
rm -rf /var/mobile/Containers/Data/Application/929C82CD-1F4D-46E4-A384-00C917274341 # This is Anemonetheming on my device
rm -rf /var/mobile/Containers/Data/Application/5A10E5C8-D754-48B0-A01C-AD3AD41A9591 # This is Cydia Extender on my device
rm -rf /var/mobile/Containers/Data/Application/5EBF403E-0CFE-48DA-A580-13CC8BC1F80A # This is ICleaner on my device
rm -rf /var/mobile/Containers/Data/Application/8B0AA03E-BF95-4F6A-B1A9-CC1FA24A9EDF # This is Saurik.Cydia on my device
rm -rf /var/mobile/Containers/Data/Application/CDA801B2-FF27-4756-9A79-0E07C521380F # This is Filza on my device
rm -rf /var/mobile/Containers/Data/Application/71D548F1-E6EE-4D46-A0DD-A07D47DA247F # This is Filza electrocuted on my device
rm -rf /var/mobile/Containers/Data/Application/1472FBB3-AEA8-44C5-B074-26F0F279C0DF # This is Filza Escaped on my device
rm -rf /var/mobile/Containers/Data/Application/C78DDACB-0A46-4111-A4D5-7C5C1379FE17 # This is Apps manager on my device
rm -rf /var/mobile/Containers/Data/Application/4FAC484E-1B14-4F20-B7F7-9442A7FEC8E1 # This is crash reporter on my device
rm -rf /var/mobile/Containers/Data/Application/8DDE304D-1B24-4511-952B-B340D3D2969C # This is iDevice Walls App on my device
rm -rf /var/mobile/Containers/Data/Application/456D23FE-0F72-46A4-96C7-79C43F391034 # This is iWidgetApp on my device
rm -rf /var/mobile/Containers/Data/Application/37CEAFB2-90B3-409B-A2C0-F4CBC195F27C # This is libActivator on my device
rm -rf /var/mobile/Containers/Data/Application/C064C600-B0EB-4618-8BE2-02F6D1676FE3 # This is opwapp on my device
rm -rf /var/mobile/Containers/Data/Application/A2006909-A1AE-44F9-A6F6-77683CCCA67A # This is Electra on my device
rm -rf /var/mobile/Containers/Data/Application/BC495204-985B-4B2F-967D-8A7680C6F115 # This is Electra Safe MOde on my device
rm -rf /var/mobile/Containers/Data/Application/B61C48AB-7AFF-441E-8ACD-0AF39CF5FE03 # This is CocoaTop on my device

# /var/mobile/Containers/Shared/AppGroup (Appears to be only app store apps & those installed via Impactor.)
rm -rf /var/mobile/Containers/Shared/AppGroup/4DCC536E-0471-4D19-BA15-5C4B52C87E3C # This is Cydia Extender on my device

########################################################################
#                                                                      #
# Delete the directories that aren't part of a model .ipsw file.       #
#                                                                      #
########################################################################

# Delete directories off of the / folder.
rm -rf /.fseventsd/*
rm -rf /bootstrap
rm -rf /cores/*
rm -rf /Developer/*
rm -rf /DT
rm -rf /electra
rm -rf /lib/*
rm -rf /mnt/*

# Delete directories off of the /etc folder.
rm -rf /etc/apt
rm -rf /etc/default
rm -rf /etc/profile.d

# Delete directories off of the /Library folder.
rm -rf /Library/dpkg
rm -rf /Library/ControlCenter
rm -rf /Library/Flipswitch
rm -rf /Library/Frameworks/*
rm -rf /Library/LaunchDaemons
rm -rf /Library/MobileSubstrate
rm -rf /Library/PreferenceBundles
rm -rf /Library/PreferenceLoader
rm -rf /Library/Switches
rm -rf /Library/Themes

# Delete directories off of the /usr folder.
rm -rf /usr/games
rm -rf /usr/include/*
rm -rf /usr/lib/apt
rm -rf /usr/lib/pkgconfig
rm -rf /usr/local/lib/*

# Delete directories off of the /var folder.
rm -rf /var/mobile/Library/.Trash
rm -rf /var/mobile/Library/.Trash.metadata
rm -rf /var/mobile/Library/Caches/*
rm -rf /var/mobile/Library/Cookies/*
rm -rf /var/mobile/Library/WebKit/*
rm -rf /var/root/Application Support/*
rm -rf /var/root/Library/Caches/*

# Delete misc files that don't belong to any tweak.
rm -f /.bit_of_fun
rm -f /.bootstrapped_electra
rm -f /.cydia_no_stash
rm -f /bin/launchctl
rm -f /usr/lib/libjailbreak.dylib
rm -f /var/installd/Library/MobileInstallation/UninstalledApplications.plist
rm -f /var/mobile/test.txt
rm -f /var/mobile/Library/Preferences/.GlobalPreferences.plist.*
rm -f /var/mobile/Library/Preferences/com.apple.*.plist.*
rm -f /var/mobile/Library/Preferences/com.saurik.Cydia.plist
rm -f /var/mobile/Library/Preferences/com.smokin1337.optixprefs.plist
rm -f /var/mobile/Library/Preferences/com.smokin1337.optixcolorprefs.plist
rm -f /var/mobile/Library/Preferences/net.dodtweaks.mdprefs.plist
rm -f /var/mobile/Library/Preferences/pairedsyncd.plist
rm -f /var/mobile/Library/Preferences/splashboardd.plist
rm -f /var/mobile/Library/SpringBoard/.HomeBackground.cpbitmap.*
rm -f /var/mobile/Library/SpringBoard/ApplicationShortcuts/org.coolstar.electra.plist
rm -f /var/mobile/Library/SpringBoard/PushStore/com.saurik.Cydia.pushstore
rm -f /var/mobile/MobileSoftwareUpdate/restore.log
rm -f /var/MobileSoftwareUpdate/restore.log
rm -f /var/root/.bash_history
rm -f /var/root/Library/Preferences/com.apple.*.plist.*
rm -f /var/root/Library/Preferences/UserEventAgent.plist
rm -f /var/run/jailbreakd.pid
rm -f /var/tmp/jailbreakd.pid
rm -f /var/tmp/cydia.log

# Delete misc folders that don't belong to any tweak.
rm -rf /Library/Application Support/SpeedOptimize
rm -rf /Library/CustomFonts
rm -rf /usr/share/bash-completion
rm -rf /usr/share/bigboss
rm -rf /usr/share/dict
rm -rf /usr/share/doc
rm -rf /usr/share/dpkg
rm -rf /usr/share/gnupg
rm -rf /var/backups
rm -rf /var/cache
rm -rf /var/db/stash
rm -rf /var/db/analyticsd/*.ips
rm -rf /var/lib/misc
rm -rf /var/local/*
rm -rf /var/lock/*
rm -rf /var/log/*
rm -rf /var/logs/*
rm -rf /var/mobile/Downloads/Cydia
rm -rf /var/mobile/Library/Cydia
rm -rf /var/mobile/Library/Logs/*
rm -rf /var/spool/*
rm -rf /var/stash
rm -rf /var/tmp/*
rm -rf /var/wireless/Library/Logs/*

########################################################################
#                                                                      #
# Begin custom tweak uninstall area.                                   #
#                                                                      #
########################################################################

# Cleanup files from the "7-zip (POSIX)" package.
rm -f  /usr/bin/7z
rm -f  /usr/bin/7za
rm -f  /usr/lib/p7zip/7z
rm -f  /usr/lib/p7zip/7z.so
rm -f  /usr/lib/p7zip/7zCon.sfx
rm -f  /usr/lib/p7zip/7za
rm -f  /usr/lib/p7zip/Codecs/Rar.so
rm -rf /usr/lib/p7zip/Codecs
rm -rf /usr/lib/p7zip

# Cleanup files from the "Activator" package.
rm -rf /Library/Activator/ActivatorSpringBoard.bundle
rm -rf /Library/Activator/ar.lproj
rm -rf /Library/Activator/de.lproj
rm -rf /Library/Activator/en.lproj
rm -rf /Library/Activator/en_GB.lproj
rm -rf /Library/Activator/es.lproj
rm -rf /Library/Activator/Events
rm -rf /Library/Activator/fr.lproj
rm -rf /Library/Activator/he.lproj
rm -rf /Library/Activator/it.lproj
rm -rf /Library/Activator/ja.lproj
rm -rf /Library/Activator/ko.lproj
rm -rf /Library/Activator/nl.lproj
rm -rf /Library/Activator/pl.lproj
rm -rf /Library/Activator/pt_PT.lproj
rm -rf /Library/Activator/ru.lproj
rm -rf /Library/Activator/SwitchTemplates
rm -rf /Library/Activator/tr.lproj
rm -rf /Library/Activator/zh_CN.lproj
rm -rf /Library/Activator/zh_TW.lproj
rm -f  /Library/Activator/Info.plist
rm -f  /var/mobile/Library/Caches/libactivator.plist
rm -f  /var/mobile/Library/Preferences/libactivator.plist
rm -f  /usr/bin/autoent
rm -f  /usr/bin/autoinstall
rm -rf /usr/include/libactivator
rm -f  /usr/lib/libactivator.dylib

# Cleanup files from the "Adv-Cmds" package.
rm -f /usr/bin/cap_mkdb
rm -f /usr/bin/finger
rm -f /usr/bin/last
rm -f /usr/bin/locale
rm -f /usr/bin/ps

# Cleanup files from the Anemone package.
rm -rf /Applications/Anemone.app
rm -rf /private/var/mobile/Library/Caches/com.anemonetheming.anemone
rm -f  /private/var/mobile/Library/Preferences/com.anemoneteam.anemone.plist
rm -f  /private/var/mobile/Library/Preferences/com.anemoneteam.anemonedbg.plist
rm -f  /private/var/mobile/Library/Preferences/com.anemoneteam.anemoneiconsdbg.plist
rm -f  /private/var/mobile/Library/Preferences/com.anemoneteam.anemoneiconsoverride.plist
rm -f  /private/var/mobile/Library/Preferences/com.anemoneteam.anemoneordering.plist
rm -f  /private/var/mobile/Library/Preferences/com.anemoneteam.optithemereloaded
rm -rf /private/var/stash/anemonecache
rm -f  /usr/bin/AnemoneOptimizer
rm -f  /usr/bin/cardump
rm -f  /usr/bin/recache

# Cleanup files from the "Apps Manager" package.
rm -rf /Applications/ADManager.app
rm -f  /usr/bin/ADMHelper
rm -rf /var/mobile/Library/ADManager
rm -f  /var/mobile/Library/Preferences/com.tigisoftware.ADManager.plist

# Cleanup files from the "AppInst" package.
rm -f /usr/bin/appinst

# Cleanup files from the "Applist" package.
rm -rf /System/Library/PreferenceBundles/AppList.bundle
rm -rf /usr/include/AppList
rm -f  /usr/lib/libapplist.dylib

# Cleanup files from the "Appsync" package.
rm -f /usr/bin/asu_inject

# Cleanup files from the "APT 1.4 (apt-key)" package.
rm -f /usr/bin/apt-key

# Cleanup files from the "APT 1.4 Strict" package.
rm -f /usr/bin/apt
rm -f /usr/bin/apt-cache
rm -f /usr/bin/apt-cdrom
rm -f /usr/bin/apt-config
rm -f /usr/bin/apt-extracttemplates
rm -f /usr/bin/apt-ftparchive
rm -f /usr/bin/apt-get
rm -f /usr/bin/apt-mark
rm -f /usr/bin/apt-sortpkgs

# Cleanup files from the "APT 1.4 Strict (lib)" package.
rm -f  /etc/apt/apt.conf.d
rm -f  /etc/apt/preferences.d
rm -f  /etc/apt/sources.list.d
rm -f  /etc/apt/trusted/gpg.d
rm -rf /usr/lib/apt
rm -f  /usr/lib/libapt-inst.2.0.0.dylib
rm -f  /usr/lib/libapt-inst.2.0.dylib
rm -f  /usr/lib/libapt-inst.dylib
rm -f  /usr/lib/libapt-pkg.5.0.1.dylib
rm -f  /usr/lib/libapt-pkg.5.0.dylib
rm -f  /usr/lib/libapt-pkg.dylib
rm -f  /usr/lib/libapt-private.0.0.0.dylib
rm -f  /usr/lib/libapt-private.0.0.dylib
rm -rf /usr/libexec/apt
rm -rf /usr/libexec/dpkg
rm -rf /usr/share/bash-completion
rm -rf /usr/share/doc
rm -rf /var/cache/apt
rm -rf /var/lib/apt
rm -rf /var/log/apt

# Cleanup files from the "Assuan" package.
rm -f  /usr/bin/libassuan-config
rm -f  /usr/include/assuan.h
rm -f  /usr/lib/libassuan.0.dylib
rm -f  /usr/lib/libassuan.dylib
rm -f  /usr/lib/libassuan.la
rm -rf /usr/share/aclocal
rm -f  /usr/share/aclocal/libassuan.m4

# Cleanup files from the "Basic-Cmds" package.
rm -f /usr/bin/mesg
rm -f /usr/bin/uudecode
rm -f /usr/bin/uuencode
rm -f /usr/bin/write

# Cleanup files from the "Berkley DB" package.
rm -f /usr/bin/dbsql
rm -f /usr/bin/db_archive
rm -f /usr/bin/db_checkpoint
rm -f /usr/bin/db_deadlock
rm -f /usr/bin/db_dump
rm -f /usr/bin/db_hotbackup
rm -f /usr/bin/db_load
rm -f /usr/bin/db_log_verify
rm -f /usr/bin/db_printlog
rm -f /usr/bin/db_recover
rm -f /usr/bin/db_replicate
rm -f /usr/bin/db_sql_codegen
rm -f /usr/bin/db_stat
rm -f /usr/bin/db_tuner
rm -f /usr/bin/db_upgrade
rm -f /usr/bin/db_verify
rm -f /usr/include/db.h
rm -f /usr/include/db_cxx.h
rm -f /usr/include/dbsql.h
rm -f /usr/lib/libdb-6.2.dylib
rm -f /usr/lib/libdb-6.dylib
rm -f /usr/lib/libdb.dylib
rm -f /usr/lib/libdb_sql-6.2.dylib
rm -f /usr/lib/libdb_sql-6.dylib
rm -f /usr/lib/libdb_sql.dylib

# Cleanup files from the "Bigboss Icon Set" package.
rm -rf /usr/share/bigboss

# Cleanup files from the "Bootstrap-Cmds" package.
rm -f /usr/bin/mig
rm -f /usr/libexec/migcom

# Cleanup files from the "Bourne-Again SHell" package.
rm -f  /bin/bash
# rm -f  /bin/sh This was moved to the bottom.
rm -f  /usr/bin/bashbug
rm -rf /usr/lib/bash

# Cleanup files from the Boxy package.
rm -rf /private/var/mobile/Documents/com.irepo.boxy3
rm -f  /private/var/mobile/Documents/Boxy3.log
rm -f  /private/var/mobile/Library/Preferences/com.irepo.boxy.plist
rm -rf /usr/lib/TweakInject/Boxy_Main.bundle

# Cleanup files from the bzip2 package.
rm -f /bin/bunzip2
rm -f /bin/bzcat
rm -f /bin/bzip2
rm -f /bin/bzip2recover

# Cleanup files from the CircuitBreaker package.
rm -rf /Applications/circuitbreaker.app/
rm -f  /private/var/mobile/Library/Preferences/aaa.thecomputerwhisperer.fuku.plist
rm -f  /private/var/mobile/Library/Preferences/com.thecomputerwhisperer.cbtweaks.plist
rm -f  /private/var/mobile/Library/Preferences/com.thecomputerwhisperer.cbprefs.plist
rm -f  /private/var/mobile/Library/Preferences/com.thecomputerwhisperer.CBPrefsList.plist
rm -f  /private/var/mobile/Library/Preferences/com.thecomputerwhisperer.CircuitBreakerPrefs.plist

# Cleanup files from the CCModules package.
rm -rf /Library/ControlCenter/Bundles
rm -f  /private/var/mobile/Library/Preferences/com.oly.xb-ccmodules.plist

# Cleanup files from the CCSupport package.
rm -rf /Library/Application Support/CCSupport
rm -f  /private/var/mobile/Library/ControlCenter/ModuleConfiguration_CCSupport.plist

# Cleanup files from the CocoaTop app.
rm -rf /Applications/CocoaTop.app
rm -f  /private/var/mobile/Library/Preferences/ru.domo.CocoaTop.plist

# Cleanup files from the "Core Utilities" package.
rm -r  /etc/profile.d/coreutils.h
rm -f  /usr/bin/[
rm -f  /usr/bin/b2sum
rm -f  /usr/bin/base32
rm -f  /usr/bin/base64
rm -f  /usr/bin/basename
rm -f  /usr/bin/chcon
rm -f  /usr/bin/chown
rm -f  /usr/bin/cksum
rm -f  /usr/bin/comm
rm -f  /usr/bin/csplit
rm -f  /usr/bin/cut
rm -f  /usr/bin/dircolors
rm -f  /usr/bin/du
rm -f  /usr/bin/env
rm -f  /usr/bin/expand
rm -f  /usr/bin/expr
rm -f  /usr/bin/factor
rm -f  /usr/bin/fmt
rm -f  /usr/bin/folders
rm -f  /usr/bin/groups
rm -f  /usr/bin/head
rm -f  /usr/bin/hostid
rm -f  /usr/bin/id
rm -f  /usr/bin/install
rm -f  /usr/bin/join
rm -f  /usr/bin/link
rm -f  /usr/bin/logname
rm -f  /usr/bin/md5sum
rm -f  /usr/bin/mkfifo
rm -f  /usr/bin/mktemp
rm -f  /usr/bin/nice
rm -f  /usr/bin/nl
rm -f  /usr/bin/nohup
rm -f  /usr/bin/nproc
rm -f  /usr/bin/numfmt
rm -f  /usr/bin/od
rm -f  /usr/bin/paste
rm -f  /usr/bin/pathchk
rm -f  /usr/bin/pinky
rm -f  /usr/bin/pr
rm -f  /usr/bin/printenv
rm -f  /usr/bin/printf
rm -f  /usr/bin/ptf
rm -f  /usr/bin/realpath
rm -f  /usr/bin/runcon
rm -f  /usr/bin/seq
rm -f  /usr/bin/sha1sum
rm -f  /usr/bin/sha224sum
rm -f  /usr/bin/sha256sum
rm -f  /usr/bin/sha384sum
rm -f  /usr/bin/sha512sum
rm -f  /usr/bin/shred
rm -f  /usr/bin/shuf
rm -f  /usr/bin/sort
rm -f  /usr/bin/split
rm -f  /usr/bin/statoverride
rm -f  /usr/bin/stdbuf
rm -f  /usr/bin/sum
rm -f  /usr/bin/sync
rm -f  /usr/bin/tac
rm -f  /usr/bin/tail
rm -f  /usr/bin/tee
rm -f  /usr/bin/test
rm -f  /usr/bin/timeout
rm -f  /usr/bin/tr
rm -f  /usr/bin/truncate
rm -f  /usr/bin/tsort
rm -f  /usr/bin/tty
rm -f  /usr/bin/unexpand
rm -f  /usr/bin/uniq
rm -f  /usr/bin/unlink
rm -f  /usr/bin/uptime
rm -f  /usr/bin/users
rm -f  /usr/bin/wc
rm -f  /usr/bin/who
rm -f  /usr/bin/whoami
rm -f  /usr/bin/yes
rm -f  /usr/lib/coreutils
rm -f  /usr/sbin/chown
rm -f  /usr/sbin/chroot

# Cleanup files from the "Core Utilities (/bin)" package.
# IMPORTANT! Some are commented out.  Dont' delete these!  These are part of
# the model .ipsw file.
# rm -f /bin/cat
rm -f /bin/chgrp
rm -f /bin/chmod
rm -f /bin/chown
rm -f /bin/cp
rm -f /bin/date
rm -f /bin/dd
rm -f /bin/dir
rm -f /bin/echo
rm -f /bin/false
rm -f /bin/kill
rm -f /bin/ln
rm -f /bin/ls
rm -f /bin/mkdir
rm -f /bin/mknod
rm -f /bin/mktemp
rm -f /bin/mv
rm -f /bin/pwd
rm -f /bin/readlink
# rm -f /bin/rm # This is deleted below.
rm -f /bin/rmdir
rm -f /bin/sleep
rm -f /bin/stty
rm -f /bin/su
rm -f /bin/touch
rm -f /bin/true
rm -f /bin/uname
rm -f /bin/vdir
rm -f /usr/bin/df
rm -f /usr/bin/dirname
rm -f /usr/bin/sort

# Cleanup files from the CrashReporter package.
rm -rf /Applications/CrashReporter.app
rm -f  /private/var/mobile/Library/Logs/CrashReporter/*.*
rm -f  /private/var/mobile/Library/Preferences/crash-reporter.plist
rm -f  /private/var/mobile/Library/Preferences/jp.ashikase.crashreporter.scanner.plist

# Cleanup files from the "cURL" package.
rm -f  /usr/bin/curl
rm -f  /usr/bin/curl-config
rm -rf /usr/include/curl
rm -f  /usr/lib/libcurl.4.dylib
rm -f  /usr/lib/libcurl.dylib
rm -f  /usr/lib/libcurl.la
rm -f  /usr/lib/pkgconfig/ligcurl.pc

# Cleanup files from the "Cydia Installer" package.
rm -rf /Applications/Cydia.app/
rm -rf /usr/libexec/cydia
rm -rf /var/lib/cydia

# Cleanup files from the "Darwin Tools" package.
rm -f /usr/bin/sw_vers
rm -f /usr/sbin/startupfiletool

# Cleanup files from the "Debian Packager" package.
rm -rf /etc/alternatives
rm -rf /etc/dpkg
rm -f  /sbin/update_dyld_shared_cache
rm -f  /usr/bin/dpkg
rm -f  /usr/bin/dpkg-architecture
rm -f  /usr/bin/dpkg-buildflags
rm -f  /usr/bin/dpkg-buildpackage
rm -f  /usr/bin/dpkg-checkbuilddeps
rm -f  /usr/bin/dpkg-deb
rm -f  /usr/bin/dpkg-distaddfile
rm -f  /usr/bin/dpkg-divert
rm -f  /usr/bin/dpkg-genbuildinfo
rm -f  /usr/bin/dpkg-genchanges
rm -f  /usr/bin/dpkg-gencontrol
rm -f  /usr/bin/dpkg-gensymbols
rm -f  /usr/bin/dpkg-maintscript-helper
rm -f  /usr/bin/dpkg-mergechangelogs
rm -f  /usr/bin/dpkg-name
rm -f  /usr/bin/dpkg-parsechangelog
rm -f  /usr/bin/dpkg-query
rm -f  /usr/bin/dpkg-scanpackages
rm -f  /usr/bin/dpkg-scansources
rm -f  /usr/bin/dpkg-shlibdeps
rm -f  /usr/bin/dpkg-source
rm -f  /usr/bin/dpkg-split
rm -f  /usr/bin/dpkg-statoverride
rm -f  /usr/bin/dpkg-trigger
rm -f  /usr/bin/dpkg-vendor
rm -f  /usr/bin/update-alternatives
rm -f  /usr/lib/libdpkg.a
rm -f  /usr/lib/libdpkg.la
rm -rf /usr/lib/pkgconfig
rm -rf /usr/share/dpkg
rm -rf /var/lib/dpkg

# Cleanup files from the "Debian Utilities" package.
rm -f /bin/run-parts

# Cleanup files from the "Debkeeper" package.
rm -f /private/var/mobile/Library/Preferences/net.tateu.debkeeper.plist

# Cleanup files from the DetailedPowerUsage package.
rm -rf /Library/Application Support/DPUTweakResources
rm -f  /private/var/mobile/Library/Preferences/com.thecomputerwhisperer.DetailedPowerUsage.plist

# Cleanup files from the "Developer-Cmds" package.
rm -f /usr/bin/ctags
rm -f /usr/bin/hexdump
rm -f /usr/bin/rpcgen
rm -f /usr/bin/unifdef

# Cleanup files from the "Diff Utilities" package.
rm -f /usr/bin/cmp
rm -f /usr/bin/diff
rm -f /usr/bin/diff3
rm -f /usr/bin/sdiff

# Cleanup files from the Extender package.
rm -rf /Applications/Extender.app
rm -f  /bin/jtoold
rm -rf /Library/Switches/Ext3nderSwitch.bundle
rm -rf /private/var/Ext3nder-Installer
rm -rf /private/var/mobile/Documents/Ext3nder
rm -f  /private/var/mobile/Library/Preferences/com.cydia.Ext3nder.plist
rm -f  /private/var/mobile/Library/Preferences/com.julioverne.ext3nder.autosign.plist

# Cleanup files from the "EzCC" package.
rm -rf /Library/ControlCenter

# Cleanup files from the "Fake GPS Pro" package.
rm -f  /private/var/mobile/Documents/favorites.plist
rm -rf /private/var/mobile/Library/Caches/cn.tinyapps.XGPSPro
rm -f  /private/var/mobile/Library/Preferences/cn.tinyapps.XGPSPro.plist
rm -f  /private/var/mobile/Library/Preferences/net.85819.ios.OTRLocation.plist
rm -f  /private/var/mobile/Library/Preferences/otrlocation.app.85819.net.plist

# Cleanup files from the "File" package.
rm -f /usr/bin/file
rm -f /usr/inlude/magic.h
rm -f /usr/lib/libmagic.1.dylib
rm -f /usr/lib/ligmagic.dylib
rm -f /usr/share/misc/magic.mgc

# Cleanup files from the "File-Cmds" package.
rm -f /usr/bin/chflags
rm -f /usr/bin/compress
rm -f /usr/bin/ipcrm
rm -f /usr/bin/ipcs
rm -f /usr/bin/pax

# Cleanup files for the "Fileza, FilzaEscaped, FilzaElectrocuted" packages.
rm -rf /Applications/Filza.app
rm -rf /private/var/mobile/Containers/Data/Application/2A9785BE-18A9-4519-BC94-8B33C3F02ACF # Filza preferences and data.
rm -rf /private/var/mobile/Library/Application Support/Containers/com.scroublepokemon.filzaelectrocuted
rm -rf /private/var/mobile/Library/Caches/com.scroublepokemon.filzaelectrocuted
rm -rf /private/var/mobile/Library/Filza
rm -f  /private/var/root/Library/Preferences/com.scroublepokemon.filzaescaped.plist
rm -f  /private/var/root/Library/Preferences/com.scroublepokemon.filzaescaped.plist.*

# Cleanup files from the "Find Utilities" package.
rm -f /usr/bin/find
rm -f /usr/bin/locate
rm -f /usr/bin/updatedb
rm -f /usr/bin/xargs
rm -f /usr/libexec/bigram
rm -f /usr/libexec/code
rm -f /usr/libexec/frcode

# Cleanup files from the "Flame" package.
rm -f  /etc/apt/apt.conf.d/flameTimeout
rm -rf /Library/Application Support/Flame
rm -rf /private/var/mobile/Library/Application Support/Flame
rm -f  /private/var/mobile/Library/Preferences/com.aditkamath.flame.plist

# Cleanup files from the "Flex" package.
rm -rf /Applications/Flex.app
rm -f  /private/var/mobile/Documents/extraction-com.apple.springboard.flex
rm -f  /private/var/mobile/Documents/extraction-com.johncoates.Flex.flex
rm -rf /private/var/mobile/Documents/Flex
rm -rf /private/var/mobile/Library/Application Support/Flex3
rm -rf /private/var/mobile/Library/Caches/com.johncoates.Flex
rm -rf /private/var/mobile/Library/Flex3
rm -f  /private/var/mobile/Library/Preferences/com.johncoates.Flex.plist
rm -f  /private/var/mobile/Library/UserConfigurationProfiles/PublicInfo/Flex3Patches.plist

# Cleanup files from the "Flipswitch" package.
rm -f  /Library/Flipswitch/libFlipswitchSpringBoard.dylib
rm -f  /Library/Flipswitch/libFlipswitchSwitches.dylib
rm -rf /Library/Switches/3G.bundle
rm -rf /Library/Switches/AirplaneMode.bundle
rm -rf /Library/Switches/AutoBrightness.bundle
rm -rf /Library/Switches/Autolock.bundle
rm -rf /Library/Switches/Bluetooth.bundle
rm -rf /Library/Switches/Data.bundle
rm -rf /Library/Switches/DoNotDisturb.bundle
rm -rf /Library/Switches/Flashlight.bundle
rm -rf /Library/Switches/FuturemindAdBlock.bundle
rm -rf /Library/Switches/Hotspot.bundle
rm -rf /Library/Switches/Location.bundle
rm -rf /Library/Switches/LowPower.bundle
rm -rf /Library/Switches/LTE.bundle
rm -rf /Library/Switches/NightShift.bundle
rm -rf /Library/Switches/RecordScreen.bundle
rm -rf /Library/Switches/Respring.bundle
rm -rf /Library/Switches/Ringer.bundle
rm -rf /Library/Switches/Rotation.bundle
rm -rf /Library/Switches/RotationLock.bundle
rm -rf /Library/Switches/Settings.bundle
rm -rf /Library/Switches/Vibration.bundle
rm -rf /Library/Switches/VPN.bundle
rm -rf /Library/Switches/Wifi.bundle
rm -rf /Library/Switches/WifiProxy.bundle
rm -rf /usr/include/flipswitch
rm -f  /usr/lib/libflpswitch.dylib

# Cleanup files from the "Floating Dock" package.
rm -f /private/var/mobile/Library/Preferences/com.imkpatil.floatingdock.plist

# Cleanup files from the "FloatyDock" package.
rm -f /private/var/mobile/Library/Preferences/com.synnyg.floatydockprefs.plist

# Cleanup files from the "FrontPage" package.
rm -f  /private/var/mobile/Documents/FrontPage.plist
rm -rf /private/var/mobile/Library/FrontPageCache
rm -f  /private/var/mobile/Library/Preferences/com.junesiphone.frontpage.plist

# Cleanup files from the "Gawk" package.
rm -f  /etc/profile.d/gawk.csh
rm -f  /etc/profile.d/gawk.sh
rm -f  /usr/bin/awk
rm -f  /usr/bin/gawk
rm -f  /usr/include/gawkapi.h
rm -rf /usr/lib/gawk
rm -rf /usr/libexec/awk
rm -rf /usr/share/awk

# Cleanup files from the "GIT" package.
rm -f  /usr/bin/git
rm -f  /usr/bin/git-cvsserver
rm -f  /usr/bin/git-receive-pack
rm -f  /usr/bin/git-shell
rm -f  /usr/bin/git-upload-archive
rm -f  /usr/bin/gitk
rm -rf /usr/libexec/git-core
rm -rf /usr/share/git-core
rm -rf /usr/share/gitk

# Cleanup files from the "GNU Cryptography" package.
rm -f  /usr/bin/dumpsexp
rm -f  /usr/bin/hmac256
rm -f  /usr/bin/libgcryptconfig
rm -f  /usr/bin/mpicalc
rm -f  /usr/include/gcrypt.h
rm -f  /usr/lib/libgcrypt.20.dylib
rm -f  /usr/lib/libgcrypt.dylib
rm -f  /usr/lib/libgcrypt.la
rm -rf /usr/share/aclocal
rm -f  /usr/share/aclocal/libgcrypt.m4

# Cleanup files from the "GNUPG Errors" package.
rm -f  /usr/bin/gpg-error
rm -f  /usr/bin/gpg-error-config
rm -f  /usr/include/gpg-error.h
rm -f  /usr/include/gpgrt.h
rm -f  /usr/lib/libgpg-error.0.dylib
rm -f  /usr/lib/libgpg-error.dylib
rm -f  /usr/lib/libgpg-error.la
rm -rf /usr/share/aclocal
rm -f  /usr/share/aclocal/gpg-error.m4
rm -rf /usr/share/common-lisp
rm -rf /usr/share/libgpg-error
rm -f  /usr/share/libgpg-error/errorref.txt

# Cleanup files from the "GnuPG 2" package.
rm -f  /usr/bin/dirmngr
rm -f  /usr/bin/dirmngr-client
rm -f  /usr/bin/gpg-agent
rm -f  /usr/bin/gpg-connect-agent
rm -f  /usr/bin/gpg2
rm -f  /usr/bin/gpgconf
rm -f  /usr/bin/gpgparsemail
rm -f  /usr/bin/gpgscm
rm -f  /usr/bin/gpgsm
rm -f  /usr/bin/gpgtar
rm -f  /usr/bin/gpgv2
rm -f  /usr/bin/kbxutil
rm -f  /usr/bin/watchgnupg
rm -f  /usr/libexec/gpg-check-pattern
rm -f  /usr/libexec/gpg-preset-passphrase
rm -f  /usr/libexec/gpg-protect-tool
rm -f  /usr/libexec/gpg-wks-client
rm -f  /usr/libexec/scdaemon
rm -f  /usr/sbin/addgnupghome
rm -f  /usr/sbin/applygnupgdefaults

# Cleanup files from the "GNU Privacy Guard" package.
rm -f  /usr/bin/gpg
rm -f  /usr/bin/gpg-zip
rm -f  /usr/bin/gpgsplit
rm -f  /usr/bin/gpgv
rm -rf /usr/libexec/gnupg

# Cleanup files from the "GPSCheat" package.
rm -rf /Library/Switches/GPSCheatSwitch.bundle
rm -f  /private/var/mobile/Documents/favorites.plist
rm -f  /private/var/mobile/Library/Preferences/com.zx.GPSCheatData.plist
rm -f  /private/var/mobile/Library/Preferences/com.zx.GPSCheatSettings.plist

# Cleanup files from the "Grep" package.
rm -f /bin/egrep
rm -f /bin/fgrep
rm -f /bin/grep

# Cleanup files from the "gzip" package.
rm -f /bin/gunzip
rm -f /bin/gzexe
rm -f /bin/gzip
rm -f /bin/uncompress
rm -f /bin/zcat
rm -f /bin/zcmp
rm -f /bin/zdiff
rm -f /bin/zegrep
rm -f /bin/zfgrep
rm -f /bin/zforce
rm -f /bin/zgrep
rm -f /bin/zless
rm -f /bin/zmore
rm -f /bin/znew

# Cleanup files from the iCleaner package.
rm -rf /Applications/iCleaner.app
rm -rf /Library/Activator/Listeners
rm -rf /Library/Switches/ICClean.bundle
rm -rf /Library/Switches/ICCleanNP.bundle
rm -f  /usr/bin/icleaner
rm -rf /var/mobile/Library/iCleaner
rm -rf /var/mobile/Library/Caches/com.exile90.icleanerpro
rm -f  /var/root/Library/Preferences/com.applovin.sdk.y7Dm.plist
rm -f  /var/root/Library/Preferences/com.exile90.icleanerpro.plist
rm -rf /var/tmp/com.exile90.icleanerpro

# Cleanup files from the "Icon Renamer" package.
rm -f /private/var/mobile/Library/Preferences/ch.rpetri.iconrenamer.plist

# Cleanup files from the "Iconoclasm" package.
rm -rf /Library/Iconoclasm
rm -f  /private/var/mobile/Library/Preferences/net.r-ch.iconoclasm.plist
rm -rf /System/Library/PreferenceBundles/IconoclasmPrefs.bundle

# Cleanup files from the "Iconsupport" package.
rm -rf /Library/Application Support/IconSupport
rm -rf /private/var/mobile/Library/Application Support/IconSupport

# Cleanup files from the "Inet-Utils" package.
rm -f /usr/bin/dnsdomainname
rm -f /usr/bin/ftp
rm -f /usr/bin/hostname
rm -f /usr/bin/ifconfig
rm -f /usr/bin/logger
rm -f /usr/bin/ping
rm -f /usr/bin/ping6
rm -f /usr/bin/rcp
rm -f /usr/bin/rexec
rm -f /usr/bin/rlogin
rm -f /usr/bin/rsh
rm -f /usr/bin/talk
rm -f /usr/bin/telnet
rm -f /usr/bin/tftp
rm -f /usr/bin/traceroute
rm -f /usr/bin/whois
rm -f /usr/libexec/ftpd
rm -f /usr/libexec/inetd
rm -f /usr/libexec/rexecd
rm -f /usr/libexec/rlogind
rm -f /usr/libexec/rshd
rm -f /usr/libexec/syslogd
rm -f /usr/libexec/talkd
rm -f /usr/libexec/telnetd
rm -f /usr/libexec/tftpd
rm -f /usr/libexec/uucpd

# Cleanup files from the "iPhone Firmware (/sbin)" package.
# IMPORTANT - Don't actually run these!  These are in a stock .ipsw.
# ALL of these files must actually remain on the file system.
# rm -f /sbin/fsck
# rm -f /sbin/fsck_apfs  
# rm -f /sbin/fsck_hfs
# rm -f /sbin/fstyp
# rm -f /sbin/fstyp_hfs
# rm -f /sbin/mount
# rm -f /sbin/mount_apfs
# rm -f /sbin/mount_hfs
# rm -f /sbin/newfs_apfs
# rm -f /sbin/newfs_hfs
# rm -f /sbin/pfctl
# rm -f /sbin/umount
# rm -f /usr/sbin/nvram

# Cleanup files from the "KSBA" package.
rm -f  /usr/bin/ksba-config
rm -f  /usr/include/ksba.halt
rm -f  /usr/lib/libksba.8.dylib
rm -f  /usr/lib/libksba.dylib
rm -f  /usr/lib/libksba.la
rm -rf /usr/share/aclocal
rm -f  /usr/share/aclocal/ksba.m4

# Cleanup files from the "less" package.
rm -f /usr/bin/less
rm -f /usr/bin/lessecho
rm -f /usr/bin/lesskey
rm -f /usr/bin/more

# Cleanup files from the "libColorPicker" package.
rm -f /private/var/mobile/Library/Preferences/com.pixelfiredev.libcolorpicker.plist
rm -f /usr/lib/libcolorpicker.dylib

# Cleanup files from the "libCrashReport" package.
rm -rf /usr/include/libcrashreport
rm -f  /usr/lib/libcrashreport.dylib

# Cleanup files from the "Liberty" and "Liberty Lite" package.
rm -f /private/var/mobile/Library/Preferences/com.ryleyangus.liberty.plist
rm -f /private/var/mobile/Library/Preferences/com.ryleyangus.libertylite.plist
rm -f /usr/lib/Liberty.dylib

# Cleanup files from the "libPackageInfo" package.
rm -rf /usr/include/libpackageinfo
rm -f  /usr/lib/libpackageinfo.dylib

# Cleanup files from the "libSymbolicate" package.
rm -rf /usr/include/libsymbolicate
rm -f  /usr/lib/libsymbolicate.dylib

# Cleanup files from the "Link Identity Editor" package.
rm -f /usr/bin/ldid

# Cleanup files from the "LittleX" package.
rm -f /private/var/mobile/Library/Preferences/com.ioscreatix.littlex.plist

# Cleanup files from the "LocalIAPStore" package.
rm -f /private/var/mobile/Library/Preferences/anondev.LocalIAPStore.plist

# Cleanup files from the "Lockplus" package.
rm -rf /Library/LockPlus
rm -rf /private/var/mobile/Documents/lockplusfonts
rm -rf /private/var/mobile/Library/LockPlus
rm -f  /private/var/mobile/Library/Preferences/com.junesiphone.lockplus.plist

# Cleanup files from the "lsof" package.
rm -f /usr/sbin/lsof

# Cleanup files from the "make" package.
rm -f /usr/bin/make
rm -f /usr/include/gnumake.h

# Cleanup files from the "Moveable9" package.
rm -rf /private/var/mobile/Library/Preferences/Moveable
rm -f  /private/var/mobile/Library/Preferences/net.tateu.moveable9.plist
rm -f  /private/var/mobile/Library/Preferences/net.tateu.moveable9.profileswitcher.plist

# Cleanup files from the Nano package.
rm -f  /etc/nanorc
rm -f  /etc/profile.d/nano.sh
rm -f  /usr/bin/nano
rm -f  /usr/bin/rnano
rm -rf /usr/share/nano

# Cleanup files from the "Network-Cmds" package.
rm -f /sbin/netstat
rm -f /sbin/route
rm -f /usr/libexec/kdumpd
rm -f /usr/sbin/arp
rm -f /usr/sbin/ndp
rm -f /usr/sbin/traceroute6

# Cleanup files from the "New Curses" package.
rm -f  /usr/bin/captoinfo
rm -f  /usr/bin/clear
rm -f  /usr/bin/infocmp
rm -f  /usr/bin/infotocap
rm -f  /usr/bin/ncurses5-config
rm -f  /usr/bin/ncurses6-config
rm -f  /usr/bin/ncursesw5-config
rm -f  /usr/bin/ncursesw6-config
rm -f  /usr/bin/reset
rm -f  /usr/bin/tabs
rm -f  /usr/bin/tic
rm -f  /usr/bin/toe
rm -f  /usr/bin/tput
rm -f  /usr/bin/tset
rm -f  /usr/include/curses.h
rm -f  /usr/include/eti.h
rm -f  /usr/include/form.h
rm -f  /usr/include/menu.h
rm -f  /usr/include/nc_tparm.h
rm -f  /usr/include/ncurses.h
rm -f  /usr/include/ncurses_dll.h
rm -f  /usr/include/panel.h
rm -f  /usr/include/term.h
rm -f  /usr/include/term_entry.h
rm -f  /usr/include/termcap.h
rm -f  /usr/include/tic.h
rm -f  /usr/include/unctrl.h
rm -f  /usr/lib/libcurses.a
rm -f  /usr/lib/libform.a
rm -f  /usr/lib/libform_g.a
rm -f  /usr/lib/libmenu.a
rm -f  /usr/lib/libmenu_g.a
rm -f  /usr/lib/libncurses.a
rm -f  /usr/lib/libncurses_g.a
rm -f  /usr/lib/libpanel.a
rm -f  /usr/lib/libpanel_g.a
rm -f  /usr/lib/terminfo
rm -rf /usr/share/tabset
rm -rf /usr/share/terminfo

# Cleanup files from the "New GNU Portable Threads" package.
rm -f  /usr/bin/npth-config
rm -f  /usr/include/npth.h
rm -f  /usr/lib/libnpth.0.dylib
rm -f  /usr/lib/libnpth.dylib
rm -f  /usr/lib/libnpth.la
rm -rf /usr/share/aclocal
rm -f  /usr/share/aclocal/npth.m4

# Cleanup files from the "NFCWriter" package.
rm -rf /Applications/NFCWriter.app
rm -f  /usr/lib/NFCWritPass.dylib
rm -f  /var/mobile/Library/Preferences/net.limneos.nfcwriter.license
rm -f  /var/mobile/Library/Preferences/nfcd.plist

# Cleanup files from the "Nghttp2" package.
rm -rf /usr/include/nghttp2
rm -f  /usr/lib/libnghttp2.14.dylib
rm -f  /usr/lib/libnghttp2.dylib
rm -f  /usr/lib/libnghttp2.la
rm -f  /usr/lib/pkgconfig/libnghttp2.pc

# Cleanup files from the "OpenSSH" package.
rm -rf /etc/ssh
rm -f  /usr/bin/scp
rm -f  /usr/bin/sftp
rm -f  /usr/bin/ssh
rm -f  /usr/bin/ssh-add
rm -f  /usr/bin/ssh-agent
rm -f  /usr/bin/ssh-keygen
rm -f  /usr/bin/ssh-keyscan
rm -f  /usr/libexec/sftp-server
rm -f  /usr/libexec/ssh-keysign
rm -f  /usr/libexec/ssh-pkcs11-helper
rm -f  /usr/sbin/sshd
rm -rf /var/empty

# Cleanup files from the "OpenSSL" package.
rm -rf /etc/ssl
rm -f  /usr/bin/c_rehash
rm -f  /usr/bin/openssl
rm -rf /usr/include/openssl
rm -rf /usr/lib/engines/*
rm -f  /usr/lib/libcrypto.1.0.0.dylib
rm -f  /usr/lib/libcrypto.a
rm -f  /usr/lib/libcrypto.dylib
rm -f  /usr/lib/libssl.1.0.0.dylib
rm -f  /usr/lib/libssl.a
rm -f  /usr/lib/libssl.dylib
rm -rf /usr/lib/pkgconfig
rm -r  /usr/lib/pkgconfig/libcrypto.pc
rm -r  /usr/lib/pkgconfig/libssl.pc
rm -r  /usr/lib/pkgconfig/openssl.pc
rm -rf /usr/lib/ssl

# Cleanup files from the "Patch" package.
rm -f /usr/bin/patch

# Cleanup files from the "Pincrush" package.
rm -f /usr/bin/pincrush

# Cleanup files from the "PreferenceLoader" package.
rm -f /usr/include/libprefs/prefs.h
rm -f /usr/lib/libprefs.dylib

# Cleanup files from the "Profile Directory" package.
rm -f  /etc/profile
rm -rf /etc/profile.d

# Cleanup files from the "ReformX" package.
rm -rf /Applications/ReformX.app
rm -rf /Library/Application Support/ReformX
rm -f  /private/var/mobile/Library/Preferences/com.zestlabs.reformx.current.plist
rm -f  /private/var/mobile/Library/Preferences/com.zestlabs.reformx.plist

# Cleanup files from the "Rocketbootstrap" package.
rm -f /usr/include/rocketbootstrap.h
rm -f /usr/include/rocketbootstrap_dynamic.h
rm -f /usr/lib/librocketbootstrap.dylib
rm -r /usr/libexec/_rocketd_reenable
rm -r /usr/libexec/rocketd

# Cleanup files from the "Rsync" package.
rm -f /usr/bin/rsync

# Cleanup files from the "Screen" package.
rm -f  /usr/bin/screen
rm -rf /usr/share/screen

# Cleanup files from the "Sed" package.
rm -f /bin/sed

# Cleanup files from the "SemiRestore11-Lite" package.
rm -f /usr/bin/SemiRestore11-Lite

# Cleanup files from the "Send Test Bulletin" package.
rm -f /usr/bin/stb

# Cleanup files from the "ShellCmds" package.
rm -f /usr/bin/killall
rm -f /usr/bin/renice
rm -f /usr/bin/script
rm -f /usr/bin/time
rm -f /usr/bin/which

# Cleanup files from the "Smart Low Power Mode" package.
rm -f /private/var/mobile/Library/Preferences/com.smokin1337.smartlpm.plist

# Cleanup files from the "Socket Cat" package.
rm -f /usr/bin/filan
rm -f /usr/bin/procan
rm -f /usr/bin/socat

# Cleanup files from the "SpringPlus" package.
rm -f /private/var/mobile/Library/Preferences/com.rishanan.springpref.plist

# Cleanup files from the "SSH Toggle and Port" package.
rm -rf /Library/ControlCenter/Bundles/SSHonCC.bundle
rm -f  /usr/bin/SSHswitch

# Cleanup files from the "Substitute" package.
rm -f /usr/lib/libsubstitute.0.dylib
rm -f /usr/lib/libsubstitute.dylib

# Cleanup files from the "Substrate Compatibility Layer" package.
rm -rf /Library/Frameworks/CydiaSubstrate.framework
rm -f  /usr/lib/libsubstrate.dylib

# Cleanup files from the "Sudo" package.
rm -f  /etc/sudoers
rm -rf /etc/sudoers.d
rm -f  /usr/bin/sudo
rm -f  /usr/bin/sudoedit
rm -f  /usr/bin/sudoreplay
rm -f  /usr/include/sudo_plugin.h
rm -rf /usr/libexec/sudo
rm -f  /usr/sbin/visudo
rm -rf /var/db/sudo
rm -rf /var/run/sudo

# Cleanup files from the "SwipeForMore" package.
rm -f /private/var/mobile/Library/Preferences/com.PS.SwipeForMore.plist

# Cleanup files from the "System-Cmds" package.
rm -f /bin/sync
rm -f /sbin/dmesg
rm -f /sbin/dynamic_pager
rm -f /sbin/halt
rm -f /sbin/nologin
rm -f /sbin/reboot
rm -f /usr/bin/arch
rm -f /usr/bin/getconf
rm -f /usr/bin/getty
rm -f /usr/bin/hostinfo
rm -f /usr/bin/login
rm -f /usr/bin/pagesize
rm -f /usr/bin/passwd
rm -f /usr/sbin/ac
rm -f /usr/sbin/accton
rm -f /usr/sbin/halt
rm -f /usr/sbin/iostat
rm -f /usr/sbin/mkfile
rm -f /usr/sbin/pwd_mkdb
rm -f /usr/sbin/reboot
rm -f /usr/sbin/sysctl
rm -f /usr/sbin/vifs
rm -f /usr/sbin/vipw
rm -f /usr/sbin/vsdbutil
rm -f /usr/sbin/zdump
rm -f /usr/sbin/zic

# Cleanup files from the "Tape Archive" package.
rm -f /bin/gtar
rm -f /bin/tar
rm -f /usr/bin/tar
rm -f /usr/libexec/rmt

# Cleanup files from the "Tech Support Framework" package.
rm -rf /Library/Frameworks/TechSupport.framework

# Cleanup files from the "Top" package.
rm -f /usr/bin/top
rm -f /usr/include/libtop.h
rm -f /usr/lib/libtop.a

# Cleanup files from the "Tweak Injector" package.
rm -rf /Applications/SafeMode.app
rm -rf /Library/TweakInject
rm -f  /usr/lib/TweakInject.dylib
rm -rf /usr/lib/TweakInject

# Cleanup files from the "UIKit Tools" package.
rm -f /usr/bin/cfversion
rm -f /usr/bin/gssc
rm -f /usr/bin/iomfsetgamma
rm -f /usr/bin/ldrestart
rm -f /usr/bin/sbdidlaunch
rm -f /usr/bin/sbreload
rm -f /usr/bin/uiduid
rm -f /usr/bin/uiopen

# Cleanup files from the "Unrar" package.
rm -f /usr/bin/unrar

# Cleanup files from the "Unzip" package.
rm -f /usr/bin/funzip
rm -f /usr/bin/unzip
rm -f /usr/bin/unzipsfx

# Cleanup files from the "UUID Generator" package.
rm -f /usr/bin/uuid
rm -f /usr/bin/uuid-config
rm -f /usr/include/uuid.h
rm -f /usr/lib/libuuid.16.dylib
rm -f /usr/lib/libuuid.dylib
rm -f /usr/lib/pkgconfig/uuid.pc

# Cleanup files from the "Vi IMproved" package.
rm -f  /usr/bin/ex
rm -f  /usr/bin/rview
rm -f  /usr/bin/rvim
rm -f  /usr/bin/vi
rm -f  /usr/bin/view
rm -f  /usr/bin/vim
rm -f  /usr/bin/vimdiff
rm -f  /usr/bin/vimtutor
rm -f  /usr/bin/xxd
rm -rf /usr/share/vim

# Cleanup files from the "WGet" package.
rm -f /etc/wgetrc
rm -f /usr/bin/wget

# Cleanup files from the wifiFirmwareUpdater 
rm -rf /private/var/mobile/updatedWifiFirmware
rm -f  /usr/bin/autoflashwifi
rm -f  /usr/bin/flashwifi
rm -f  /usr/bin/revertwifi

# Cleanup files from the XenHTML package.
rm -rf /Library/Application Support/libGitHubIssues
rm -f  /private/var/mobile/Library/Preferences/com.matchstic.xenhtml.plist
rm -rf /usr/include/uaunbox
rm -f  /usr/lib/libGitHubIssues.dylib
rm -f  /usr/lib/libuaunbox.dylib
rm -f  /usr/libexec/uaunbox
rm -f  /usr/libexec/uaunboxdlaunch
rm -f  /usr/include/libGitHubIssues.h
rm -rf /var/mobile/Library/LockHTML
rm -rf /var/mobile/Library/SBHTML

# Cleanup files from the "XZ Utils" package.
rm -f  /usr/bin/lzcat
rm -f  /usr/bin/lzcmp
rm -f  /usr/bin/lzdiff
rm -f  /usr/bin/lzegrep
rm -f  /usr/bin/lzfgrep
rm -f  /usr/bin/lzgrep
rm -f  /usr/bin/lzless
rm -f  /usr/bin/lzma
rm -f  /usr/bin/lzmadec
rm -f  /usr/bin/lzmainfo
rm -f  /usr/bin/lzmore
rm -f  /usr/bin/unlzma
rm -f  /usr/bin/unxz
rm -f  /usr/bin/xz
rm -f  /usr/bin/xzcat
rm -f  /usr/bin/xzcmp
rm -f  /usr/bin/xzdec
rm -f  /usr/bin/xzdiff
rm -f  /usr/bin/xzegrep
rm -f  /usr/bin/xzfgrep
rm -f  /usr/bin/xzgrep
rm -f  /usr/bin/xzless
rm -f  /usr/bin/xzmore
rm -rf /usr/include/lzma
rm -f  /usr/include/lzma.h
rm -f  /usr/lib/liblzma.a
rm -f  /usr/lib/liblzma.la
rm -rf /usr/lib/pkgconfig
rm -f  /usr/lib/pkgconfig/liblzma.pc
rm -f  /usr/local/lib/liblzma.5.dylib
rm -f  /usr/local/lib/liblzma.dylib

# Cleanup files from the "Youtube Tools" package.
rm -f /private/var/mobile/Library/Preferences/com.justinpetkovic.youtubetools.plist

# Cleanup files from the "Zip" package.
rm -f /usr/bin/zip
rm -f /usr/bin/zipcloak
rm -f /usr/bin/zipnote
rm -f /usr/bin/zipsplit

########################################################################
#                                                                      #
# End custom tweak uninstall area.                                     #
#                                                                      #
########################################################################

# Put the HOSTS file back to default values.
echo "##" > /etc/hosts
echo "# Host Database" >> /etc/hosts
echo "#" >> /etc/hosts
echo "# localhost is used to configure the loopback interface" >> /etc/hosts
echo "# when the system is booting.  Do not change this entry." >> /etc/hosts
echo "##" >> /etc/hosts
echo "127.0.0.1	localhost" >> /etc/hosts
echo "255.255.255.255	broadcasthost" >> /etc/hosts
echo "::1             localhost" >> /etc/hosts

# Removing the last tools, clear the UI cache.
uicache
rm -f /usr/bin/uicache
rm -f /bin/sh
rm -f /bin/rm

# All Done!
echo "WARNING!!!!! All Electra jailbreak files and directories should be deleted."
echo "Rebooting... (Please pray)"
kill 1
