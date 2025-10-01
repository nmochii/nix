{
  pkgs,
  user,
  ...
}: {
  home.packages = with pkgs; [
    terraform
    ansible
  ];
  programs.awscli.enable = true;

  age.secrets = {
    aws_credentials = {
      file = ../../../secrets/olfeo/aws_credentials.age;
      path = "/home/${user.name}/.aws/credentials";
    };
    vault-ansible = {
      file = ../../../secrets/olfeo/vault-ansible.age;
      path = "/home/${user.name}/.ansible/vault-ansible";
    };
    vault-nexus = {
      file = ../../../secrets/olfeo/vault-nexus.age;
      path = "/home/${user.name}/.ansible/vault-nexus";
    };
  };
  home.file.".aws/config".text = ''
    [plugins]
    endpoint = awscli_plugin_endpoint

    [profile ovh-nexus]
    region = gra
    s3 =
      endpoint_url = https://s3.gra.io.cloud.ovh.net
      signature_version = s3v4
    s3api =
      endpoint_url = https://s3.gra.io.cloud.ovh.net
  '';
}
