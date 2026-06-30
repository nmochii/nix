{
  config,
  lib,
  ...
}:
lib.mkIf config.modules.editor.enable {
  programs.helix = {
    languages.language-server = {
      ruff = {
        command = "ruff";
        args = ["server"];
      };
      pyright = {
        command = "pyright-langserver";
        args = ["--stdio"];
        config.python.analysis = {
          autoImportCompletions = true;
        };
      };
      emmet-ls = {
        command = "emmet-ls";
        args = ["--stdio"];
      };
      yaml-language-server.config.yaml = {
        completion = true;
        validation = true;
        hover = true;
        schemas = {
          kubernetes = [
            "*deployment*"
            "*service*"
            "*svc*"
            "*configmap*"
            "*secret*"
            "*pod*"
            "*namespace*"
            "*ingress*"
            "*egress*"
            "*volume*"
            "*pv*"
            "*pvc*"
            "*kube*"
          ];
        };
      };
    };
    languages.language = [
      {
        name = "nix";
        formatter.command = "alejandra";
        auto-format = true;
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
          "pyright"
        ];
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
        auto-format = false;
        language-servers = ["typescript-language-server"];
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
        auto-format = false;
        language-servers = ["typescript-language-server"];
        formatter = {
          command = "prettier";
          args = [
            "--parser"
            "typescript"
          ];
        };
      }
      {
        name = "yaml";
        file-types = ["yaml" "yml"];
        language-servers = ["yaml-language-server"];
      }
    ];
  };
}
