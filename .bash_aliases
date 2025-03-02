## files/folders
alias ls=lsd
alias ll="ls -la"
mkcd ()
{
  mkdir -p -- "$1" && cd -P -- "$1"
}

## apt
alias saupd="sudo apt update && apt list --upgradable | less -R"
sai ()
{ 
  sudo apt install "$*" 
}
sas ()
{ 
  sudo apt search "$*" | less -R
}

## git
alias gstat="git status"
alias gdiff="git diff"
alias gai="git add -i"
alias gpu="git push && gs"
alias gf="git fetch && gs"
alias gpl="git pull && gs" 
#gadd ()
#{
#  git add "$*" && gstat
#}
gcm () 
{ 
  git commit -m "$*" && gstat 
}

## etc
alias picard="QT_QPA_PLATFORMTHEME=qt5ct picard"
alias find-missing-artist-pictures="find . -maxdepth 1 -type d -print0 | xargs -0 -I {} sh -c '[ ! -f \"{}\"/artist.jpg ] && echo \"Missing artist.jpg in: {}\"' | sort"
streams-on-twitch ()
{
  streamlink "twitch.tv/$1" "$2" --player mpv
}
alias steam="flatpak run com.valvesoftware.Steam"

# .NET using podman
alias dt-run="podman run --rm -v $(pwd):/app -w /app mcr.microsoft.com/dotnet/sdk:9.0 dotnet run"


# Yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

alias zen="$HOME/bin/zen/zen"
