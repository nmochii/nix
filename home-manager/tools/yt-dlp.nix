{
  home.shellAliases = {
    "dl:mp3" = "yt-dlp -t mp3";
    "dl:mp4" = "yt-dlp -t mp4";
    "dl:mkv" = "yt-dlp -t mkv";
  };

  programs.yt-dlp = {
    enable = true;
    extraConfig = "--default-search ytsearch";
  };
}
