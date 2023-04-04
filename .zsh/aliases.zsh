# Alias
# ---
alias recon="~/.zsh/recon.sh"
alias phishfor="ssh -i ~/.ssh/do -L 3333:0.0.0.0:3333 root@178.62.197.79"
alias gupta="ssh root@5.161.113.249"
alias hack="ssh root@5.161.198.44"
alias show="defaults write com.apple.Finder AppleShowAllFiles true"
alias hide="defaults write com.apple.Finder AppleShowAllFiles false"
alias addhttp="perl -pi -e 'print "https://"' "
alias githound="echo "$1" | git-hound --dig-files --dig-commits --many-results --regex-file key.txt --results-only > api_tokens.txt"
alias python="/opt/homebrew/bin/python3.10"

# mac OS shortcuts
#alias code="open -a 'Visual Studio Code'"

# ALIAS COMMANDS
alias ls="exa --icons --group-directories-first"
alias ll="exa --icons --group-directories-first -l"
alias g="goto"
alias grep='grep --color'

alias cbp="code /home/xcad/obsidianvault/boilerplates"
alias cpr="code /home/xcad/obsidianvault/projects"

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
