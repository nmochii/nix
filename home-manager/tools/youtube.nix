{
  youtube,
  system,
  ...
}: let
  yt-pkg = youtube.packages."${system}".default;
in {
  home.packages = [
    yt-pkg
  ];

  home.shellAliases = {
    youtube = yt-pkg.meta.mainProgram;
  };
}
