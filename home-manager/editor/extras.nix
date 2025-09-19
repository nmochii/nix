{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # lsp
    tinymist # typst
    vscode-langservers-extracted # web
    typescript-language-server
    emmet-ls
    ruff
    bash-language-server
    gopls
    rust-analyzer
    dockerfile-language-server
    docker-compose-language-service
    yaml-language-server
    terraform-ls
    marksman
    angular-language-server
    # fmt
    yamlfmt
    nixfmt-rfc-style
    nodePackages.prettier
  ];
}
