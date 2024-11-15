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
            "subnut/nvim-ghost.nvim",
              name = "nvim_ghost",
              config = function()
                vim.api.nvim_create_autocmd('User', {
                    group = "nvim_ghost_user_autocommands",
                    pattern = "*reddit.com",
                    command = 'setfiletype markdown'
                    })
            end,
              keys = {
                { "<leader>ug", ":call nvim_ghost#enable(0)<cr>", desc = "GhostTextStart", silent = true },
              },
          },

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
          {
            'Wansmer/langmapper.nvim',
            lazy = false,
            priority = 1, -- High priority is needed if you will use `autoremap()`
              config = function()
                require('langmapper').setup({--[[ your config ]]})
              end
          },
          {
            "ngtuonghy/runner-nvchad",
            config = function()
              require("runner-nvchad").setup{
                clear_cmd = true,
                autoremove = true
              }
            end
          }
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
        vim.opt.relativenumber = true
        require("runner-nvchad").setup{}



        local function escape(str)
        -- You need to escape these characters to work correctly
        local escape_chars = [[;,."|\]]
        return vim.fn.escape(str, escape_chars)
        end

        -- Recommended to use lua template string
        local en = [[`qwertyuiop[]asdfghjkl;'zxcvbnm]]
        local ru = [[ёйцукенгшщзхъфывапролджэячсмить]]
        local en_shift = [[~QWERTYUIOP{}ASDFGHJKL:"ZXCVBNM<>]]
        local ru_shift = [[ËЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ]]

        vim.opt.langmap = vim.fn.join({
            -- | `to` should be first     | `from` should be second
            escape(ru_shift) .. ';' .. escape(en_shift),
            escape(ru) .. ';' .. escape(en),
            }, ',')

        require('langmapper').automapping({ global = true, buffer = true })
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

