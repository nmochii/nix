{
  config,
  pkgs,
  ...
}: {
  home.packages = [pkgs.postgresql];
  age.secrets.pgpass = {
    file = ../../../secrets/olfeo/pgpass.age;
    path = "${config.home.homeDirectory}/.pgpass";
  };

  programs.pgcli = {
    enable = true;
    settings = {
      main.keyring = false;
    };
  };
}
