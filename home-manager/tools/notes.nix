{
  config,
  lib,
  inputs,
  system,
  pkgs,
  user,
  mylib,
  ...
}:
lib.mkIf config.modules.tools.enable {
  home.packages = [
    inputs.clin.packages.${system}.default
    pkgs.glow # deps
  ];

  home.shellAliases = {
    notes = "clin";
  };

  age.secrets.clin = {
    file = ../../secrets/clin.age;
    path = "${config.xdg.configHome}/clin/key.bin";
  };

  home.file."${config.xdg.configHome}/clin/config.toml".source = mylib.mkToml "clin-config" {
    core = {
      storage_path = "${user.SSoT}/notes/";
      mouse_enabled = true;
    };
    editor = {
      external_enabled = true;
      preview_enabled = false;
    };
    backup = {
      enabled = true;
      backup_on_save = true;
      backup_on_quit = true;
    };
    list = {
      preview_enabled = true;
      preview_encryption = false;
      show_date_in_list = true;
      default_view = "tree";
      pinned_on_top = true;
      show_line_numbers = true;
    };
    graf = {
      preview_enabled = true;
    };
  };
}
