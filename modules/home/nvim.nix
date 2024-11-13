#{ pkgs, ... }:
#{
#  programs.neovim = {
#    enable = true;
#    vimAlias = true;
#    defaultEditor = true;
    # plugins = with pkgs.vimPlugins; [
      # nvchad
      # nvchad-ui
    # ];
  # };
# }

{ config, pkgs, inputs, ... }: {  # <-- inputs from flake
  
  home.sessionVariables.EDITOR = "nvim";
  home.sessionVariables.VISUAL = "nvim";
  
  nixpkgs = { 
    overlays = [
      (final: prev: {
        nvchad = inputs.nvchad4nix.packages."${pkgs.system}".nvchad;
      })
    ];
  };
  # home.packages = with pkgs; [ pkgs.nvchad ];
  imports = [
    inputs.nvchad4nix.homeManagerModule
  ];
  programs.nvchad = {
    enable = true;

    extraPlugins =  '' 
    return {
      { 
        {
        "kylechui/nvim-surround",
          version = "*", -- Use for stability; omit to use `main` branch for the latest features
            event = "VeryLazy",
          config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
                })
        end 
        },

        "ngtuonghy/runner-nvchad",
        config = function()
          require("runner-nvchad").setup{
            clear_cmd = true,
            autoremove = true
          }
          end
      }
    }
    '';

    chadrcConfig = ''
      ---@type ChadrcConfig
      local M={}

      M.base46 = {
        theme = "catppuccin",
        transparency = false,
        theme_toggle = { "catppuccin", "chadracula-evondev" }
      }

      M.colorify = {
        enabled = true,
        mode = "virtual"
      }

      return M
    '';

    extraConfig = ''
      local map = vim.keymap.set
      map("n", "<leader>rc", "<cmd>Runner<CR>", { desc = "Run code" })
      map("v", "<leader>rf", "<cmd>Runnerfast<CR>", { desc = "Run code select" })
      require("runner-nvchad").setup{}
    '';

    extraPackages = with pkgs; [
      nodePackages.bash-language-server
      nixd
      ast-grep
      (python3.withPackages(ps: with ps; [
        python-lsp-server
        flake8
      ]))
    ];
    hm-activation = true;
    backup = false;
  };
}

