{pkgs, ...}: {
  programs.git = {
    settings.url."ssh://git@gitlab.olfeo.tech/".insteadOf = "https://gitlab.olfeo.tech/";
  };

  programs.jujutsu.settings = {
    "--scope" = [
      {
        "--when".repositories = ["~/work/olfeo"];
        signing.key = "EEE69178";
        user.email = "albert.khe@ekinops.com";
        templates.git_push_bookmark = ''description.first_line().replace(regex:"].*|\\[", "")'';
      }
    ];
  };
}
