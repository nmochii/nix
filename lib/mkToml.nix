{pkgs}: let
  tomlFormat = pkgs.formats.toml {};
in
  name: conf: tomlFormat.generate name conf
