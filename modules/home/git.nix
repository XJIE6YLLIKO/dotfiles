{ pkgs, ... }: 
{
  programs.git = {
    enable = true;
    
    userName = "XJIE6";
    userEmail = "fazz25@duck.com";
    
    extraConfig = { 
      init.defaultBranch = "main";
      credential.helper = "store";
    };
  };

  # home.packages = [ pkgs.gh pkgs.git-lfs ];
}
