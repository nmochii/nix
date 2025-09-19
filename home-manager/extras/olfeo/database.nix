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
  };
  home.activation = {
    pgpass = ''
      cp ${config.age.secrets.pgpass.path} /home/${user.name}/.pgpass
      chmod 0600 /home/${user.name}/.pgpass
    '';
  };
}
