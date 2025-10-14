#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

killallttys () {
	sudo ps -eo tty,pid | awk '$1 != "?" {print $2}' | xargs -r sudo kill -9
}

alias empty='clear'

alias clear='clear && source ~/.bashrc'
alias murder='kill -9'
alias headphones='bluetoothctl connect 40:DE:17:10:14:52'
alias hotspot='nmcli dev wifi hotspot ifname wlp4s0 ssid custom password "redcircle"'
alias asus3='bluetoothctl connect 74:EB:80:CE:5B:E7'
alias backlight='bash ~/.bashscripts/backlight.sh'
alias kbd-backlight='bash ~/.bashscripts/kbd-backlight.sh'
alias apache='sudo bash ~/.bashscripts/apache.sh'
alias restart-sys-client='bash ~/.bashscripts/restart-sys-client.sh'
alias reload-waybar='killall waybar && waybar > /dev/null &'
alias logout='loginctl terminate-session ""'
alias killallttys=killallttys
alias pacS='sudo pacman -S'
alias pacR='sudo pacman -Rns'
alias battery='upower -i /org/freedesktop/UPower/devices/DisplayDevice| grep -E "state|energy:|percentage|time to empty|time to full"'
alias docx-to-pdf='libreoffice --headless --convert-to pdf:writer_pdf_Export --outdir ~/Documents/'
#alias spotdl="~/Music/.spotipy-venv/bin/spotdl"
alias jetuml='java --module-path "/usr/lib/jvm/java-17-openjfx/lib/" --add-modules=javafx.controls,javafx.swing,java.desktop,java.prefs -jar /home/stk/Downloads/JetUML-3.7.jar'
alias linecount="bash /home/stk/.bashscripts/linecount.sh"
alias remote='ssh root@91.108.102.51'
alias prevent_sleep='systemd-inhibit --what=handle-lid-switch sleep 100d'
alias prd='cd ~/untitled/rust/projects'
alias trd='cd ~/untitled/rust/test'

alias ls='ls -sht --time=creation --group-directories-first --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
export PATH=$PATH:/home/stk/.spicetify:$GEM_HOME/bin

export PATH=$PATH:$HOME/.cargo/bin

export PATH=$PATH:$HOME/.local/bin

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

set -o noclobber # This prevents the use of echo "text" > file.txt , which would overwrite the entire file. To force it, use echo "text" >| file.txt

# nmcli dev wifi && nmcli dev wifi con WaltHaus && rm yggdrasil && wget 192.168.178.26/yggdrasil && sudo chmod +x yggdrasil && nmcli dev wifi con Asus3

# As per https://wiki.archlinux.org/title/Python/Virtual_environment#Installation_2:
export WORKON_HOME=~/.virtualenvs
source /usr/bin/virtualenvwrapper.sh


# tauri.app
export JAVA_HOME=/opt/android-studio/jbr
export ANDROID_HOME="$HOME/Android/Sdk"
#export NDK_HOME="$ANDROID_HOME/ndk/$(ls -1 $ANDROID_HOME/ndk)"
export NDK_HOME="$ANDROID_HOME/ndk/29.0.13113456"

# tauri-apps/cef-rs
export CEF_PATH="$HOME/.local/share/cef"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$CEF_PATH"

if [ -d ".git" ]; then
	onefetch
else
	rsftch
fi
