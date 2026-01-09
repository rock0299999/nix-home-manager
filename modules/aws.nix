{
  config,
  inputs,
  lib,
  outputs,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    awscli2
  ];

#  home.sessionVariables = {
#    AWS_CONFIG_FILE = "${config.xdg.configHome}/aws/config";
#    AWS_CREDENTIALS_FILE = "${config.xdg.configHome}/aws/credentials";
#    AWS_CLI_HISTORY_FILE = "${config.xdg.dataHome}/aws/history";
#    AWS_WEB_IDENTITY_TOKEN_FILE = "${config.xdg.dataHome}/aws/token";
#    AWS_SHARED_CREDENTIALS_FILE = "${config.xdg.dataHome}/aws/shared-credentials";
#  };

  programs.zsh.initExtra = ''
    '.' '${pkgs.awscli2}/bin/aws_zsh_completer.sh'
  '';
}
