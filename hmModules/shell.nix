{ pkgs, user, currentHost, ... }:

{

  programs.fish = {
    enable = true;

    shellAliases = {
      updateSwitch = "sudo nixos-rebuild switch --flake /home/${user}/flake#${currentHost}";
      updateBoot = "sudo nixos-rebuild boot --flake /home/${user}/flake#${currentHost}";
    };

  };

  # programs.zsh = {
  #   enable = true;
  #   enableAutosuggestions = true;

  #   # initExtra = ''
  #   #   eval "$(direnv hook zsh)"
  #   # '';

  #   oh-my-zsh = {
  #     enable = true;
  #     plugins = [ "git" ];
  #     theme = "robbyrussell";
  #   };
  # };

}
