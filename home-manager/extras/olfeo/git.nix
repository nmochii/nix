{
  programs.git = {
    ignores = [
      "criticality.yaml"
    ];
    settings.url."ssh://git@gitlab.olfeo.tech/".insteadOf = "https://gitlab.olfeo.tech/";
  };
}
