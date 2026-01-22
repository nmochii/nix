{
  oyo,
  system,
  ...
}: let
  oyo-pkg = oyo.packages."${system}".default;
in {
  home.packages = [
    oyo-pkg
  ];

  programs.jujutsu.settings = {
    merge-tools.oyo = {
      program = oyo-pkg.meta.mainProgram;
      diff-args = ["$left" "$right"];
      paginate = "never";
    };
    aliases.oyo = ["diff" "--tool" "oyo"];
  };
}
