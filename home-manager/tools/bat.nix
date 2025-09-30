{
  programs.bat = {
    enable = true;
    config = {
      theme = "Nord";
    };
  };

  home.shellAliases = {
    cat = "bat --paging=never -p";
  };
}
