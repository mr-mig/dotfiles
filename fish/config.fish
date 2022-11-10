# set -x JAVA_HOME (/usr/libexec/java_home -v 1.7)
set -x GOPATH $HOME/dev/msft/gospace
set -x PATH $GOPATH/bin /usr/local/share/npm/bin /usr/local/opt/ruby/bin /usr/local/bin /usr/local/sbin $PATH ~/bin
set -x VISUAL "code --wait"
set -x EDITOR "code --wait"
set -x CHROME_BIN "/Applications/Browser/Google Chrome.app/Contents/MacOS/Google Chrome"

alias ..="cd .."
alias ...="cd ../.."

alias ls="exa"
alias la="ls -Glah"

alias old_dusage="du -h -d 0 * | sort -h -r"
alias dusage="dust -rs"
alias whereismyspace="ncdu -x"

###
#  git
###

# committing
alias ga="git add"
alias gcma="git commit -a -m"
alias gcm="git commit -m"
alias gst="git status -sb --ignore-submodules"

# sync
alias gp="git push"
alias gpl="git pull"
alias gpom="git pull origin master"
alias gpt="git push --tags"
alias gppt="git push; git push --tags"
alias undopush="git push -f origin HEAD^:master"
alias gu="git add -u . ; gst"
alias gut="git add -u :/ ; gst"

# branching
alias gb="git branch"
alias gcb="git checkout -b"
alias gfu="git fetch upstream"
alias gfum="git fetch upstream master"
alias grm="git rebase master"
alias grum="git rebase upstream/master"
alias gc="git checkout"

alias gclean="git branch --merged master | grep -v \"\* master\" | xargs -n 1 git branch -d"

# history
alias gg="git log --oneline --abbrev-commit --all --graph --decorate --color"


alias imerge="idea"
alias idiff="idea diff"


###
#  docker
###
alias da="docker attach"
alias dps="docker ps"
alias drm="docker rm"
alias drma="drm -f (dps -aq)"

alias dcu="docker-compose up"
alias dcps="docker-compose ps"
alias dcb="docker-compose build"

alias jumphost="ssh -i ~/.ssh/eu-west-1-brainly.pem ubuntu@52.17.16.15 -D 1234"
alias wundertunnel="ssh -Nf -L 8181:localhost:80 snowy-bird-mgmt.eastus.cloudapp.azure.com -p 2200"

###
# rails
##

alias r="bin/rails"
alias rg="bin/rails generate"



## docker-machine automatic IP update

#if command -v docker-machine
#	if [ (docker-machine status dev) != "Running" ]
#
#		# start docker-machine
#		docker-machine start dev
#
#		# put VM ip into /etc/hosts
#		sudo sed -i '' '/docker/ d' /etc/hosts
#		set boot2docker_vm_ip (docker-machine ip dev)
#		echo "$boot2docker_vm_ip docker" | sudo tee -a /etc/hosts
#
#		# set all env variables for docker-machine
#		set shinit (docker-machine env dev)
#		for i in (seq (count $shinit))
#	       eval $shinit[$i]
#		end
#	end
#end

# nvm use default

# status --is-interactive; and source (rbenv init -|psub)
