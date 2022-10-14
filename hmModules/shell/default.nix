{ pkgs, user, currentSystem, ... }:

{


  programs.fish = {
    enable = true;

    shellAliases = {
      update = "sudo nixos-rebuild switch --flake /home/${user}/flake#${currentSystem}";
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
