{
  config,
  lib,
  ...
}: {
  imports = [
    ./age.nix
    ./asciinema.nix
    ./bat.nix
    ./benchmark.nix
    ./notes.nix
    ./difftastic.nix
    ./dust.nix # du
    ./eilmeldung.nix # rss
    ./eza.nix
    ./fd.nix
    ./fzf.nix
    ./gpg.nix
    ./hck.nix # cut
    ./htop.nix
    ./imagemagick.nix
    ./jq.nix
    ./moor.nix
    ./ouch.nix # compress / decompress
    ./pik.nix # interactive kill
    ./posting.nix
    ./rustnet.nix # network analyzer
    ./ripgrep.nix
    ./sd.nix
    ./ssh.nix
    ./topgrade.nix
    ./tree.nix
    ./typst.nix
    ./viu.nix # image viewer
    ./xleak.nix # excel
    ./yazi.nix
    ./yt-dlp.nix
    ./zellij.nix # tmux like
    ./zoxide.nix
  ];

  config = lib.mkIf config.modules.tools.enable {
    home.sessionPath = [
      "${config.home.homeDirectory}/.local/bin"
    ];
    home.sessionVariables = {
      PAGER = "moor";
    };
  };
}
