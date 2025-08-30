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
source /nix/store/47884x7zc85qni5i573j0lppdc03wcr2-zoxide-nushell-config.nu

def --env yy [...args] {
  let tmp = (mktemp -t "yazi-cwd.XXXXX")
  yazi ...$args --cwd-file $tmp
  let cwd = (open $tmp)
  if $cwd != "" and $cwd != $env.PWD {
    cd $cwd
  }
  rm -fp $tmp
}

use /nix/store/g548qr1axcxl37f0x90vz52g5ly8j69n-starship-nushell-config.nu

alias "bonsai" = /nix/store/d0gdxnl2rjdv8kpbk0b8bh78zmv6ibd5-cbonsai-1.4.2/bin/cbonsai -lip
alias "cat" = /nix/store/mwg9cw21x0vxj4vlj18kzxdh542a8wml-bat-0.25.0/bin/bat --theme-dark base16
alias "cava" = /nix/store/0xf33gfj5i8ajr3shhz92z0grrmw6m59-cava-0.10.4/bin/cava
alias "cd" = z
alias "gb" = git branch
alias "gc" = git commit -m 
alias "gck" = git checkout
alias "gd" = git add
alias "gm" = git merge
alias "gp" = git push
alias "gs" = git status
alias "l" =  /nix/store/n4aac68x6njws1m93zn6wki8nn8h6i1s-eza-0.23.0/bin/eza --tree --icons --git
alias "ls" = /nix/store/n4aac68x6njws1m93zn6wki8nn8h6i1s-eza-0.23.0/bin/eza --icons --git
alias "matrix" = /nix/store/qwidc11anhrj2a0kpdqkxyk3pbjvz3g4-cmatrix-2.0/bin/cmatrix -C green -m
alias "nhs" = nh home switch
alias "nos" = nh os switch
alias "nosu" = nh os switch -u
alias "pipes" = /nix/store/xkipjf0lmc6cknfdncqm2r6dgsz6448w-pipes-1.3.0/bin/pipes
alias "recorder" = /nix/store/wkhg23hl7h1raags2s88ml6sihswvh0v-wf-recorder-0.5.0/bin/wf-recorder
