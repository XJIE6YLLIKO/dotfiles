{ pkgs, ... }: 
{
  programs.git = {
    enable = true;
    
    userName = "XJIE6";
    userEmail = "fazz25@duck.com";
    
    extraConfig = { 
      init.defaultBranch = "main";
      credential.helper = "manager";
      credential.credentialStore = "secretservice";
    };
  };

    home.packages = with pkgs; [ git-credential-manager ];
  # home.packages = [ pkgs.gh pkgs.git-lfs ];
}
