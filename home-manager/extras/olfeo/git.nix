{
  programs.git = {
    ignores = [
      "criticality.yaml"
    ];
    extraConfig.url."ssh://git@gitlab.olfeo.tech/".insteadOf = "https://gitlab.olfeo.tech/";
  };
}
