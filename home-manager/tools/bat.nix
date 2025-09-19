{
  programs.bat = {
    enable = true;
    config = {
      theme = "TwoDark";
    };
  };

  home.shellAliases = {
    cat = "bat --paging=never -p";
  };
}
