{ pkgs, user, currentHost, ... }:

{
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;

    # initExtra = ''
    #   eval "$(direnv hook zsh)"
    # '';

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "robbyrussell";
    };
  };

}

