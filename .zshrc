# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && . "$HOME/.fig/shell/zshrc.pre.zsh"

# Path
export GOPATH=$HOME/go
export GOROOT=/usr/local/go

# Alias
alias show="defaults write com.apple.Finder AppleShowAllFiles true"
alias hide="defaults write com.apple.Finder AppleShowAllFiles false"
alias addhttp="perl -pi -e 'print "https://"' "
alias githound="echo "$1" | git-hound --dig-files --dig-commits --many-results --regex-file key.txt --results-only > api_tokens.txt"
alias ls="exa --icons --group-directories-first"
alias ll="exa --icons --group-directories-first -l"
alias g="goto"
alias grep='grep --color'


# Oneliners for finding bugs
s3ls(){
aws s3 ls s3://$1
}

s3cp(){
aws s3 cp $2 s3://$1
}

ipinfo(){
curl http://ipinfo.io/$1
}

ssrf(){
        screen -S int -dm bash -c "interactsh-client -o found.txt 2> >(tee a.txt); exec sh"; sleep 5; cat a.txt | grep "oast" | awk '{print $NF}' | xargs -I % sh -c 'cat hosts.txt | gauplus | uro | grep "=http" | qsreplace % | httpx -fr';  sleep 5; screen -X -S int quit; rm a.txt
}

# Automation Script
enum(){
        mkdir $1
	cd $1
        subfinder -silent -d "$1" -o domains
        cat domains | anew domains.txt
        rm domains
        amass enum -brute -active --passive -d "$1" -o domains
        cat domains | anew domains.txt
        rm domains
        cat domains.txt | puredns resolve -r ~/Tools/resolvers.txt | tee resolvedsubdomains.txt
        naabu -silent -l resolvedsubdomains.txt -o portscan.txt
        cat portscan.txt | httpx -silent -o hosts.txt
	osascript \
        -e 'tell application "iTerm2" to tell current window to set newWindow to (create tab with default profile)'\
        -e 'tell application "iTerm2" to tell current session of newWindow to write text "cd '`pwd`' && cat hosts.txt | gowitness file -f - && gowitness report serve"'\
        -e 'tell application "iTerm2" to tell current window to set newWindow to (create tab with default profile)'\
        -e 'tell application "iTerm2" to tell current session of newWindow to write text "cd '`pwd`' && open http://localhost:7171 && exit"'\
        -e 'tell application "iTerm2" to tell current window to set newWindow to (create tab with default profile)'\
        -e 'tell application "iTerm2" to tell current session of newWindow to write text "cd '`pwd`' && dirsearch -l hosts.txt -t 20 -x 500 -e asp,aspx,htm,html,gz,tgz,zip,txt,php,pl,tar,action,do --exclude-status=301,400-999"'\
        #-e 'tell application "iTerm2" to tell current window to set newWindow to (create tab with default profile)'\
        #-e 'tell application "iTerm2" to tell current session of newWindow to write text "echo '$1' | git-hound"'\
        #-e 'tell application "iTerm2" to tell current window to set newWindow to (create tab with default profile)'\
        #-e 'tell application "iTerm2" to tell current session of newWindow to write text "kr scan '$1' -A=apiroutes-210228:20000 -x 10 --ignore-length=34x"'\
        #-e 'tell application "iTerm2" to tell current window to set newWindow to (create tab with default profile)'\
        #-e 'tell application "iTerm2" to tell current session of newWindow to write text "cd '`pwd`' && cat host.txt | waybackurls > para.txt"'\
        #cat test.txt | gf xss | sed ‘s/=.*/=/’ | sed ‘s/URL: //’ | tee testxss.txt
        #-e 'tell application "iTerm2" to tell current session of newWindow to write text "dalfox file para.txt -b hackerspider1.xss.ht pipe"'\
	nuclei -silent -l hosts.txt -t ~/nuclei-templates/ -markdown-export vuln
	code vuln/
	#jaeles scan -s ~/.jaeles/ -U hosts.txt
	#for i in $(cat hosts.txt); do ffuf -u $i/FUZZ -w ~/Documents/bugbounty/wordlist/dir.txt -ac -c -e php,txt,asp,html,aspx; done
}


#Plugins
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# find out which distribution we are running on
LFILE="/etc/*-release"
MFILE="/System/Library/CoreServices/SystemVersion.plist"
if [[ -f $LFILE ]]; then
  _distro=$(awk '/^ID=/' /etc/*-release | awk -F'=' '{ print tolower($2) }')
elif [[ -f $MFILE ]]; then
  _distro="macos"
fi

# set an icon based on the distro
# make sure your font is compatible with https://github.com/lukas-w/font-logos
case $_distro in
    *kali*)                  ICON="ﴣ";;
    *arch*)                  ICON="";;
    *debian*)                ICON="";;
    *raspbian*)              ICON="";;
    *ubuntu*)                ICON="";;
    *elementary*)            ICON="";;
    *fedora*)                ICON="";;
    *coreos*)                ICON="";;
    *gentoo*)                ICON="";;
    *mageia*)                ICON="";;
    *centos*)                ICON="";;
    *opensuse*|*tumbleweed*) ICON="";;
    *sabayon*)               ICON="";;
    *slackware*)             ICON="";;
    *linuxmint*)             ICON="";;
    *alpine*)                ICON="";;
    *aosc*)                  ICON="";;
    *nixos*)                 ICON="";;
    *devuan*)                ICON="";;
    *manjaro*)               ICON="";;
    *rhel*)                  ICON="";;
    *macos*)                 ICON="";;
    *)                       ICON="";;
esac

export STARSHIP_DISTRO="$ICON"

# Load Starship
eval "$(starship init zsh)"

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && . "$HOME/.fig/shell/zshrc.post.zsh"
