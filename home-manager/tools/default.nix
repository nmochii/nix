{
  config,
  lib,
  ...
}: {
  imports = [
    ./age.nix
    ./asciinema.nix
    ./bat.nix
    ./difftastic.nix
    ./dust.nix # du
    ./eza.nix
    ./fd.nix
    ./fzf.nix
    ./gpg.nix
    ./hck.nix # cut
    ./htop.nix
    ./hyperfine.nix # benchmark
    ./imagemagick.nix
    ./jq.nix
    ./ouch.nix # compress / decompress
    ./oyo.nix # another diff
    ./pik.nix # interactive kill
    ./posting.nix
    ./ripgrep.nix
    ./sd.nix
    ./ssh.nix
    ./topgrade.nix
    ./tree.nix
    ./typst.nix
    ./viu.nix # image viewer
    ./xleak.nix # excel
    ./yazi.nix
    ./youtube.nix
    ./yt-dlp.nix
    ./zellij.nix # tmux like
    ./zoxide.nix
  ];

  config = lib.mkIf config.modules.tools.enable {
    home.sessionPath = [
      "${config.home.homeDirectory}/.local/bin"
    ];
  };
}
