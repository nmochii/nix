{
  programs.ssh.matchBlocks = {
    "11.205.62.* 10.205.61.*" = {
      extraOptions = {
        ProxyJump = "bastion.tools.olfeo.tech";
      };
    };
    "*.tools.ovh.olfeo.com" = {
      extraOptions = {
        ProxyJump = "bastion.tools.olfeo.tech";
      };
    };
  };
}
