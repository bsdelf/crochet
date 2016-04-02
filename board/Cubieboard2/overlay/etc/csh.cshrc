# $FreeBSD: releng/10.2/etc/csh.cshrc 50472 1999-08-27 23:37:10Z peter $
#
# This file is sourced by all shells, login and non-login shells.
# Some shells such as scp and rcp don't like any output, so make sure
# this file doesn't display anything, or bad things will happen!
#
# Note that this is the first file the shell reads, hence for login
# shells, the PATH is not yet set!


bindkey '\e[1~' beginning-of-line  # Home
bindkey '\e[3~' delete-char        # Delete
bindkey '\e[4~' end-of-line        # End
bindkey -k up history-search-backward
bindkey -k down history-search-forward

set cr = "%{\e[31m%}"
set cg = "%{\e[32m%}"
set c0 = "%{\e[0m%}"

# Set some variables for interactive shells
if ( $?prompt ) then
    if ( "$uid" == "0" ) then
	set prompt = "%B%n@%m.$cr%l$c0%b %c2 %B%#%b "
    else
	set prompt = "%B%n@%m.$cg%l$c0%b %c2 %B%%%b "
    endif
endif

# Setup a default MAIL variable
if ( -f /var/mail/$USER ) then
    setenv MAIL /var/mail/$USER
    set mail = $MAIL
endif

setenv DISTDIR "/usr/dists"
setenv WRKDIRPREFIX "/tmp" # for generic purpose
#setenv WRKDIRPREFIX "/usr/work" # for large work
setenv PKG_TMPDIR "/tmp"

setenv BLOCKSIZE K
setenv PAGER less
#setenv LD_LIBRARY_PATH "/usr/local/lib"
setenv LSCOLORS ExGxFxdxCxegedabagExEx
setenv CLICOLOR yes
setenv EDITOR vim
setenv GREP_OPTIONS --color=auto
setenv XMODIFIERS @im=fcitx
setenv QT_IM_MODULE xim
setenv GTK_IM_MODULE xim

# Go
setenv GOOS freebsd
setenv GOARCH amd64
setenv GOROOT /usr/local/go

set path = (/sbin /bin /usr/sbin /usr/bin /usr/local/bin /usr/games /usr/local/sbin /usr/bin $HOME/bin /usr/local/kde4/bin /zfs/app/bin) 
set autolist
set correct = cmd
#set noclobber

set history = 200
set savehist = 25
set histfile = ~/.histroy_`tty | sed -e 's/\//_/g'`

setenv FTP_TIMEOUT 10
setenv HTTP_TIMEOUT 10

alias restart 'shutdown -r now'
alias ..    'cd ..'
alias ...   'cd ../../'
alias ....  'cd ../../../'
alias -	    'cd -'
alias rm    'rm'
alias del   'rm -ir'
alias mv    'mv'
alias cp    'cp'
alias cls   'clear'
alias ls    'ls -I'
alias la    'ls -a'
alias ll    'ls -h -l -D "[%Y-%m-%d|%H:%M:%S]"'
alias ll-date    'ls -h -l -D "[%Y-%m-%d|%H:%M:%S]" | sort -k6'
alias lr    'ls -R' 
alias dh        'df -h -T'
alias dh-tmp    'df -h -T /tmp'
alias fm    'free -m'
alias ds    'du -shc'
alias dsa    'du -shcA'
alias mkcd  'mkdir \!^; cd \!^'
alias top 'top -P'
alias top-res 'top -o res'
alias top-io 'top -m io'
alias cd-work 'cd `make -V WRKSRC`'

alias ipfw-reload   'sh /etc/ipfw.rules'
alias ipfw-show     'ipfw show'

