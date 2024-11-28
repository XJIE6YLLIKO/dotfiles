{pkgs, inputs, ... }: 
{
  # home.sessionVariables.EDITOR = "nvim";
  # home.sessionVariables.VISUAL = "neovide";
  
  programs.neovide = {
    enable = true;
    settings = {
      fork = false;
      frame = "full";
      idle = true;
      maximized = false;
      neovim-bin = "/etc/profiles/per-user/xjie6/bin/nvim";
      no-multigrid = false;
      srgb = false;
      tabs = true;
      theme = "auto";
      title-hidden = true;
      vsync = true;
      wsl = false;

      font = {
        normal = ["JetBrainsMono Nerd Font Propo"];
        size = 14.0;
      };
    };
  };


  nixpkgs = { 
    overlays = [
      (final: prev: {
        nvchad = inputs.nvchad4nix.packages."${pkgs.system}".nvchad;
      })
    ];
  };
  imports = [
    inputs.nvchad4nix.homeManagerModule
  ];
  programs.nvchad = {
    enable = true;

    extraPlugins =  '' 
      return {
        {
          {
            "mfussenegger/nvim-dap",
            config = function()
              local dap = require "dap"
              dap.adapters.cppdbg = {
                id = 'cppdbg',
                type = 'executable',
                command = '${pkgs.vscode-extensions.ms-vscode.cpptools}/debugAdapters/bin/OpenDebugAD7',
              }
            end
          },

          {
            "mfussenegger/nvim-dap-python",
            config = function()
              require("dap-python").setup("python3")
            end
          },

          {
            "rcarriga/nvim-dap-ui",
            dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio", "mfussenegger/nvim-dap-python"},
            event = "VeryLazy",
            config = function()
              local dap, dapui = require "dap", require "dapui"
                dapui.setup({
                  -- icons = { expanded = "▾", collapsed = "▸", current_frame = "»" },
                  -- mappings = {
                  --   -- Use a table to apply multiple mappings
                  --   expand = { "<CR>", "<2-LeftMouse>" },
                  --   open = "o",
                  --   remove = "d",
                  --   edit = "e",
                  --   repl = "r",
                  --   toggle = "t",
                  -- },
                  -- layouts = {
                  --   {
                  --     elements = {
                  --       'scopes',
                  --       -- 'breakpoints',
                  --       'stacks',
                  --       -- 'watches',
                  --     },
                  --     size = 40,
                  --     position = 'left',
                  --   },
                  --   {
                  --     elements = {
                  --       'repl',
                  --       --    'console',
                  --     },
                  --     size = 10,
                  --     position = 'bottom',
                  --   },
                  -- },
                  -- floating = {
                  --   max_height = nil, -- These can be integers or a float between 0 and 1.
                  --   max_width = nil, -- Floats will be treated as percentage of your screen.
                  --   border = "rounded", -- Border style. Can be "single", "double" or "rounded"
                  --   mappings = {
                  --     close = { "q", "<Esc>" },
                  --   },
                  -- },
                  -- controls = {
                  --   -- Requires Neovim nightly (or 0.8 when released)
                  --   enabled = false, -- because the icons don't work
                  --   -- Display controls in this element
                  --   element = "repl",
                  --   icons = {
                  --     pause = "",
                  --     play = "",
                  --     step_into = "",
                  --     step_over = "",
                  --     step_out = "",
                  --     step_back = "",
                  --     run_last = "",
                  --     terminate = "",
                  --   },
                  -- },
                  -- windows = { indent = 1 },
                })

                -- add listeners to auto open DAP UI
                dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
                dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
                dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end

                vim.keymap.set('n', '<leader>db', function() require("dap").toggle_breakpoint() end, { desc = "Toggle Breakpoints" })
                vim.keymap.set('n', '<leader>dB', function() require("dap").clear_breakpoints() end, { desc = "Clear Breakpoints" })
                vim.keymap.set('n', '<leader>dc', function() require("dap").continue() end, { desc = "Continue" })
                vim.keymap.set('n', '<F5>', function() require("dap").continue() end, { desc = "Continue2" })
                vim.keymap.set('n', '<leader>di', function() require("dap").step_into() end, { desc = "Step Into" })
                vim.keymap.set('n', '<F3>', function() require("dap").step_into() end, { desc = "Step Into2" })
                vim.keymap.set('n', '<leader>dl', function() require("dapui").float_element "breakpoints" end, { desc = "List Breakpoints" })
                vim.keymap.set('n', '<leader>do', function() require("dap").step_over() end, { desc = "Step Over" })
                vim.keymap.set('n', '<F2>', function() require("dap").step_over() end, { desc = "Step Over2 " })
                vim.keymap.set('n', '<leader>dO', function() require("dap").step_out() end, { desc = "Step Out" })
                vim.keymap.set('n', '<F4>', function() require("dap").step_out() end, { desc = "Step Out2" })
                -- gives error, but docs say it's ok?
                -- vim.keymap.set('n', {'<leader>dq', '<F7>'}, function() require("dap").close() dapui.close() end, { desc = "Close Session" })
                vim.keymap.set('n', '<leader>dq', function() require("dap").close() dapui.close() end, { desc = "Close Session" })
                vim.keymap.set('n', '<F7>', function() require("dap").close() dapui.close() end, { desc = "Close Session" })

                vim.keymap.set('n', '<leader>dQ', function()
                  dap = require("dap")
                  dap.terminate()
                  dap.close()
                  dapui.close()
                end
                )
                vim.keymap.set('n', '<F6>', function()
                  dap = require("dap")
                  dap.terminate()
                  dap.close()
                  dapui.close()
                end, { desc = "Terminate" })

                vim.keymap.set('n', '<leader>dr', function() require("dap").repl.toggle() end, { desc = "REPL" })
                vim.keymap.set('n', '<leader>dS', function() require("dapui").float_element "scopes" end, { desc = "Scopes" })
                vim.keymap.set('n', '<leader>dt', function() require("dapui").float_element "stacks" end, { desc = "Threads" })
                vim.keymap.set('n', '<leader>du', function() require("dapui").toggle() end, { desc = "Toggle Debugger UI" })
                vim.keymap.set('n', '<leader>dw', function() require("dapui").float_element "watches" end, { desc = "Watches" })
                vim.keymap.set('n', '<leader>dx', function() require("dap.ui.widgets").hover() end, { desc = "Inspect" })

              end
          },

          {
            "neovim/nvim-lspconfig",
            config = function()
              require "configs.lspconfig"
            end,
          },

          {
            "nvim-treesitter/nvim-treesitter-context",
          },

          {
            "spywhere/detect-language.nvim",
            config = function()
              require("detect-language").setup({})
            end
          },

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
          },

          {
            "kevinhwang91/nvim-ufo",
            dependencies = { "kevinhwang91/promise-async" },
            event = "VeryLazy",
            config = function()
              vim.o.foldcolumn = '0' -- '0' is not bad
              vim.o.foldlevel = 99 
              -- Using ufo provider need a large value, feel free to decrease the value vim.o.foldlevelstart = 99
              vim.o.foldenable = true

              -- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
              vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
              vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
              local handler = function(virtText, lnum, endLnum, width, truncate)
                  local newVirtText = {}
                  local suffix = (' 󰁂 %d '):format(endLnum - lnum)
                  local sufWidth = vim.fn.strdisplaywidth(suffix)
                  local targetWidth = width - sufWidth
                  local curWidth = 0
                  for _, chunk in ipairs(virtText) do
                      local chunkText = chunk[1]
                      local chunkWidth = vim.fn.strdisplaywidth(chunkText)
                      if targetWidth > curWidth + chunkWidth then
                          table.insert(newVirtText, chunk)
                      else
                          chunkText = truncate(chunkText, targetWidth - curWidth)
                          local hlGroup = chunk[2]
                          table.insert(newVirtText, {chunkText, hlGroup})
                          chunkWidth = vim.fn.strdisplaywidth(chunkText)
                          -- str width returned from truncate() may less than 2nd argument, need padding
                          if curWidth + chunkWidth < targetWidth then
                              suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
                          end
                          break
                      end
                      curWidth = curWidth + chunkWidth
                  end
                  table.insert(newVirtText, {suffix, 'MoreMsg'})
                  return newVirtText
              end

              require('ufo').setup({
                  fold_virt_text_handler = handler,
                  provider_selector = function(bufnr, filetype, buftype)
                      return {'treesitter', 'indent'}
                  end
              })
            end,
          },
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
      if vim.g.neovide then

          -- Put anything you want to happen only in Neovide here
        vim.g.neovide_hide_mouse_when_typing = true
        vim.g.neovide_refresh_rate_idle = 5
        vim.keymap.set('n', '<C-s>', ':w<CR>') -- Save
        vim.keymap.set('v', '<C-c>', '"+y') -- Copy
        vim.keymap.set('n', '<C-v>', '"+P') -- Paste normal mode
        vim.keymap.set('v', '<C-v>', '"+P') -- Paste visual mode
        vim.keymap.set('c', '<C-v>', '<C-R>+') -- Paste command mode
        vim.keymap.set('i', '<C-v>', '<ESC>l"+Pli') -- Paste insert mode
      end

      local map = vim.keymap.set
      -- DAP binds
      
      -- CodeRunner binds
      map("n", "<leader>rc", "<cmd>Runner<CR>", { desc = "Run code" })
      map("v", "<leader>rf", "<cmd>Runnerfast<CR>", { desc = "Run code select" })
      -- SetFileType + LSP binds
      map("n", "<leader>ftp", "<cmd>setfiletype python | LspStart<CR>", { desc = "Set filetype to Python" })
      map("n", "<leader>fth", "<cmd>setfiletype html | LspStart<CR>", { desc = "Set filetype to HTML" })
      map("n", "<leader>ftc", "<cmd>setfiletype css | LspStart<CR>", { desc = "Set filetype to CSS" })
      map("n", "<leader>ft=", "<cmd>setfiletype cpp | LspStart<CR>", { desc = "Set filetype to C++" })

      vim.opt.relativenumber = true


      require("runner-nvchad").setup{}
      require("detect-language").setup{ disable = {new = true, score_list = true, }}
      require("nvim-treesitter.configs").setup{
        context = {
          enable = true
        }
      }

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
      vscode-langservers-extracted
      vscode-extensions.ms-vscode.cpptools
      prettierd
      (python3.withPackages(ps: with ps; [
        debugpy
        python-lsp-server
        basedpyright
        flake8
      ]))
    ];
    hm-activation = true;
    backup = false;
  };
}

