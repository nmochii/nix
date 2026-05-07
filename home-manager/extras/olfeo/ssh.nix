{
  programs.ssh.settings = {
    "11.205.62.* 10.205.61.*" = {
      ProxyJump = "bastion.tools.olfeo.tech";
    };
    "*.tools.ovh.olfeo.com" = {
      ProxyJump = "bastion.tools.olfeo.tech";
    };
  };
}
