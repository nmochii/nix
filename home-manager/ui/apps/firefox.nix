{user, ...}: {
  programs.firefox = {
    enable = true;
    policies = {
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableTelemetry = true;
      ExtensionSettings = {
        # ublock origin
        "uBlock0@raymondhill.net" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed";
        };
        # bitwarden
        "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi";
          installation_mode = "force_installed";
        };
      };
    };
    profiles.default = {
      settings = {
        # open previous windows and tabs
        "browser.startup.page" = 3;
      };
      search = {
        force = true;
        default = "startpage";
        engines = {
          "startpage" = {
            urls = [
              {
                template = "https://www.startpage.com/rvd/search?query={searchTerms}";
              }
            ];
            iconUpdateURL = "https://www.startpage.com/favicon.ico";
            shortcut = "s"; # Alias like @d for quick searches
          };
        };
        order = [
          "startpage"
          "ddg"
          "wiki"
          "google"
        ];
      };
      bookmarks = {
        force = true;
        settings = [
          {
            toolbar = true;
            bookmarks = user.bookmarks.firefox;
          }
        ];
      };
    };
  };
}
