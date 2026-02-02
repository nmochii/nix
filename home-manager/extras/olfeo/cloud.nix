{config, ...}: {
  age.secrets = {
    aws_credentials = {
      file = ../../../secrets/olfeo/aws_credentials.age;
      path = "${config.home.homeDirectory}/.aws/credentials";
    };
    vault-ansible = {
      file = ../../../secrets/olfeo/vault-ansible.age;
      path = "${config.home.homeDirectory}/.ansible/vault-ansible";
    };
    vault-nexus = {
      file = ../../../secrets/olfeo/vault-nexus.age;
      path = "${config.home.homeDirectory}/.ansible/vault-nexus";
    };
  };
  home.file.".aws/config".text = ''
    [plugins]
    endpoint = awscli_plugin_endpoint

    [profile default]
    region = gra
    s3 =
      endpoint_url = https://s3.gra.io.cloud.ovh.net
      signature_version = s3v4
    s3api =
      endpoint_url = https://s3.gra.io.cloud.ovh.net
  '';
}
