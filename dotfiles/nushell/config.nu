$env.config.buffer_editor = "nvim"
$env.config.edit_mode = "vi"
$env.config.show_banner = false
$env.config.table.mode = "rounded"

$env.config.color_config = {
  separator: "#665c54"
  leading_trailing_space_bg: "#928374"
  header: "#98971a"
  date: "#b16286"
  filesize: "#458588"
  row_index: "#689d6a"
  bool: "#cc241d"
  int: "#98971a"
  duration: "#cc241d"
  range: "#cc241d"
  float: "#cc241d"
  string: "#928374"
  nothing: "#cc241d"
  binary: "#cc241d"
  cellpath: "#cc241d"
  hints: dark_gray

  shape_garbage: { fg: "#f9f5d7" bg: "#cc241d" }
  shape_bool: "#458588"
  shape_int: { fg: "#b16286" attr: b }
  shape_float: { fg: "#b16286" attr: b }
  shape_range: { fg: "#d79921" attr: b }
  shape_internalcall: { fg: "#689d6a" attr: b }
  shape_external: "#689d6a"
  shape_externalarg: { fg: "#98971a" attr: b }
  shape_literal: "#458588"
  shape_operator: "#d79921"
  shape_signature: { fg: "#98971a" attr: b }
  shape_string: "#98971a"
  shape_filepath: "#458588"
  shape_globpattern: { fg: "#458588" attr: b }
  shape_variable: "#b16286"
  shape_flag: { fg: "#458588" attr: b }
  shape_custom: { attr: b }
}

fastfetch

def --env yy [...args] {
  let tmp = (mktemp -t "yazi-cwd.XXXXX")
  yazi ...$args --cwd-file $tmp
  let cwd = (open $tmp)
  if $cwd != "" and $cwd != $env.PWD {
    cd $cwd
  }
  rm -fp $tmp
}

zoxide init nushell | save -f ~/.zoxide.nu
source ~/.zoxide.nu

mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")

alias bonsai = cbonsai -lip
alias cat = bat --theme-dark base16
alias cava = cava
alias cd = z
alias gb = git branch
alias gc = git commit -m 
alias gck = git checkout
alias gd = git add
alias gm = git merge
alias gp = git push
alias gs = git status
alias l =  eza --tree --icons --git
alias ls = eza --icons --git
alias matrix = cmatrix -C green -m
alias nhs = nh home switch
alias nos = nh os switch
alias nosu = nh os switch -u
alias pipes = pipes
alias recorder = wf-recorder
alias t = tmux
alias u = ame upgrade
alias r = ame remove
alias i = ame install
alias s = ame search
