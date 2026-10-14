{lib, ...}: {
  options.modules = {
    editor.enable = lib.mkEnableOption "editor";
    shell.enable = lib.mkEnableOption "shell";
    terminal.enable = lib.mkEnableOption "terminal";
    tools = {
      enable = lib.mkEnableOption "CLI tools";
      extrasEnable = lib.mkEnableOption "more CLI tools";
    };
    ui.enable = lib.mkEnableOption "desktop UI";
    vcs.enable = lib.mkEnableOption "version control";
  };

  imports = [
    ./editor
    ./shell
    ./terminal
    ./tools
    ./ui
    ./vcs
  ];
}
