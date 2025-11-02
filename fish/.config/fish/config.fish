starship init fish | source

alias dev="cd ~/dev"

# Abbrevations
abbr -a l "ls -A -l --color=auto"

status --is-interactive; and pyenv init - | source
status --is-interactive; and pyenv virtualenv-init - | source

cd ~/dev

if status is-interactive
  # Commands to run in in interactive mode
end

# # Start ssh-agent automatically
if not pgrep -u (whoami) ssh-agent > /dev/null
    eval (ssh-agent -c)
end

# # Load all keys
ssh-add -l >/dev/null 2>&1
or begin
    ssh-add ~/.ssh/id_ed25519_github_perso
    ssh-add ~/.ssh/id_rsa_server
end

# pnpm
set -gx PNPM_HOME "/home/cletus/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
