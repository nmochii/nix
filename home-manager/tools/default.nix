{pkgs, ...}: {
  imports = [
    ./age.nix
    ./asciinema.nix
    ./bat.nix
    ./dust.nix # du
    ./eza.nix
    ./fd.nix
    ./fzf.nix
    ./gpg.nix
    ./hck.nix # cut
    ./htop.nix
    ./hyperfine.nix # benchmark
    ./imagemagick.nix
    ./ouch.nix # compress / decompress
    ./pik.nix # interactive kill
    ./ripgrep.nix
    ./sd.nix
    ./ssh.nix
    ./tree.nix
    ./typst.nix
    ./yazi.nix
    ./youtube-tui.nix
    ./yt-dlp.nix
    ./viu.nix
    ./zellij.nix
    ./zoxide.nix
  ];

  home.packages = [
    (pkgs.writeShellScriptBin "__show_file_or_dir_preview" ''
      if [ -d "$1" ]; then
        eza --tree --color=always "$1" | head -n 100
      else
        bat -n --color=always --line-range :100 "$1"
      fi
    '')
    (pkgs.writeShellScriptBin "f" ''
      fzf \
        --cycle \
        --preview "command __show_file_or_dir_preview {1}" \
        --preview-window '75%' \
        --bind "enter:become($EDITOR {1})"
    '')
    (pkgs.writeShellScriptBin "fde" ''
      fd -i "''${@}" | fzf \
        --cycle \
        --preview "command __show_file_or_dir_preview {1}" \
        --preview-window 'up,80%,border-bottom' \
        --bind "enter:become($EDITOR {1})"
    '')
    (pkgs.writeShellScriptBin "rge" ''
      if [ "$#" -lt 1 ]; then
        exit 1
      fi
      rg -S --color=ansi --no-heading --line-number "''${@}" | fzf -d':' --ansi \
      --cycle \
      --preview "command bat -p --color=always {1} --highlight-line {2}" \
      --preview-window 'up,80%,border-bottom,+{2}/2' \
      --bind "enter:become($EDITOR +{2} {1})"
    '')
  ];

  home.sessionVariables = {
    FZF_DEFAULT_OPTS = "--layout=reverse --border --cycle";
    FZF_CTRL_T_COMMAND = "fd";
    FZF_CTRL_T_OPTS = "--preview '__show_file_or_dir_preview {}' --preview-window '75%'";
    FZF_ALT_C_COMMAND = "fd --type d";
    FZF_ALT_C_OPTS = "--preview '__show_file_or_dir_preview {}' --preview-window '75%'";
  };
}
