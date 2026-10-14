{
  config,
  lib,
  ...
}: {
  imports =
    [
      ./age.nix
      ./bat.nix
      ./difftastic.nix
      ./dust.nix # du
      ./eza.nix
      ./fd.nix
      ./fzf.nix
      ./gpg.nix
      ./hck.nix # cut
      ./htop.nix
      ./jq.nix
      ./moor.nix
      ./ouch.nix # compress / decompress
      ./pik.nix # interactive kill
      ./ripgrep.nix
      ./sd.nix
      ./tree.nix
      ./yazi.nix
      ./zellij.nix # tmux like
      ./zoxide.nix
    ]
    ++ import ./extras.nix;

  config = lib.mkIf config.modules.tools.enable {
    home.sessionPath = [
      "${config.home.homeDirectory}/.local/bin"
    ];
    home.sessionVariables = {
      PAGER = "moor";
    };
  };
}
