{ self, pkgs, lib, inputs, ...}: 
{
  # imports = [ inputs.nix-gaming.nixosModules.default.nix ];
  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
      substituters = [ "https://nix-gaming.cachix.org" ];
      trusted-public-keys = [ "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4=" ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };
  nixpkgs = {
    overlays = [
      inputs.hyprpanel.overlay
      (final: prev: {
        nvchad = inputs.nvchad4nix.packages."${pkgs.system}".nvchad;
      })
      inputs.nur.overlay
    ];
  };

  environment.systemPackages = with pkgs; [
    inputs.zen-browser.packages."${system}".specific
    wget
    git
  ];

  time.timeZone = "Europe/Moscow";
  i18n.defaultLocale = "en_US.UTF-8";
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "24.11";
}