alias find-c	'find . -name "*.h" -o -name "*.c"'
alias find-x	'find . -name "*.h" -o -name "*.hpp" -o -name "*.cpp" -o -name "*.cxx" -o -name "*.cc"'
alias find-py	'find . -name ".py"'
alias wc-c	'find . -name "*.h" -o -name "*.c" | xargs wc | sort -k 4'
alias wc-x	'find . -name "*.h" -o -name "*.hpp" -o -name "*.cpp" -o -name "*.cxx" -o -name "*.cc" | xargs wc | sort -k 4'
alias wc-py	'find . -name "*.py" | xargs wc | sort -k 4'

alias reload-rc.conf 'sh /etc/rc'
alias reload-cshrc 'unalias * && source /etc/csh.cshrc'
alias edit-xorg.conf    'vim /etc/xorg.conf'
alias edit-ipfw.rules   'vim /etc/ipfw.rules'
alias edit-csh.cshrc    'vim /etc/csh.cshrc'
alias edit-make.conf    'vim /etc/make.conf'
alias edit-src.conf     'vim /etc/src.conf'
alias edit-rc.conf      'vim /etc/rc.conf'
alias edit-loader.conf  'vim /boot/loader.conf'
alias edit-kern.conf    'vim /etc/kernconf/ThinkPad10'
alias edit-vimrc        'vim /usr/local/etc/vim/vimrc'
alias edit-font         'vim /usr/local/etc/fonts/local.conf'
alias edit-nginx        'vim /usr/local/etc/nginx/nginx.conf'
alias diff-kernconf     'vimdiff /etc/kernconf/ThinkPad10 /usr/src/sys/amd64/conf/GENERIC'

alias setlocale-zhcn 'setenv LC_ALL zh_CN.UTF-8 && setenv LANG zh_CN.UTF-8'
alias setlocale-c    'setenv LC_ALL C'

alias sx-cn 'setenv LC_ALL zh_CN.GBK && setenv LANG zh_CN.GBK && startx && setenv LC_ALL C'
alias sx 'setenv LC_ALL zh_CN.UTF-8 && setenv LANG zh_CN.UTF-8 && startx && setenv LC_ALL C'

alias lt    'tree -N -C'
alias l2    'tree -N -C -L 2'
alias l3    'tree -N -C -L 3'
alias l4    'tree -N -C -L 4'
alias l5    'tree -N -C -L 5'
alias l6    'tree -N -C -L 6'
alias v	    'vim'
alias e	    'emacs'
alias t	    'tmux'
alias ta    'tmux attach'
alias td    'tmux detach'
alias getbook	'wget -c -r -np -k'
alias ssh-home	'ssh raphael.vicp.cc -l root'
alias lft-phome	'lftp raphael.vicp.cc -u syh,syh'
alias ftp-home   'ftp ftp://syh:syh@raphael.vicp.cc'
alias scons	'scons -Q -j 4'
alias valgrind-checkmem 'valgrind --tool=memcheck --leak-check=full'
alias ss-restart 'service shadowsocks_libev restart'

alias sudo 'sudo '

alias minstall	'make install clean'
alias mclean	'make clean'
alias moinstall	'make install'

alias periodic-now 'periodic daily weekly monthly'

alias show-arp      'arp -a'
alias show-route    'netstat -r'
alias show-ifstat	'systat -ifstat'
alias show-geom		'gstat'
alias show-thermal	'sysctl dev.acpi_ibm.0.thermal'
alias show-fanspeed	'sysctl dev.acpi_ibm.0.fan_speed'
alias show-cpufreq	'sysctl dev.cpu.0.freq'
alias show-cpulevels	'sysctl dev.cpu.0.freq_levels'
alias show-battery	'sysctl hw.acpi.battery.life && sysctl hw.acpi.battery.time'
alias usbconfig-camera-off 'usbconfig -d 3.2 power_off'
alias usbconfig-bt-off 'usbconfig -d 1.2 power_off'

alias bth-scan 'hccontrol -n ubt0hci inquiry'

alias zfs-io	    'zpool iostat 2'
alias zfs-st	    'zfs-stats -a | less'
alias zfs-ls        'zfs list -t snapshot | sort -k1'
alias zfs-eff       "zfs-stats -ED"
alias zfs-new-swap  'zfs create -V 8G -o org.freebsd:swap=on -o checksum=off -o compression=off -o dedup=off -o sync=disabled -o primarycache=none hdisk/swap'

