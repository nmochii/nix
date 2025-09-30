{
  pkgs,
  config,
  user,
  ...
}:
{
  home.packages = [ pkgs.postgresql ];
  age.secrets.pgpass = {
    file = ../../../secrets/olfeo/pgpass.age;
    path = "/home/${user.name}/.pgpass";
  };

  programs.pgcli = {
    enable = true;
  };
}
