{
  user,
  pkgs,
  ...
}: {
  system.stateVersion = "25.05";

  boot.loader.grub = {
    enable = true;
    device = "/dev/vda";
  };

  networking = {
    hostName = "virtual-mochi";
    useDHCP = true;
    firewall.enable = false;
    nameservers = ["1.1.1.1"];
  };

  security.sudo.wheelNeedsPassword = false;

  services = {
    qemuGuest.enable = true;
    openssh = {
      enable = true;
      settings.PasswordAuthentication = true;
      settings.PermitRootLogin = "no";
    };
    getty.autologinUser = user.name;
    xserver.xkb = {
      layout = "us";
      variant = "intl";
      options = ["ctrl:nocaps"];
    };
  };
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    git
    helix
  ];

  programs.fish.enable = true;
}