alias show-smartctl	'smartctl -a /dev/ada0'

alias pkg-search   'pkg_search'
alias pkg-msg      "pkg info -D"

alias port-sync     'portsnap fetch update'
alias port-rebuild  'portmaster -Bd'
alias port-update   'portmaster -w -B -D -a'
alias port-update-specific   'portmaster -w -B -D --update-if-newer'
alias port-clean	'portmaster --clean-distfiles -y'
alias port-notice   '$PAGER /usr/ports/UPDATING'
#alias port-notice   'pkg updating | $PAGER'
alias port-snapshot 'zfs snapshot hdisk/usr.local@`date "+%Y.%m.%d.%H:%M:%S"`\
                     zfs snapshot hdisk/var.db@`date "+%Y.%m.%d.%H:%M:%S"`'

alias port-ver      'make -V PORTVERSION'
alias port-alldep	'make all-depends-list'
alias port-des		"cat ./pkg-descr"
alias port-dep		"echo '[1m[32mBuild depends:[0m' && make build-depends-list|sort \
			         echo '[1m[32mRun depends:[0m' && make run-depends-list|sort  \
			         echo '[1m[31mMissing:[0m' && make missing|sort"
alias port-todo		'portmaster --show-work ./ | sort'
alias pkg-fresh    'pkg version -vl "<"'
alias port-fetchall     'portmaster -a -F'
alias port-forceconfig  'portmaster -a -B --force-config'

alias base-sync     'cd /usr/src && svn up ; cd -'
alias base-log      'cd /usr/src && svn log -v | less ; cd -'
alias base-notice   '$PAGER /usr/src/UPDATING'
alias base-snapshot 'zfs snapshot hdisk/usr.src@r`svnversion /usr/src/`'

alias make-world  'echo "`date "+%H:%M:%S"` making world..." \
                   make -C /usr/src -j3 buildworld > /tmp/make-world.log \
                   echo "`date "+%H:%M:%S"` build completed"'
alias make-kernel 'echo "`date "+%H:%M:%S"` making kernel..." \
                   make -C /usr/src -j3 kernel KERNCONF=ThinkPad > /tmp/make-kernel.log \
                   echo "`date "+%H:%M:%S"` build completed"'
alias install-world 'mergemaster -spF && make -C /usr/src installworld && mergemaster -sF'
alias install-kernel 'make -C /usr/src installkernel KERNCONF=ThinkPad'
alias install-bootcode  'gpart bootcode -b /boot/pmbr -p /boot/gptzfsboot -i 1 ada0'
alias make-kmod   'portmaster -B virtualbox-ose-kmod lsof'
alias make-rm-old 'make -C /usr/src -DBATCH_DELETE_OLD_FILES delete-old delete-old-libs'
alias make-rm-obj 'chflags -R noschg /usr/obj/* && rm -rf /usr/obj/*'
alias make-swap 'zfs create -V 16G -o org.freebsd:swap=on -o checksum=off -o compression=off -o dedup=off -o sync=disabled -o primarycache=none hdisk/swap'

alias update-locatedb   '/etc/periodic/weekly/310.locate'
#alias update-kerntree    'csup -L 2 /etc/supfiles/stable-supfile'

alias hgst	    'hg -v status'
alias hgph	    'hg -v push'
alias hgpl	    'hg -v pull'
alias hgar	    'hg -v addremove'
alias hgci	    'hg -v commit -m'

alias lsof-net  'lsof -Pi'

#source /usr/local/share/tcshrc/tcshrc.complete

# rsync-if-exist dir1/ dir2/
alias rsync-if-exist "rsync -rPhzc --existing" 
# rsync-skip-dot dir1 dir2/
alias rsync-skip-dot "rsync -av --exclude='.*'"
# rsync-mirror dir1/ dir2/
alias rsync-mirror "rsync -av --delete"

