#
# Here's a showcase of how to use the `config` and `options`.
# home-manager modules are functions that take a set of options and return a set of options.
# for functions see: https://nix.dev/tutorials/nix-language.html#functions
#
# By declaring options, we can override it in the home.nix.
#
{
  config,
  pkgs,
  lib,
  ...
}: {
  # config set will be merge into your home.nix.
  config = {
    # Install powerlevel10k
    home.packages = with pkgs; [
      zsh-powerlevel10k
    ];

    programs.zsh = {
      # Add powerlevel10k to end of .zshrc.
      # to find files those installed by zsh-powerlevel10k, use following command:
      # ```shell
      # nix store ls --recursive "$(nix build nixpkgs#zsh-powerlevel10k --print-out-paths --no-link)"
      # ```shell
      #
      # After that we found that the powerlevel10k init script is located at:
      # `<path of zsh-zsh-powerlevel10k>/share/zsh-powerlevel10k/powerlevel10k.zsh-theme`
      # So we add it to the first line of initExtra,
      # and we also need to source the user config,
      # so add it to the second line using `cfg.configFile`.
      #
      initExtra = ''
        '.' '${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme'
        '.' "$HOME/${config.programs.zsh.dotDir}/.p10k.zsh"
      '';
    };
  };
}
