{ user, pkgs, ... }:
{
  home.packages = with pkgs.python313Packages; [
    python-lsp-server
  ];

  programs.helix = {
    languages.language-server = {
      ruff = {
        command = "ruff";
        args = [ "server" ];
      };
      emmet-ls = {
        command = "emmet-ls";
        args = [ "--stdio" ];
      };
      pylsp.config.plugins = {
        # mypy.enabled = true;
        # flake8.enabled = false;
        # autopep8.enabled = false;
        # mccabe.enabled = false;
        # pycodestyle.enabled = false;
        # pyflakes.enabled = false;
        # yapf.enabled = false;
        # pylint.enabled = false;
        # black.enabled = false;
        # rope_autoimport.enable = false;
        # rope_auto_completion.enabled = false;
        # jedi.enabled = true;
      };
      # angular-ls = {
      #   command = "ngserver";
      #   args = [
      #     "--stdio"
      #     "--tsProbeLocations"
      #     "${pkgs.typescript}/bin/tsserver"
      #     "--ngProbeLocations"
      #     "/etc/profiles/per-user/${user.name}/bin"
      #   ];
      # };
    };
    languages.language = [
      {
        name = "nix";
        auto-format = true;
        formatter.command = "nixfmt";
      }
      {
        name = "go";
        auto-format = true;
      }
      {
        name = "python";
        auto-format = true;
        language-servers = [
          "ruff"
          "pylsp"
        ];
        # formatter = {
        #   command = "bash";
        #   args = [
        #     "-c"
        #     "ruff check --select I --fix . && ruff format -q ."
        #   ];
        # };
      }
      {
        name = "html";
        auto-format = false;
        language-servers = [
          "vscode-html-language-server"
          "emmet-ls"
        ];
        formatter = {
          command = "prettier";
          args = [
            "--parser"
            "html"
          ];
        };
      }
      {
        name = "typescript";
        auto-format = true;
        language-servers = [ "typescript-language-server" ];
        formatter = {
          command = "prettier";
          args = [
            "--parser"
            "typescript"
          ];
        };
      }
      {
        name = "javascript";
        auto-format = true;
        language-servers = [ "typescript-language-server" ];
        formatter = {
          command = "prettier";
          args = [
            "--parser"
            "typescript"
          ];
        };
      }
      # {
      #   name = "yaml";
      #   auto-format = true;
      #   language-servers = [
      #     "typescript-language-server"
      #     "yaml-language-server"
      #   ];
      #   formatter = {
      #     command = "yamlfmt";
      #     args = [ "-" ];
      #   };
      # }
    ];
  };
}
