# Automation Script enum(){
        mkdir $1
	cd $1
        subfinder -silent -d "$1" -o domains cat domains | anew domains.txt rm domains amass enum -brute -active 
        --passive -d "$1" -o domains cat domains | anew domains.txt rm domains cat domains.txt | puredns resolve -r 
        ~/Tools/resolvers.txt | tee resolvedsubdomains.txt naabu -silent -l resolvedsubdomains.txt -o portscan.txt 
        cat portscan.txt | httpx -silent -o hosts.txt
	osascript \
        -e 'tell application "iTerm2" to tell current window to set newWindow to (create tab with default profile)'\
        -e 'tell application "iTerm2" to tell current session of newWindow to write text "cd '`pwd`' && cat hosts.txt 
| gowitness file -f - && gowitness report serve"'\
        -e 'tell application "iTerm2" to tell current window to set newWindow to (create tab with default profile)'\
        -e 'tell application "iTerm2" to tell current session of newWindow to write text "cd '`pwd`' && open 
http://localhost:7171 && exit"'\
        -e 'tell application "iTerm2" to tell current window to set newWindow to (create tab with default profile)'\
        -e 'tell application "iTerm2" to tell current session of newWindow to write text "cd '`pwd`' && dirsearch -l 
hosts.txt -t 20 -x 500 -e asp,aspx,htm,html,gz,tgz,zip,txt,php,pl,tar,action,do --exclude-status=301,400-999"'\
        #-e 'tell application "iTerm2" to tell current window to set newWindow to (create tab with default profile)'\ 
        #-e 'tell application "iTerm2" to tell current session of newWindow to write text "echo '$1' | git-hound"'\ 
        #-e 'tell application "iTerm2" to tell current window to set newWindow to (create tab with default profile)'\
        #-e 'tell application "iTerm2" to tell current session of newWindow to write text "kr scan '$1' 
-A=apiroutes-210228:20000 -x 10 --ignore-length=34x"'\
        #-e 'tell application "iTerm2" to tell current window to set newWindow to (create tab with default profile)'\
        #-e 'tell application "iTerm2" to tell current session of newWindow to write text "cd '`pwd`' && cat host.txt 
| waybackurls > para.txt"'\
        #cat test.txt | gf xss | sed ‘s/=.*/=/’ | sed ‘s/URL: //’ | tee testxss.txt
        #-e 'tell application "iTerm2" to tell current session of newWindow to write text "dalfox file para.txt -b 
hackerspider1.xss.ht pipe"'\
	nuclei -silent -l hosts.txt -t ~/nuclei-templates/ -markdown-export vuln
	code vuln/
	#jaeles scan -s ~/.jaeles/ -U hosts.txt
	#for i in $(cat hosts.txt); do ffuf -u $i/FUZZ -w ~/Documents/bugbounty/wordlist/dir.txt -ac -c -e 
php,txt,asp,html,aspx; done
}
