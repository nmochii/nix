{
  config,
  inputs,
  lib,
  system,
  ...
}: let
  oyo-pkg = inputs.oyo.packages."${system}".default;
in
  lib.mkIf config.modules.tools.enable {
    home.packages = [
      oyo-pkg
    ];

    programs.jujutsu.settings = lib.mkIf config.programs.jujutsu.enable {
      merge-tools.oyo = {
        program = oyo-pkg.meta.mainProgram;
        diff-args = ["$left" "$right"];
        paginate = "never";
      };
      aliases.oyo = ["diff" "--tool" "oyo"];
    };
  }
