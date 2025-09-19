{ user, ... }:
{
  programs.librewolf = {
    enable = true;
    policies = {
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableTelemetry = true;
    };
    profiles.default = {
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
