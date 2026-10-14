{
  user,
  pkgs,
  ...
}: let
  shell = user.shell or "bash";
  shellPkgs = {
    fish = pkgs.fish;
    nu = pkgs.nushell;
    bash = pkgs.bash;
  };
in {
  users.users.${user.name} = {
    isNormalUser = true;
    description = user.fullName;
    extraGroups = ["wheel"];
    shell = shellPkgs.${shell};
  };

  time.timeZone = "Europe/Paris";
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "fr_FR.UTF-8";
      LC_IDENTIFICATION = "fr_FR.UTF-8";
      LC_MEASUREMENT = "fr_FR.UTF-8";
      LC_MONETARY = "fr_FR.UTF-8";
      LC_NAME = "fr_FR.UTF-8";
      LC_NUMERIC = "fr_FR.UTF-8";
      LC_PAPER = "fr_FR.UTF-8";
      LC_TELEPHONE = "fr_FR.UTF-8";
      LC_TIME = "fr_FR.UTF-8";
    };
  };

  nix.settings = {
    experimental-features = ["nix-command" "flakes"];
  };

  nixpkgs.config.allowUnfree = true;

  programs.fish.enable = shell == "fish";
  programs.nushell.enable = shell == "nu";
}
